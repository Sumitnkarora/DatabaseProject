--
-- Don't edit below here.
--
DECLARE @id INT, @isWindows BIT, @loginName sysname, @sid VARBINARY(85), @password NVARCHAR(32), @userName sysname, @roleName sysname;
DECLARE @sql NVARCHAR(MAX);

DECLARE curff_users CURSOR FAST_FORWARD READ_ONLY FOR
	SELECT Id, IsWindows, LoginName, SID, Password, UserName FROM #Users;

OPEN curff_users;
	FETCH NEXT FROM curff_users INTO @id, @isWindows, @loginName, @sid, @password, @userName;
	WHILE @@FETCH_STATUS = 0
	BEGIN
		PRINT '--'
		PRINT '-- Id: ' + CAST(@id AS VARCHAR) + ', Windows: ' + CAST(@isWindows AS VARCHAR) + ', Login: ' + ISNULL(@loginName, '<null>') + ', User: ' + ISNULL(@userName, '<null>')
		PRINT '--'

		IF @loginName IS NOT NULL AND NOT EXISTS ( SELECT TOP 1 1 FROM sys.server_principals WHERE name = @loginName )
		BEGIN
			IF @isWindows = 1 AND SUSER_SID(@loginname) IS NOT NULL
			BEGIN
				SET @sql = 'CREATE LOGIN ' + QUOTENAME(@loginName) + ' FROM WINDOWS;';
				PRINT '-- Created Windows Login ' + @loginName;
			END
			ELSE IF @isWindows = 1
			BEGIN
				PRINT '-- Cannot map a SID for ' + @loginName + ' from active directory. Not creating login.'
			END
			ELSE BEGIN
				IF @password IS NULL
				BEGIN
					SELECT @password = coalesce(@password, '') + n
					FROM (SELECT top 16
					CHAR(number) n FROM
					master..spt_values
					WHERE type = 'P' AND 
					( number BETWEEN ASCII('!') AND ASCII(')')
					OR number between ascii(0) and ascii(9)
					or number between ascii('A') and ascii('Z')
					or number between ascii('a') and ascii('z'))
					ORDER BY newid()) a;

					UPDATE #Users SET Password = @password WHERE ID = @id;
				END
				
				SET @sql = 'CREATE LOGIN ' + QUOTENAME(@loginName) + ' WITH PASSWORD=''' + REPLACE(@password, '''', '''''') + '''';
				PRINT '-- Created login ' + @loginName + ' with random password >> ' + @password + ' <<'
			END

			IF @printOnly = 0 AND @createLogins = 1
			BEGIN
				EXEC(@sql);
			END
			ELSE BEGIN
				IF @printOnly = 0
				BEGIN
					PRINT '-- No login could be found for the login ' + @loginName + ' the SQL which would have been executed is: '
					PRINT '-- ' + @sql
				END
				ELSE BEGIN
					PRINT @sql;
				END
				
			END
		END
		ELSE IF @loginName IS NULL
		BEGIN
			PRINT '-- There is no login defined for user ' + @userName;
		END
		ELSE BEGIN
			PRINT '-- Login for the login ' + @loginName + ' already exists.'
		END
		
		IF @loginName IS NOT NULL
		BEGIN
			IF EXISTS ( SELECT TOP 1 1 FROM sys.server_principals WHERE name = @loginName )
			BEGIN
				SELECT @sid = sid FROM sys.server_principals WHERE name = @loginName;
				UPDATE #Users SET SID = @sid WHERE ID = @id;
			END
			ELSE IF @printOnly = 0 BEGIN
				PRINT '-- No SID Mapping could be found for the login ' + @loginName;
			END
		END

		IF @userName IS NULL
		BEGIN
			SET @userName = @loginName;
			UPDATE #Users SET UserName = @userName WHERE ID = @id;
		END

		IF	( @sid IS NOT NULL AND NOT EXISTS ( SELECT TOP 1 1 FROM sys.database_principals WHERE sid = @sid ) )
		OR	( @sid IS NULL AND NOT EXISTS ( SELECT TOP 1 1 FROM sys.database_principals WHERE name = @loginName ) )
		AND NOT EXISTS ( SELECT TOP 1 1 FROM sys.database_principals WHERE name = @userName )
		BEGIN
			IF (@loginName IS NULL)
			BEGIN
				IF @userName LIKE '%\%' AND SUSER_SID(@userName) IS NULL
				BEGIN
					PRINT '-- Cannot create user ' + @userName + ' as it is a windows account which no longer exists.';
					SET @sql = '';
				END
				ELSE BEGIN
					SET @sql = 'CREATE USER ' + QUOTENAME(@userName) + ' WITHOUT LOGIN';
					PRINT '-- Created user ' + @userName + ' with no login'
				END
				
			END
			ELSE BEGIN
				SET @sql = 'CREATE USER ' + QUOTENAME(@userName) + ' FOR LOGIN ' + QUOTENAME(@loginName);
				PRINT '-- Created user ' + @userName + ' for login ' + @loginName
			END

			IF @printOnly = 1
			BEGIN
				PRINT @sql;
			END
			ELSE IF @sql <> '' BEGIN
				EXEC(@sql);
			END
		END
		ELSE IF @loginName IS NULL BEGIN
			PRINT '-- User ' + @userName + ' with no login already exists.'
		END
		ELSE BEGIN
			PRINT '-- User for the login ' + @loginName + ' under user ' + @userName + ' already exists.'
		END
		
		DECLARE curff_roles CURSOR FOR
			SELECT UserName, RoleName FROM #RoleAssignments WHERE UserName = @userName;
	
		OPEN curff_roles;
			FETCH NEXT FROM curff_roles INTO @userName, @roleName;
			WHILE @@FETCH_STATUS = 0
			BEGIN
				IF @ignoreRoleDoesntExist = 0 AND NOT EXISTS ( SELECT TOP 1 1 FROM sys.database_principals WHERE type = 'R' AND name = @roleName )
				BEGIN
					PRINT '-- Cannot add user ' + @userName + ' to role ' + @roleName + ' as role does not exist';
				END
				ELSE IF NOT EXISTS ( SELECT TOP 1 1 FROM sys.database_principals WHERE name = @userName )
				BEGIN
					PRINT '-- Cannot add user ' + @userName + ' to role ' + @roleName + ' as user does not exist';
				END
				ELSE BEGIN 
					IF NOT EXISTS ( SELECT TOP 1 1 FROM sys.database_role_members WHERE member_principal_id = USER_ID(@userName) AND role_principal_id = USER_ID(@roleName) )
					BEGIN
						SET @sql = 'sys.sp_addrolemember @rolename = ''' + REPLACE(@roleName, '''', '''''') + ''', @membername = ''' + REPLACE(@userName, '''', '''''') + '''';

						IF @printOnly = 1
						BEGIN
							PRINT @sql;
						END
						ELSE BEGIN
							EXEC(@sql);
							PRINT '-- User ' + @userName + ' has been added to role ' + @roleName;
						END
					END
					ELSE BEGIN
						PRINT '-- User ' + @userName + ' is already in role ' + @roleName;
					END
				END
				FETCH NEXT FROM curff_roles INTO @userName, @roleName;
			END
		CLOSE curff_roles;
		DEALLOCATE curff_roles;

		PRINT ''

		FETCH NEXT FROM curff_users INTO @id, @isWindows, @loginName, @sid, @password, @userName;
	END

CLOSE curff_users;
DEALLOCATE curff_users;
SET NOCOUNT OFF
