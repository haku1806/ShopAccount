/*** Table Article***/
CREATE TABLE [dbo].[Article](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MenuId] [int] NOT NULL,
	[Title] [nvarchar](255) NULL,
	[Alias] [varchar](255) NULL,
	[Image] [varchar](max) NULL,
	[Index] [int] NULL,
	[ShortDescription] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Active] [bit] NOT NULL,
	[Created] [datetime] NOT NULL,
 CONSTRAINT [PK_Article] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

/*** Table Attribute***/
CREATE TABLE [dbo].[Attribute](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Attribute] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/*** Table Customer***/
CREATE TABLE [dbo].[Customer](
	[Code] [varchar](32) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [varchar](124) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Avatar] [varchar](max) NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[Address] [nvarchar](500) NULL,
	[Dob] [date] NULL,
	[Gender] [nvarchar](10) NULL,
	[LastLogin] [datetime] NULL,
	[OTP] [varchar](32) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

/*** Table EmailConfiguration***/
CREATE TABLE [dbo].[EmailConfiguration](
	[Id] [int] NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_EmailConfiguration] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/*** Table EmailRegistration***/
CREATE TABLE [dbo].[EmailRegistration](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Created] [datetime] NOT NULL,
 CONSTRAINT [PK_EmailRegistration] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/*** Table EmailSignUp***/
CREATE TABLE [dbo].[EmailSignUp](
	[Email] [nvarchar](50) NOT NULL,
	[OTP] [varchar](10) NOT NULL,
 CONSTRAINT [PK_EmailSignUp] PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/*** Table EmailTemplate***/
CREATE TABLE [dbo].[EmailTemplate](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](100) NOT NULL,
	[Subject] [nvarchar](500) NULL,
	[CC] [nvarchar](255) NULL,
	[BCC] [nvarchar](255) NULL,
	[KeyGuide] [nvarchar](500) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_EmailTemplate] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

/*** Table Gallery***/
CREATE TABLE [dbo].[Gallery](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Image] [varchar](max) NOT NULL,
	[Type] [int] NOT NULL,
 CONSTRAINT [PK_Gallery] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

/*** Table Menu***/
CREATE TABLE [dbo].[Menu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ParentMenu] [int] NULL,
	[Group] [varchar](10) NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Alias] [varchar](255) NOT NULL,
	[Index] [int] NULL,
	[ShowHomePage] [bit] NULL,
	[Type] [varchar](50) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/*** Table Order***/
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerCode] [varchar](32) NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[Address] [nvarchar](500) NULL,
	[TotalAmount] [float] NULL,
	[Status] [int] NOT NULL,
	[Note] [nvarchar](500) NULL,
	[Created] [datetime] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/*** Table OrderDetail***/
CREATE TABLE [dbo].[OrderDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NULL,
	[ProductName] [nvarchar](255) NOT NULL,
	[ProductImage] [varchar](max) NULL,
	[ProductPrice] [float] NULL,
	[ProductDiscountPrice] [float] NULL,
	[Qty] [int] NULL,
	[Attribute] [nvarchar](500) NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

/*** Table Product***/
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MenuId] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Alias] [varchar](255) NOT NULL,
	[Image] [varchar](max) NULL,
	[Index] [int] NULL,
	[Status] [int] NULL,
	[Price] [float] NULL,
	[DiscountPrice] [float] NULL,
	[Selling] [bit] NULL,
	[ShortDescription] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

/*** Table ProductAttribute***/
CREATE TABLE [dbo].[ProductAttribute](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[AttributeId] [int] NOT NULL,
	[Value] [nvarchar](500) NULL,
 CONSTRAINT [PK_ProductAttribute] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/*** Table ProductImage***/
CREATE TABLE [dbo].[ProductImage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Image] [varchar](max) NULL,
 CONSTRAINT [PK_ProductImage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

/*** Table ProductRelated***/
CREATE TABLE [dbo].[ProductRelated](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[ProductRelatedId] [int] NOT NULL,
 CONSTRAINT [PK_ProductRelated] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/*** Table Review***/
CREATE TABLE [dbo].[Review](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderDetailId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Star] [int] NULL,
	[Content] [nvarchar](500) NULL,
	[Status] [int] NOT NULL,
	[Created] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Review] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/*** Table User***/
CREATE TABLE [dbo].[User](
	[UserName] [varchar](32) NOT NULL,
	[Password] [varchar](124) NULL,
	[FullName] [nvarchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[LastLogin] [datetime] NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/*** Table User***/
CREATE TABLE [dbo].[Website](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Logo] [varchar](max) NOT NULL,
	[PhoneNumber] [nvarchar](255) NULL,
	[Fax] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[Location] [varchar](max) NULL,
	[Facebook] [nvarchar](255) NULL,
	[Youtube] [nvarchar](255) NULL,
	[Copyright] [nvarchar](255) NULL,
 CONSTRAINT [PK_Website] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]