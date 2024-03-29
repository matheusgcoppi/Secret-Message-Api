BEGIN TRY

BEGIN TRAN;

-- CreateTable
CREATE TABLE [dbo].[UserInfo] (
    [id] INT NOT NULL IDENTITY(1,1),
    [name] NVARCHAR(1000) NOT NULL,
    [pin] NVARCHAR(1000) NOT NULL,
    [email] NVARCHAR(1000),
    [pintwo] NVARCHAR(1000) NOT NULL,
    [text] TEXT,
    CONSTRAINT [UserInfo_pkey] PRIMARY KEY CLUSTERED ([id]),
    CONSTRAINT [UserInfo_pin_key] UNIQUE NONCLUSTERED ([pin])
);

-- CreateTable
CREATE TABLE [dbo].[Text] (
    [id] INT NOT NULL IDENTITY(1,1),
    [text] TEXT NOT NULL,
    [pin] NVARCHAR(1000) NOT NULL,
    [author] NVARCHAR(1000),
    CONSTRAINT [Text_pkey] PRIMARY KEY CLUSTERED ([id])
);

COMMIT TRAN;

END TRY
BEGIN CATCH

IF @@TRANCOUNT > 0
BEGIN
    ROLLBACK TRAN;
END;
THROW

END CATCH
