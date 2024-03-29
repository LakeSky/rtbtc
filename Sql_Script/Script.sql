USE [meis007]
GO
/****** Object:  FullTextCatalog [meis007]    Script Date: 03/27/2013 17:01:17 ******/
CREATE FULLTEXT CATALOG [meis007]WITH ACCENT_SENSITIVITY = ON
AS DEFAULT
AUTHORIZATION [dbo]
GO
/****** Object:  StoredProcedure [dbo].[spfetchGeneralResultCriteria3]    Script Date: 03/27/2013 17:01:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE 
 [dbo].[spfetchGeneralResultCriteria3](@ColumnNameAsOut varchar(100),@TableName varchar(100),
	@ColumnFilter varchar(100),@ColumnValue varchar(100),@ColumnFilter1 varchar(100),@ColumnValue1 varchar(100),@ColumnFilter2 varchar(100),@ColumnValue2 varchar(100),@QryFlag int
)  
AS  
BEGIN 
	Declare @sqlstr as varchar(1000)
	if @QryFlag = 0  
	    BEGIN
		set @sqlstr =  'select ' + @ColumnNameAsOut + ' from ' + @TableName + ' where ' + @ColumnFilter + ' ='''  + @columnValue + ''''  + ' and  ' +  @ColumnFilter1 + ' ='''  + @columnValue1 + '''' + ' and  ' +  @ColumnFilter2 + ' ='''  + @columnValue2 + ''''  
	    END
	ELSE
	    BEGIN
		set @sqlstr =  'select ' + @ColumnNameAsOut + ' from ' + @TableName + ' where ' + @ColumnFilter + ' = '  + @columnValue  + ' and  ' +  @ColumnFilter1 + ' ='''  + @columnValue1 + ' and  ' +  @ColumnFilter2 + ' ='''  + @columnValue2 
	    END
	execute(@sqlstr)
            END
GO
/****** Object:  StoredProcedure [dbo].[spfetchGeneralResultCriteria2]    Script Date: 03/27/2013 17:01:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE 
 [dbo].[spfetchGeneralResultCriteria2] (@ColumnNameAsOut varchar(100),@TableName varchar(100),
	@ColumnFilter varchar(100),@ColumnValue varchar(100),@ColumnFilter1 varchar(100),@ColumnValue1 varchar(100),@QryFlag int
)  
AS  
BEGIN 
	Declare @sqlstr as varchar(1000)
	if @QryFlag = 0  
	    BEGIN
		set @sqlstr =  'select ' + @ColumnNameAsOut + ' from ' + @TableName + ' where ' + @ColumnFilter + ' ='''  + @columnValue + ''''  + ' and  ' +  @ColumnFilter1 + ' ='''  + @columnValue1 + '''' 
	    END
	ELSE
	    BEGIN
		set @sqlstr =  'select ' + @ColumnNameAsOut + ' from ' + @TableName + ' where ' + @ColumnFilter + ' = '  + @columnValue  + ' and  ' +  @ColumnFilter1 + ' ='''  + @columnValue1 
	    END
	execute(@sqlstr)
            END
GO
/****** Object:  StoredProcedure [dbo].[spfetchGeneralResult]    Script Date: 03/27/2013 17:01:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE 
 [dbo].[spfetchGeneralResult] (@ColumnNameAsOut varchar(100),@TableName varchar(100),
	@ColumnFilter varchar(100),@ColumnValue varchar(100),@QryFlag int
)  
AS  
BEGIN 
	Declare @sqlstr as varchar(1000)
	if @QryFlag = 0  
	    BEGIN
		set @sqlstr =  'select ' + @ColumnNameAsOut + ' from ' + @TableName + ' where ' + @ColumnFilter + ' ='''  + @columnValue + '''' 
	    END
	ELSE
	    BEGIN
		set @sqlstr =  'select ' + @ColumnNameAsOut + ' from ' + @TableName + ' where ' + @ColumnFilter + ' = '  + @columnValue 
	    END
	execute(@sqlstr)
            END
GO
/****** Object:  StoredProcedure [dbo].[spfetchDetailsWithCriteria3]    Script Date: 03/27/2013 17:01:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spfetchDetailsWithCriteria3]
(
	@ColumnName varchar(100),
	@TableName varchar(100),
	@ColumnCriteria1 varchar(100),
	@ColumnValue1 varchar(100),
	@ColumnCriteria2 varchar(100),
	@ColumnValue2 varchar(100),
	@ColumnCriteria3 varchar(100),
	@ColumnValue3 varchar(100),	
	@ColumnSort varchar(100)
)
AS 
	Declare @sqlstr as varchar(1000)
	set @sqlstr =  'select ' + @ColumnName + ' from ' + @TableName + ' where ' + @ColumnCriteria1 + '=''' +   @ColumnValue1  +''' and ' + @ColumnCriteria2 + '=''' +   @ColumnValue2  + ''' and ' + @ColumnCriteria3 + '=''' +   @ColumnValue3  +''' order by ' + @ColumnSort
	execute(@sqlstr)
GO
/****** Object:  StoredProcedure [dbo].[spfetchDetailsWithCriteria2]    Script Date: 03/27/2013 17:01:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spfetchDetailsWithCriteria2]
(
	@ColumnName varchar(100),
	@TableName varchar(100),
	@ColumnCriteria1 varchar(100),
	@ColumnValue1 varchar(100),
	@ColumnCriteria2 varchar(100),
	@ColumnValue2 varchar(100),
	@ColumnSort varchar(100)
)
AS 
	Declare @sqlstr as varchar(1000)
	set @sqlstr =  'select ' + @ColumnName + ' from ' + @TableName + ' where ' + @ColumnCriteria1 + '=''' +   @ColumnValue1  +''' and ' + @ColumnCriteria2 + '=''' +   @ColumnValue2  +''' order by ' + @ColumnSort
	execute(@sqlstr)
GO
/****** Object:  StoredProcedure [dbo].[spfetchDetailsWithCriteria]    Script Date: 03/27/2013 17:01:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spfetchDetailsWithCriteria]
(
	@ColumnName varchar(100),
	@TableName varchar(100),
	@ColumnCriteria varchar(100),
	@ColumnValue varchar(100),
	@ColumnSort varchar(100)
)
AS 
	Declare @sqlstr as varchar(1000)
	set @sqlstr =  'select ' + @ColumnName + ' from ' + @TableName + ' where ' + @ColumnCriteria + '=''' +   @ColumnValue  +''' order by ' + @ColumnSort
	execute(@sqlstr)
GO
/****** Object:  StoredProcedure [dbo].[spfetchDetails]    Script Date: 03/27/2013 17:01:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spfetchDetails] 
(
	@ColumnName varchar(500),
	@TableName varchar(500),
	@ColumnSort varchar(100)
)
AS 
	Declare @sqlstr as varchar(1000)
	set @sqlstr =  'select ' + @ColumnName + ' from ' + @TableName + ' order by ' + @ColumnSort
	execute(@sqlstr)
GO
/****** Object:  StoredProcedure [dbo].[spRAfetchGeneralResult]    Script Date: 03/27/2013 17:01:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE 
 [dbo].[spRAfetchGeneralResult] (@ColumnNameAsOut varchar(100),@TableName varchar(100),
	@ColumnFilter varchar(100)=null,@ColumnValue varchar(100)=null,@QryFlag int,@OrderBy varchar(100)=null,@Criteria varchar(500)=null

)  
AS  
BEGIN 
--QryFlag 0 means --- ColumnValue contains string value
--QryFlag 1 means --- without any Colum Filter

	Declare @sqlstr as varchar(1000)
	if @QryFlag = 0  
	    BEGIN
		set @sqlstr =  'select ' + @ColumnNameAsOut + ' from ' + @TableName + ' where ' + @ColumnFilter + ' ='''  + @columnValue + '''' + ' Order By ' + @OrderBy
	    END
	ELSE if @QryFlag = 1 
	    BEGIN
		set @sqlstr =  'select ' + @ColumnNameAsOut + ' from ' + @TableName +  ' Order By ' + @OrderBy
	    END
	ELSE if @QryFlag = 2
	    BEGIN
		set @sqlstr =  'select ' + @ColumnNameAsOut + ' from ' + @TableName + ' where ' + @ColumnFilter + ' = '  + @columnValue  + ' Order By ' + @OrderBy
	    END
	ELSE if @QryFlag = 3
	    BEGIN
		set @sqlstr =  'select ' + @ColumnNameAsOut + ' from ' + @TableName  + @Criteria
	    END
	    ELSE if @QryFlag = 4
	    BEGIN
		set @sqlstr =  'select ' + @ColumnNameAsOut + ' from ' + @TableName + ' where ' + @ColumnFilter + ' = '''  + @columnValue  + ''''
	    END
print @sqlstr
	execute(@sqlstr)
            END
GO
/****** Object:  StoredProcedure [dbo].[spusermasterSearch]    Script Date: 03/27/2013 17:01:32 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[spusermasterSearch]
(
	@ColName  varchar(100),
	@ColValue varchar(100),
	@type char(1),
	@flgsrch int = 0

)
AS
Declare @sqlstr as varchar(4000)
set @sqlstr = 'select *from tblusermaster where ' + @ColName
if @type <> 'i'
Begin
if @flgsrch = 1
	Begin
		set @sqlstr = @sqlstr + ' like''%' + @ColValue + '%'''
	End
else if @flgsrch = 2
	Begin
		set @sqlstr = @sqlstr + ' like''' + @ColValue + '%'''
	End
else if @flgsrch = 3
	Begin
		set @sqlstr = @sqlstr + '=''' + @ColValue + ''''
	End  
End 

Execute(@sqlstr)
--Print(@sqlstr)
GO
/****** Object:  StoredProcedure [dbo].[spRatesHFetch]    Script Date: 03/27/2013 17:01:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spRatesHFetch] 

(

@DateFrom smalldatetime, @DateTo Date ,@CityId nvarchar(100),@LocID int=null,@ProductName nvarchar(200)=null,

@ServiceId int,@ClsId int=null,@CustomerID nvarchar(50),@flg int = 0,@VirtualDirectory nvarchar(100)=null

) as

 

begin

 

Create table #HeaderInfo

(

      RecordLocator int IDENTITY (1,1) NOT NULL,

      ProductID bigint, ProductName varchar(200),     ratehid bigint,   weekdays nvarchar(20),     weekenddays nvarchar(20),

      supplierid nvarchar(50),      CurId nvarchar(10),     serviceCharges float,      Commission float, HHRemarks varchar(1000),

      hotelTel nvarchar(50),  hotelFax nvarchar(50),  hotelemail nvarchar(50),      Allmarket bit,  allDays bit,

      RateDid bigint,Seasonid bigint,DateFrom smalldatetime,DateTo smalldatetime,

      MarkupIP int,MarkupIA float,CancelPolicy nvarchar(100),

      CancelAmt float,CancelDays int,childPolicy nvarchar(100), ExtraBed float ,HDremarks nvarchar(1000)

      ,ProductAddress nvarchar(100),ThumbnailPath nvarchar(100),ShortDescription nvarchar(1000),ClsName nvarchar(100),CityName nvarchar(200),aRate float)
 

Declare @SqlStr nvarchar(4000)

Set @SqlStr = 
'insert into #HeaderInfo  select 

      H.ProductID ,     H.Description ,   H.ratehid , H.weekdays ,      H.weekenddays ,      H.supplierid ,    H.CurId ,   H.serviceCharges ,

      H.Commission ,    H.Remarks , H.hotelTel ,      H.hotelFax ,      H.hoteemail ,      H.Allmarket ,     H.allDays ,

      D.RateDid , D.Seasonid ,      D.DateFrom ,      D.DateTo,   D.MarkupIP ,      D.MarkupIA ,      D.CancelPolicy ,

      D.CancelAmt ,     D.CancelDays ,    D.childPolicy ,   D.ExtraBed  ,     D.remarks ,P.Address,P.ThumbnailPath,P.ShortDescription,F.ClsName,C.CityName,0

from 

RateHeader H , RateDetail  D ,CityMaster C,LocationMaster L ,ProductMaster P,ServicesMaster S,Classifications F

where  

H.RateHID= D.RateHID  and

H.ProductID = P.ProductID and P.LocID = L.LocID and L.CityID = C.CityID and  P.ServiceID = S.ServiceID and P.ClsID = F.ClsID and

P.ServiceID =' + Convert(Varchar,@ServiceId) +'  and 

 (''' + Convert(Varchar,@DateFrom) + '''<= D.Dateto and ''' + Convert(Varchar,@DateTo) + ''' >= D.DateFrom )

and h.Publish = 1 and C.CityID = ''' + Convert(Varchar,@CityId) + ''''

if @ProductName is not null 

begin

Set @SqlStr = @SqlStr + ' AND P.ProductName like ''%' + Convert(Varchar,@ProductName) + '%''  '

end

if @ClsId is not null 

 begin 

 Set @SqlStr = @SqlStr + ' And P.ClsID = ' + Convert(Varchar,@ClsId) 

 end

if @LocID is not null 

 begin 

 Set @SqlStr = @SqlStr + ' And L.LocID = ' + Convert(Varchar,@LocID) 

 end

--Print @SqlStr   

Execute (@SqlStr)

if @flg = 0
begin
select RecordLocator, ProductID , ProductName,     ratehid ,   weekdays,     weekenddays,supplierid,      CurId,     serviceCharges,      Commission, HHRemarks, hotelTel,  hotelFax,  hotelemail,      Allmarket,  allDays,

      RateDid ,Seasonid ,DateFrom,DateTo,

      MarkupIP,MarkupIA,CancelPolicy,

      CancelAmt,CancelDays,childPolicy, ExtraBed,HDremarks 
      ,ProductAddress,@VirtualDirectory+ThumbnailPath 'ThumbnailPath',ShortDescription,ClsName,CityName,arate
 from #HeaderInfo 
end
else if @flg = 1 

select  rateHid,ratedid,productid,weekdays,weekenddays,curid,ServiceCharges,Commission,allDays,supplierid  from #HeaderInfo 

end 


 

--exec spRatesHFetch @DateFrom='01-JUN-2011',@DateTo='05-JUN-2011',@CityId='JED',@ServiceId=1,@ClsId=1,@CustomerID=1,@flg=1
GO
/****** Object:  StoredProcedure [dbo].[spSearch]    Script Date: 03/27/2013 17:01:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSearch](@flg int = 0,@TableName nvarchar(1000),@ColumnsTxt varchar(1000),@SearchTxt varchar(1000)=null,@SortColumn nvarchar(100)=null) AS
Declare @SqlQry varchar(7000);
if @SearchTxt is not null 
 begin
	set @SqlQry = 'Select ' + @ColumnsTxt + ' from '+ @TableName + ' where ' + convert(varchar(5000),@SearchTxt) +' order by ' + @SortColumn 
print @SqlQry	
execute(@SqlQry)
end
else if @flg =0
begin
set @SqlQry = 'Select ' + @ColumnsTxt + ' from '+ @TableName + ' order by ' + @SortColumn  
print @SqlQry	
execute(@SqlQry)
end
else
begin
set @SqlQry = 'Select ' + @ColumnsTxt + ' from '+ @TableName 
print @SqlQry	
execute(@SqlQry)
end
GO
/****** Object:  Table [dbo].[XMLSuppliers]    Script Date: 03/27/2013 17:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XMLSuppliers](
	[Sno] [int] IDENTITY(1,1) NOT NULL,
	[SupplierID] [nvarchar](10) NULL,
	[SupplierName] [nvarchar](200) NULL,
	[InService] [int] NULL,
	[InternalSupplierID] [nvarchar](50) NULL,
 CONSTRAINT [PK_XMLSuppliers] PRIMARY KEY CLUSTERED 
(
	[Sno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[XMLSupplierCredentials]    Script Date: 03/27/2013 17:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XMLSupplierCredentials](
	[Sno] [int] IDENTITY(1,1) NOT NULL,
	[SupplierID] [nvarchar](10) NULL,
	[ParName] [nvarchar](100) NULL,
	[ParValue] [nvarchar](200) NULL,
	[ExtInfo] [nvarchar](100) NULL,
 CONSTRAINT [PK_XMLSupplierCredentials] PRIMARY KEY CLUSTERED 
(
	[Sno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[XMLHotels]    Script Date: 03/27/2013 17:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XMLHotels](
	[Sno] [bigint] IDENTITY(1,1) NOT NULL,
	[LocHotelid] [nvarchar](50) NULL,
	[XMLhotelid] [nvarchar](50) NULL,
	[XMLHotelName] [nvarchar](100) NULL,
	[XMLSupplierID] [nvarchar](10) NULL,
	[InService] [int] NULL,
	[ModDate] [smalldatetime] NULL,
	[ModUserid] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[XMLCities]    Script Date: 03/27/2013 17:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[XMLCities](
	[Sno] [bigint] IDENTITY(1,1) NOT NULL,
	[LocCityId] [nvarchar](50) NOT NULL,
	[XMLCityId] [nvarchar](50) NOT NULL,
	[XMLCityName] [nvarchar](110) NULL,
	[XMLSupplierID] [varchar](10) NOT NULL,
	[InService] [int] NOT NULL,
	[ModDate] [date] NULL,
	[ModUserid] [nvarchar](50) NULL,
 CONSTRAINT [PK_XMLCities] PRIMARY KEY CLUSTERED 
(
	[Sno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RateSubDetail]    Script Date: 03/27/2013 17:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RateSubDetail](
	[RateSDID] [bigint] IDENTITY(1,1) NOT NULL,
	[RateDID] [bigint] NULL,
	[RCID] [int] NULL,
	[RoomCHID] [int] NULL,
	[RoomCDID] [int] NULL,
	[RateBasisID] [nvarchar](10) NULL,
	[Rate1] [float] NULL,
	[Rate2] [float] NULL,
	[Rate3] [float] NULL,
	[AllocRooms] [int] NULL,
	[ReleaseDays] [int] NULL,
 CONSTRAINT [PK_RateSubDetail] PRIMARY KEY CLUSTERED 
(
	[RateSDID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RatePerDate]    Script Date: 03/27/2013 17:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RatePerDate](
	[Bkgid] [bigint] NULL,
	[BDate] [smalldatetime] NULL,
	[SalesRate] [numeric](18, 5) NULL,
	[PayRate] [numeric](18, 5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RateHeader]    Script Date: 03/27/2013 17:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RateHeader](
	[RateHID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductID] [bigint] NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[WeekDays] [nvarchar](20) NULL,
	[WeekEndDays] [nvarchar](20) NULL,
	[SupplierID] [nvarchar](50) NULL,
	[CurID] [nvarchar](10) NULL,
	[ServiceCharges] [float] NULL,
	[Commission] [float] NULL,
	[HotelTel] [nvarchar](50) NULL,
	[HotelFax] [nvarchar](50) NULL,
	[HoteEmail] [nvarchar](100) NULL,
	[Remarks] [varchar](1000) NULL,
	[AllMarket] [bit] NULL,
	[Publish] [bit] NULL,
	[AllDays] [bit] NULL,
	[userID] [nvarchar](50) NOT NULL,
	[Moddate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_RateHeader] PRIMARY KEY CLUSTERED 
(
	[RateHID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RateDetail]    Script Date: 03/27/2013 17:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RateDetail](
	[RateDID] [bigint] IDENTITY(1,1) NOT NULL,
	[RateHID] [bigint] NULL,
	[Seasonid] [bigint] NOT NULL,
	[DateFrom] [smalldatetime] NOT NULL,
	[DateTo] [smalldatetime] NOT NULL,
	[MarkupIP] [int] NULL,
	[MarkupIA] [float] NULL,
	[CancelPolicy] [nvarchar](50) NULL,
	[CancellationDetails] [nvarchar](4000) NULL,
	[CancelAmt] [float] NULL,
	[CancelDays] [int] NULL,
	[ChildPolicy] [nvarchar](100) NULL,
	[ExtraBed] [float] NULL,
	[Remarks] [nvarchar](1000) NULL,
 CONSTRAINT [PK_RateDetail] PRIMARY KEY CLUSTERED 
(
	[RateDID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RateCategory]    Script Date: 03/27/2013 17:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RateCategory](
	[RCID] [int] IDENTITY(1,1) NOT NULL,
	[RCName] [nvarchar](100) NULL,
	[UserId] [nvarchar](50) NULL,
	[ModDate] [smalldatetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RateBasis]    Script Date: 03/27/2013 17:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RateBasis](
	[RateBasisID] [nvarchar](10) NOT NULL,
	[RateBasisName] [nvarchar](100) NULL,
	[UserId] [nvarchar](50) NULL,
	[ModDate] [smalldatetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[B2CCustomerinfo]    Script Date: 03/27/2013 17:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[B2CCustomerinfo](
	[CustomerSNo] [bigint] IDENTITY(1,1) NOT NULL,
	[CustomerID] [nvarchar](50) NULL,
	[PaxEmail] [nvarchar](100) NULL,
	[PaxFirstName] [nvarchar](100) NULL,
	[PaxMiddleName] [nvarchar](100) NULL,
	[PaxLastName] [nvarchar](100) NULL,
	[PaxTelNo] [nvarchar](25) NULL,
	[PaxmobileNo] [nvarchar](25) NULL,
	[PaxCity] [nvarchar](100) NULL,
	[PaxAdd1] [nvarchar](100) NULL,
	[PaxAdd2] [nvarchar](100) NULL,
	[PaxAdd3] [nvarchar](100) NULL,
	[PaxPassword] [nvarchar](300) NULL,
	[PaxLastLogDatetime] [datetime] NULL,
	[authenicationcode] [nvarchar](300) NULL,
	[InService] [nchar](1) NULL,
 CONSTRAINT [PK_B2CCustomerinfo] PRIMARY KEY CLUSTERED 
(
	[CustomerSNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_WebEvent_Events]    Script Date: 03/27/2013 17:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[aspnet_WebEvent_Events](
	[EventId] [char](32) NOT NULL,
	[EventTimeUtc] [datetime] NOT NULL,
	[EventTime] [datetime] NOT NULL,
	[EventType] [nvarchar](256) NOT NULL,
	[EventSequence] [decimal](19, 0) NOT NULL,
	[EventOccurrence] [decimal](19, 0) NOT NULL,
	[EventCode] [int] NOT NULL,
	[EventDetailCode] [int] NOT NULL,
	[Message] [nvarchar](1024) NULL,
	[ApplicationPath] [nvarchar](256) NULL,
	[ApplicationVirtualPath] [nvarchar](256) NULL,
	[MachineName] [nvarchar](256) NOT NULL,
	[RequestUrl] [nvarchar](1024) NULL,
	[ExceptionType] [nvarchar](256) NULL,
	[Details] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[EventId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BkgMaster]    Script Date: 03/27/2013 17:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BkgMaster](
	[bkgid] [nvarchar](50) NOT NULL,
	[bkglocid] [nvarchar](50) NOT NULL,
	[bkgdate] [smalldatetime] NOT NULL,
	[bkgtype] [nvarchar](1) NOT NULL,
	[bkgstatus] [nvarchar](1) NOT NULL,
	[fromallocation] [nvarchar](1) NULL,
	[customerid] [nvarchar](50) NULL,
	[consultanatid] [nvarchar](50) NULL,
	[custremarks] [nvarchar](500) NULL,
	[custrefno] [nvarchar](50) NULL,
	[SalesRate] [numeric](18, 5) NULL,
	[salescurrid] [nvarchar](10) NULL,
	[salesexrate] [numeric](18, 5) NULL,
	[salesamt] [numeric](18, 5) NULL,
	[basecurratbkg] [nvarchar](10) NULL,
	[supplierid] [nvarchar](50) NULL,
	[supprefno] [nvarchar](50) NULL,
	[suppconfno] [nvarchar](50) NULL,
	[suppremarks] [nvarchar](500) NULL,
	[paycurrid] [nvarchar](10) NULL,
	[payexrate] [numeric](18, 5) NULL,
	[payamt] [numeric](18, 5) NULL,
	[serviceid] [int] NULL,
	[compcode] [nvarchar](10) NULL,
	[compconsulid] [nvarchar](10) NULL,
	[compconsulmarkupamt] [numeric](8, 0) NULL,
	[checkin] [smalldatetime] NULL,
	[checkout] [smalldatetime] NULL,
	[noofnights] [int] NULL,
	[productid] [bigint] NULL,
	[ratehid] [bigint] NULL,
	[ratedid] [bigint] NULL,
	[ratesdid] [bigint] NULL,
	[leadpaxname] [nvarchar](200) NULL,
	[noofrooms] [int] NULL,
	[adults] [int] NULL,
	[children] [int] NULL,
	[paxdetail] [bit] NULL,
	[SalesInvNo] [nvarchar](50) NULL,
	[PurchaseBillNo] [nvarchar](50) NULL,
	[CancellationRec] [numeric](18, 5) NULL,
	[CancellationPay] [numeric](18, 5) NULL,
	[lastmoduserid] [nvarchar](50) NULL,
	[moddate] [smalldatetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductFacilitiesold]    Script Date: 03/27/2013 17:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductFacilitiesold](
	[productID] [bigint] NULL,
	[RCID] [int] NULL,
	[RateHID] [bigint] NULL,
	[RateDID] [bigint] NULL,
	[FID] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductMasterold]    Script Date: 03/27/2013 17:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductMasterold](
	[ProductID] [bigint] NOT NULL,
	[ProductName] [nvarchar](200) NOT NULL,
	[ServiceID] [int] NOT NULL,
	[ClsID] [int] NULL,
	[LocID] [int] NULL,
	[CityID] [nvarchar](100) NULL,
	[CountryID] [nvarchar](50) NOT NULL,
	[ChildAgeFrom] [tinyint] NULL,
	[ChildAgeTo] [tinyint] NULL,
	[NoofRooms] [smallint] NULL,
	[DialingCode] [nvarchar](25) NULL,
	[Tel] [nvarchar](25) NULL,
	[Fax] [nvarchar](25) NULL,
	[Email] [nvarchar](100) NULL,
	[ContactPerson] [nvarchar](100) NULL,
	[Preferred] [bit] NULL,
	[ProductProfile] [nvarchar](50) NULL,
	[ProductImage] [nvarchar](250) NULL,
	[ProductImage2] [nvarchar](50) NULL,
	[ProductImage3] [nvarchar](50) NULL,
	[Remarks] [nvarchar](2000) NULL,
	[HotelChain] [nvarchar](200) NULL,
	[Map] [nvarchar](200) NULL,
	[CheckInTime] [nvarchar](100) NULL,
	[CheckOutTime] [nvarchar](100) NULL,
	[NearestAirport] [nvarchar](200) NULL,
	[DistanceAirport] [nvarchar](100) NULL,
	[Facilities] [nvarchar](300) NULL,
	[CrCardsAccept] [nvarchar](300) NULL,
	[NearestAttraction] [nvarchar](500) NULL,
	[URL] [nvarchar](200) NULL,
	[Source] [nvarchar](100) NULL,
	[UserID] [nvarchar](50) NOT NULL,
	[ModDate] [smalldatetime] NOT NULL,
	[Address] [nvarchar](250) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductMaster]    Script Date: 03/27/2013 17:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductMaster](
	[ProductID] [bigint] NOT NULL,
	[ProductName] [nvarchar](200) NOT NULL,
	[ServiceID] [int] NOT NULL,
	[ClsID] [int] NULL,
	[LocID] [int] NULL,
	[CityID] [nvarchar](100) NULL,
	[CountryID] [nvarchar](50) NOT NULL,
	[CheckInTime] [nvarchar](50) NULL,
	[CheckOutTime] [nvarchar](50) NULL,
	[NoofRooms] [int] NULL,
	[ShortDescription] [nvarchar](1000) NULL,
	[Address] [nvarchar](300) NULL,
	[Longitude] [nvarchar](50) NULL,
	[Latitude] [nvarchar](50) NULL,
	[WebSite] [nvarchar](200) NULL,
	[Tel] [nvarchar](30) NULL,
	[Fax] [nvarchar](30) NULL,
	[Email] [nvarchar](100) NULL,
	[ContactPerson] [nvarchar](100) NULL,
	[CurID] [nvarchar](10) NULL,
	[AccountCode] [nvarchar](50) NULL,
	[IsActive] [bit] NULL,
	[IsSupplier] [bit] NULL,
	[ThumbnailPath] [nvarchar](300) NULL,
	[HotelChain] [nvarchar](200) NULL,
	[NearestAirport] [nvarchar](200) NULL,
	[UserID] [nvarchar](50) NOT NULL,
	[ModDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_ProductMaster] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServicesMaster]    Script Date: 03/27/2013 17:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ServicesMaster](
	[ServiceID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceName] [varchar](100) NOT NULL,
	[UserID] [nvarchar](50) NOT NULL,
	[ModDate] [smalldatetime] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SeasonMaster]    Script Date: 03/27/2013 17:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SeasonMaster](
	[SeasonId] [bigint] IDENTITY(1,1) NOT NULL,
	[SeaName] [nvarchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SearchReference]    Script Date: 03/27/2013 17:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SearchReference](
	[SessionId] [varchar](max) NULL,
	[SearchId] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RoomTypeHeader]    Script Date: 03/27/2013 17:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomTypeHeader](
	[RoomTHID] [bigint] IDENTITY(1,1) NOT NULL,
	[RoomTHName] [nvarchar](100) NULL,
	[ServiceID] [int] NULL,
	[RCID] [int] NULL,
	[UserID] [nvarchar](50) NULL,
	[ModDate] [smalldatetime] NULL,
 CONSTRAINT [PK_RoomTypeHeader] PRIMARY KEY CLUSTERED 
(
	[RoomTHID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTypeMaster]    Script Date: 03/27/2013 17:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTypeMaster](
	[UTID] [int] IDENTITY(1,1) NOT NULL,
	[UserTypeName] [nvarchar](100) NOT NULL,
	[UserID] [nvarchar](50) NOT NULL,
	[ModDate] [smalldatetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserMaster]    Script Date: 03/27/2013 17:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserMaster](
	[userid] [nvarchar](50) NOT NULL,
	[UserName] [nvarchar](100) NULL,
	[Password] [nvarchar](50) NULL,
	[UTID] [nvarchar](50) NULL,
	[IsFreeze] [tinyint] NULL,
	[ModDate] [smalldatetime] NULL,
	[ModUserID] [nvarchar](50) NULL,
	[Islogin] [nvarchar](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[useraccount]    Script Date: 03/27/2013 17:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[useraccount](
	[UName] [nvarchar](50) NULL,
	[UPassword] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TouricoHotelsRoomTypes]    Script Date: 03/27/2013 17:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TouricoHotelsRoomTypes](
	[SearchId] [int] NULL,
	[HotelId] [int] NULL,
	[NumOfBathRooms] [int] NULL,
	[RoomTypeCategory] [varchar](255) NULL,
	[RoomTypeCategoryId] [int] NULL,
	[HotelRoomTypeId] [int] NOT NULL,
	[Nights] [int] NULL,
	[RoomName] [varchar](255) NULL,
	[ProductId] [varchar](max) NULL,
	[RoomId] [int] NOT NULL,
	[IsAvailable] [bit] NULL,
	[StartDate] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TouricoHotelsRoomSupplements]    Script Date: 03/27/2013 17:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TouricoHotelsRoomSupplements](
	[SearchId] [int] NULL,
	[HotelId] [int] NULL,
	[HotelRoomTypeId] [int] NULL,
	[RoomId] [int] NULL,
	[SuppId] [int] NULL,
	[SuppName] [varchar](255) NULL,
	[SuppType] [int] NULL,
	[SuppIsMandatory] [bit] NULL,
	[Price] [decimal](9, 2) NULL,
	[SuppChargeType] [varchar](255) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TouricoHotelsRoomPrices]    Script Date: 03/27/2013 17:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TouricoHotelsRoomPrices](
	[SearchId] [int] NULL,
	[HotelId] [int] NULL,
	[HotelRoomTypeId] [int] NULL,
	[RoomId] [int] NULL,
	[OffSet] [int] NULL,
	[Value] [decimal](9, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TouricoHotelsRoomOccupancy]    Script Date: 03/27/2013 17:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TouricoHotelsRoomOccupancy](
	[SearchId] [int] NULL,
	[HotelId] [int] NULL,
	[HotelRoomTypeId] [int] NULL,
	[RoomId] [int] NULL,
	[AvrNightPrice] [decimal](9, 2) NULL,
	[OccupId] [varchar](max) NULL,
	[Bedding] [varchar](255) NULL,
	[MaxChild] [int] NULL,
	[MaxGuests] [int] NULL,
	[OccupPrice] [decimal](9, 2) NULL,
	[IsPublish] [bit] NULL,
	[Tax] [decimal](9, 2) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TouricoHotelsRoomBoardbase]    Script Date: 03/27/2013 17:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TouricoHotelsRoomBoardbase](
	[SearchId] [int] NULL,
	[HotelId] [int] NULL,
	[HotelRoomTypeId] [int] NULL,
	[RoomId] [int] NULL,
	[BBId] [int] NULL,
	[BBName] [varchar](255) NULL,
	[BBPrice] [decimal](9, 2) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TouricoHotelsRoomAvailability]    Script Date: 03/27/2013 17:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TouricoHotelsRoomAvailability](
	[SearchId] [int] NULL,
	[HotelId] [int] NULL,
	[HotelRoomTypeId] [int] NULL,
	[RoomId] [int] NULL,
	[OffSet] [int] NULL,
	[Status] [varchar](10) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TouricoHotelsPromotion]    Script Date: 03/27/2013 17:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TouricoHotelsPromotion](
	[SearchId] [int] NULL,
	[HotelId] [int] NULL,
	[HotelRoomTypeId] [int] NULL,
	[RoomId] [int] NULL,
	[FromDT] [datetime] NULL,
	[TODT] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TouricoHotelsLoc]    Script Date: 03/27/2013 17:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TouricoHotelsLoc](
	[SearchId] [int] NULL,
	[HotelId] [int] NULL,
	[CountryCode] [varchar](100) NULL,
	[StateCode] [varchar](100) NULL,
	[City] [varchar](255) NULL,
	[SearchingState] [varchar](255) NULL,
	[SearchingCity] [varchar](255) NULL,
	[Location] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[Longitude] [varchar](max) NULL,
	[Latitude] [varchar](max) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TouricoHotelsInfo]    Script Date: 03/27/2013 17:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TouricoHotelsInfo](
	[SessionID] [varchar](max) NULL,
	[SearchId] [int] NULL,
	[BrandId] [int] NULL,
	[BrandName] [varchar](255) NULL,
	[Category] [varchar](255) NULL,
	[PropertySubType] [varchar](255) NULL,
	[NumOfRooms] [int] NULL,
	[MinAvrPrice] [decimal](9, 2) NULL,
	[HotelName] [varchar](max) NULL,
	[BestValue] [bit] NULL,
	[HotelId] [int] NULL,
	[Provider] [varchar](255) NULL,
	[Description] [varchar](max) NULL,
	[Currency] [varchar](100) NULL,
	[Thumb] [varchar](255) NULL,
	[StarsLevel] [decimal](3, 1) NULL,
	[PropertyType] [varchar](100) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[testFun]    Script Date: 03/27/2013 17:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[testFun](
	[col1] [int] NULL,
	[col2] [varchar](100) NULL,
	[col3] [varchar](100) NULL,
	[col4] [varchar](100) NULL,
	[col5] [varchar](100) NULL,
	[col6] [varchar](100) NULL,
	[col7] [varchar](100) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblUserRightsS]    Script Date: 03/27/2013 17:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUserRightsS](
	[UserId] [char](3) NOT NULL,
	[menuid] [char](10) NOT NULL,
	[ReadRight] [bit] NOT NULL,
	[WriteRight] [bit] NOT NULL,
	[ModDate] [smalldatetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblUserRights]    Script Date: 03/27/2013 17:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUserRights](
	[UserId] [char](3) NOT NULL,
	[MenuModule] [varchar](50) NOT NULL,
	[ReadRight] [bit] NOT NULL,
	[WriteRight] [bit] NOT NULL,
	[ModDate] [smalldatetime] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblUserMenuItems]    Script Date: 03/27/2013 17:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUserMenuItems](
	[menuId] [char](10) NULL,
	[menuname] [varchar](100) NULL,
	[menutype] [char](1) NULL,
	[GroupId] [char](10) NULL,
	[Sno] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblUserMaster]    Script Date: 03/27/2013 17:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUserMaster](
	[userid] [nvarchar](10) NOT NULL,
	[UserName] [char](30) NULL,
	[Password] [char](100) NULL,
	[IsSa] [tinyint] NULL,
	[IsFreeze] [tinyint] NULL,
	[EntryDate] [smalldatetime] NULL,
	[CompCode] [char](3) NULL,
	[Dept] [nvarchar](20) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblBookingsTemp]    Script Date: 03/27/2013 17:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBookingsTemp](
	[BookingID] [nvarchar](50) NOT NULL,
	[ServiceID] [nvarchar](50) NOT NULL,
	[CustomerID] [nvarchar](50) NOT NULL,
	[SupplierID] [nvarchar](50) NOT NULL,
	[BookingDate] [smalldatetime] NULL,
	[SalesCurrID] [nvarchar](50) NULL,
	[SalesCurrName] [nvarchar](100) NULL,
	[SalesExRate] [decimal](18, 3) NULL,
	[SalesAmt] [decimal](18, 3) NULL,
	[cxlCustCharges] [decimal](18, 3) NULL,
	[PayCurrID] [nvarchar](50) NULL,
	[PayCurrName] [nvarchar](100) NULL,
	[PayExRate] [decimal](18, 3) NULL,
	[PayAmt] [decimal](18, 3) NULL,
	[cxlSupCharges] [decimal](18, 3) NULL,
	[PaxName] [nvarchar](200) NULL,
	[NoOfAdults] [int] NULL,
	[NoOfChildren] [int] NULL,
	[Narration] [nvarchar](300) NULL,
	[BranchCode] [nvarchar](50) NULL,
	[CostCode] [nvarchar](50) NULL,
	[CheckInDate] [smalldatetime] NULL,
	[CheckOutDate] [smalldatetime] NULL,
	[NoOfNights] [int] NULL,
	[ProductName] [nvarchar](100) NULL,
	[ProductDetails] [nvarchar](200) NULL,
	[BookingStatus] [nvarchar](2) NULL,
	[UserID] [nvarchar](10) NULL,
	[ModDate] [smalldatetime] NULL,
	[UpdateAccounts] [nchar](1) NULL,
	[CustomerRefNo] [nvarchar](50) NULL,
	[SupplierRefNo] [nvarchar](50) NULL,
	[SupConfNo] [nvarchar](50) NULL,
	[Customer_Name] [nvarchar](200) NULL,
	[Supplier_Name] [nvarchar](200) NULL,
	[CountryName] [nvarchar](100) NULL,
	[CityName] [nvarchar](100) NULL,
	[Field1] [nvarchar](100) NULL,
	[Field2] [nvarchar](100) NULL,
	[Field3] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBookings]    Script Date: 03/27/2013 17:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBookings](
	[BookingID] [nvarchar](50) NOT NULL,
	[ServiceID] [nvarchar](50) NOT NULL,
	[CustomerID] [nvarchar](50) NOT NULL,
	[SupplierID] [nvarchar](50) NOT NULL,
	[BookingDate] [smalldatetime] NULL,
	[SalesCurrID] [nvarchar](50) NULL,
	[SalesCurrName] [nvarchar](100) NULL,
	[SalesExRate] [decimal](18, 3) NULL,
	[SalesAmt] [decimal](18, 3) NULL,
	[cxlCustCharges] [decimal](18, 3) NULL,
	[PayCurrID] [nvarchar](50) NULL,
	[PayCurrName] [nvarchar](100) NULL,
	[PayExRate] [decimal](18, 3) NULL,
	[PayAmt] [decimal](18, 3) NULL,
	[cxlSupCharges] [decimal](18, 3) NULL,
	[PaxName] [nvarchar](200) NULL,
	[NoOfAdults] [int] NULL,
	[NoofChildren] [int] NULL,
	[Narration] [nvarchar](300) NULL,
	[BranchCode] [nvarchar](50) NULL,
	[CostCode] [nvarchar](50) NULL,
	[CheckInDate] [smalldatetime] NULL,
	[CheckOutDate] [smalldatetime] NULL,
	[NoOfNights] [int] NULL,
	[ProductName] [nvarchar](100) NULL,
	[ProductDetails] [nvarchar](200) NULL,
	[BookingStatus] [nvarchar](2) NULL,
	[UserID] [nvarchar](10) NULL,
	[ModDate] [smalldatetime] NULL,
	[UpdateAccounts] [nchar](1) NULL,
	[CustomerRefNo] [nvarchar](50) NULL,
	[SupplierRefNo] [nvarchar](50) NULL,
	[SupConfNo] [nvarchar](50) NULL,
	[Customer_Name] [nvarchar](200) NULL,
	[Supplier_Name] [nvarchar](200) NULL,
	[CountryName] [nvarchar](100) NULL,
	[CityName] [nvarchar](100) NULL,
	[Field1] [nvarchar](100) NULL,
	[Field2] [nvarchar](100) NULL,
	[Field3] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblAccounts]    Script Date: 03/27/2013 17:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblAccounts](
	[AccountCode] [nvarchar](30) NOT NULL,
	[ParentAccountCode] [nvarchar](30) NULL,
	[ParentAccount] [bit] NULL,
	[AccountName] [varchar](50) NOT NULL,
	[AccountType] [char](1) NOT NULL,
	[OpeningBalance] [numeric](12, 3) NULL,
	[DC] [char](1) NULL,
	[Debit] [numeric](12, 3) NULL,
	[Credit] [numeric](12, 3) NULL,
	[Subledger] [bit] NULL,
	[BankCash] [char](1) NULL,
	[IsApply] [bit] NULL,
	[UserID] [varchar](10) NOT NULL,
	[ModDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_tblAccounts] PRIMARY KEY CLUSTERED 
(
	[AccountCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SysParameters]    Script Date: 03/27/2013 17:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SysParameters](
	[ParameterName] [varchar](50) NULL,
	[ParameterValue] [varchar](100) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SuppTypeMaster]    Script Date: 03/27/2013 17:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SuppTypeMaster](
	[STID] [nvarchar](10) NOT NULL,
	[STName] [nvarchar](100) NOT NULL,
	[UserID] [nvarchar](50) NOT NULL,
	[ModDate] [smalldatetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SupplierMaster]    Script Date: 03/27/2013 17:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupplierMaster](
	[SupplierID] [nvarchar](50) NOT NULL,
	[SupplierName] [nvarchar](50) NOT NULL,
	[STID] [nvarchar](10) NULL,
	[Address] [nvarchar](300) NULL,
	[CityID] [nvarchar](100) NULL,
	[Telephone] [nvarchar](30) NULL,
	[Fax] [nvarchar](30) NULL,
	[Email] [nvarchar](50) NULL,
	[CurID] [nvarchar](10) NULL,
	[remarks] [nvarchar](100) NULL,
	[BankDetails] [nvarchar](200) NULL,
	[AcCPerson] [nvarchar](100) NULL,
	[AcCPEmail] [nvarchar](100) NULL,
	[AcCPMobile] [nvarchar](30) NULL,
	[AccountCode] [nvarchar](30) NULL,
	[CreditLimit] [decimal](12, 0) NULL,
	[CreditDays] [decimal](12, 0) NULL,
	[WebUserName] [nvarchar](18) NULL,
	[webPassword] [nvarchar](50) NULL,
	[ISXML] [bit] NULL,
	[UserID] [nvarchar](10) NULL,
	[ModDate] [smalldatetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Amenities]    Script Date: 03/27/2013 17:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Amenities](
	[AmenitiesID] [bigint] IDENTITY(1,1) NOT NULL,
	[AmenitiesName] [nvarchar](150) NOT NULL,
	[Amenitytype] [nvarchar](50) NULL,
 CONSTRAINT [PK_Amenities] PRIMARY KEY CLUSTERED 
(
	[AmenitiesID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_Applications]    Script Date: 03/27/2013 17:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Applications](
	[ApplicationName] [nvarchar](256) NOT NULL,
	[LoweredApplicationName] [nvarchar](256) NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](256) NULL,
PRIMARY KEY NONCLUSTERED 
(
	[ApplicationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[LoweredApplicationName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ApplicationName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [aspnet_Applications_Index] ON [dbo].[aspnet_Applications] 
(
	[LoweredApplicationName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Setup_RestorePermissions]    Script Date: 03/27/2013 17:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Setup_RestorePermissions]
    @name   sysname
AS
BEGIN
    DECLARE @object sysname
    DECLARE @protectType char(10)
    DECLARE @action varchar(60)
    DECLARE @grantee sysname
    DECLARE @cmd nvarchar(500)
    DECLARE c1 cursor FORWARD_ONLY FOR
        SELECT Object, ProtectType, [Action], Grantee FROM #aspnet_Permissions where Object = @name

    OPEN c1

    FETCH c1 INTO @object, @protectType, @action, @grantee
    WHILE (@@fetch_status = 0)
    BEGIN
        SET @cmd = @protectType + ' ' + @action + ' on ' + @object + ' TO [' + @grantee + ']'
        EXEC (@cmd)
        FETCH c1 INTO @object, @protectType, @action, @grantee
    END

    CLOSE c1
    DEALLOCATE c1
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Setup_RemoveAllRoleMembers]    Script Date: 03/27/2013 17:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Setup_RemoveAllRoleMembers]
    @name   sysname
AS
BEGIN
    CREATE TABLE #aspnet_RoleMembers
    (
        Group_name      sysname,
        Group_id        smallint,
        Users_in_group  sysname,
        User_id         smallint
    )

    INSERT INTO #aspnet_RoleMembers
    EXEC sp_helpuser @name

    DECLARE @user_id smallint
    DECLARE @cmd nvarchar(500)
    DECLARE c1 cursor FORWARD_ONLY FOR
        SELECT User_id FROM #aspnet_RoleMembers

    OPEN c1

    FETCH c1 INTO @user_id
    WHILE (@@fetch_status = 0)
    BEGIN
        SET @cmd = 'EXEC sp_droprolemember ' + '''' + @name + ''', ''' + USER_NAME(@user_id) + ''''
        EXEC (@cmd)
        FETCH c1 INTO @user_id
    END

    CLOSE c1
    DEALLOCATE c1
END
GO
/****** Object:  Table [dbo].[aspnet_SchemaVersions]    Script Date: 03/27/2013 17:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_SchemaVersions](
	[Feature] [nvarchar](128) NOT NULL,
	[CompatibleSchemaVersion] [nvarchar](128) NOT NULL,
	[IsCurrentVersion] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Feature] ASC,
	[CompatibleSchemaVersion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaxDetails]    Script Date: 03/27/2013 17:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaxDetails](
	[BkgID] [bigint] NULL,
	[PaxName] [nvarchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PackageImages]    Script Date: 03/27/2013 17:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PackageImages](
	[PacImageID] [bigint] IDENTITY(1,1) NOT NULL,
	[PacId] [bigint] NOT NULL,
	[ImageURL] [nvarchar](150) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PackageHeader]    Script Date: 03/27/2013 17:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PackageHeader](
	[PacId] [bigint] IDENTITY(1,1) NOT NULL,
	[PacName] [nvarchar](200) NOT NULL,
	[Countryid] [nvarchar](10) NOT NULL,
	[CityId] [nvarchar](10) NOT NULL,
	[Validfrom] [date] NOT NULL,
	[Validto] [date] NOT NULL,
	[Pacvalue] [float] NOT NULL,
	[DisplayImage] [nvarchar](150) NOT NULL,
	[InService] [int] NOT NULL,
	[DisplaySeq] [int] NULL,
	[ModUser] [nvarchar](10) NOT NULL,
	[ModDate] [date] NOT NULL,
 CONSTRAINT [PK_PackageHeader] PRIMARY KEY CLUSTERED 
(
	[PacId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PackageDetail]    Script Date: 03/27/2013 17:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PackageDetail](
	[PacDetailsID] [bigint] IDENTITY(1,1) NOT NULL,
	[PacId] [bigint] NOT NULL,
	[Sno] [int] NOT NULL,
	[ServiceID] [int] NOT NULL,
	[SupplierID] [nvarchar](50) NOT NULL,
	[PayCruID] [nvarchar](10) NOT NULL,
	[PayExRate] [decimal](12, 9) NOT NULL,
	[PayInBaseCur] [decimal](18, 0) NOT NULL,
	[AccountCode] [varchar](50) NULL,
	[PayAmount] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_PackageDetail] PRIMARY KEY CLUSTERED 
(
	[PacDetailsID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PackageDescription]    Script Date: 03/27/2013 17:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PackageDescription](
	[PacDesID] [bigint] IDENTITY(1,1) NOT NULL,
	[PacId] [bigint] NOT NULL,
	[PacDes] [nvarchar](max) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LocationMaster]    Script Date: 03/27/2013 17:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LocationMaster](
	[LocID] [int] IDENTITY(1,1) NOT NULL,
	[LocName] [nvarchar](200) NULL,
	[CityID] [nvarchar](50) NOT NULL,
	[Maps] [nvarchar](300) NULL,
	[UserID] [nvarchar](50) NULL,
	[ModDate] [smalldatetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InternalMemo]    Script Date: 03/27/2013 17:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InternalMemo](
	[IDescription] [nvarchar](max) NOT NULL,
	[ModUser] [nvarchar](10) NOT NULL,
	[ModDateTime] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupHeader]    Script Date: 03/27/2013 17:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupHeader](
	[GroupID] [bigint] IDENTITY(1,1) NOT NULL,
	[GroupName] [nvarchar](200) NOT NULL,
	[NoOfPassengers] [int] NOT NULL,
	[GroupDate] [date] NOT NULL,
	[InService] [int] NOT NULL,
	[ModUser] [nvarchar](10) NOT NULL,
	[LastModDate] [date] NOT NULL,
 CONSTRAINT [PK_GroupHeader] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupDetail]    Script Date: 03/27/2013 17:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupDetail](
	[GDNo] [bigint] IDENTITY(1,1) NOT NULL,
	[GroupID] [bigint] NOT NULL,
	[SeqNo] [int] NOT NULL,
	[PassengerName] [nvarchar](100) NULL,
	[ConsultantID] [nvarchar](50) NULL,
	[LastModDate] [date] NOT NULL,
 CONSTRAINT [PK_GroupDetail] PRIMARY KEY CLUSTERED 
(
	[GDNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[fInsTouricoDetails]    Script Date: 03/27/2013 17:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[fInsTouricoDetails]
(
	@data varchar(max)
)
RETURNS 
@Result TABLE 
(
	colData varchar(max)
)
AS
BEGIN
	DECLARE @ErrMsg varchar(max)
	DECLARE @delimiterCount int
	DECLARE @rowDelimiter char(1)
	DECLARE @colDelimiter char(1)
	DECLARE @rowValues varchar(max)
	DECLARE @colValues varchar(max)
	DECLARE @fieldValue varchar(max)
	
	-- ^ - Column Separted; ~ - Row Separted;
	--BEGIN TRY

	 Set @delimiterCount = 0
     Set @rowDelimiter = '~'
	 Set @colDelimiter = '^'
	 Set @rowValues = ''
	 
	 While(CHARINDEX(@rowDelimiter,@data,@delimiterCount) <>0 )
		BEGIN		  
		  Set @colValues = LEFT(@data, CHARINDEX(@rowDelimiter,@data,@delimiterCount)-1)
		 While(CHARINDEX(@colDelimiter,@colValues,@delimiterCount) <> 0)
			 BEGIN
				Set @fieldValue = LEFT(@colValues, CHARINDEX(@colDelimiter,@colValues,@delimiterCount)-1)
				IF (ISNUMERIC(@fieldValue) = 1 AND CHARINDEX(',',@fieldValue,0) = 0) Set @rowValues = @rowValues + @fieldValue + ','
				ELSE  Set @rowValues = @rowValues + '''' + @fieldValue + ''','
				Set @colValues = RIGHT (@colValues, LEN(@colValues) - CHARINDEX(@colDelimiter,@colValues,@delimiterCount))	
				IF(CHARINDEX(@colDelimiter,@colValues,@delimiterCount) = 0 AND LEN(@colValues) > 0) Set @colValues = @colValues + @colDelimiter		
			  END
				Set @rowValues = SUBSTRING(@rowValues, 1, LEN(@rowValues)-1)
				Insert into @Result Values (@rowValues)				
				Set @rowValues = ''
				Set @data = RIGHT(@data, LEN(@data) - CHARINDEX(@rowDelimiter,@data,@delimiterCount))					
		 END		
	 --END TRY
--	BEGIN CATCH
--	 Select @ErrMsg = ERROR_MESSAGE()
--		RAISERROR(@ErrMsg,16,1)
--	 END CATCH
	
	RETURN 
END
GO
/****** Object:  Table [dbo].[Facilities]    Script Date: 03/27/2013 17:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facilities](
	[FID] [bigint] IDENTITY(1,1) NOT NULL,
	[FacilityName] [nvarchar](250) NULL,
 CONSTRAINT [PK_Facilities] PRIMARY KEY CLUSTERED 
(
	[FID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[DeleteAllProcedures]    Script Date: 03/27/2013 17:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[DeleteAllProcedures]
As
      declare @procName varchar(500)
      declare cur cursor 
            for select [name] from sysobjects where type = 'P' and (name not like 'aspnet_%' ) 
      open cur
 

      fetch next from cur into @procName
      while @@fetch_status = 0
      begin
            if @procName <> 'DeleteAllProcedures'
                  exec('drop procedure ' + @procName)
                  fetch next from cur into @procName
      end
      close cur
      deallocate cur
GO
/****** Object:  Table [dbo].[CustXMLMarkups]    Script Date: 03/27/2013 17:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustXMLMarkups](
	[MarkupID] [int] NOT NULL,
	[CustomerID] [nvarchar](50) NOT NULL,
	[SupplierID] [nvarchar](50) NOT NULL,
	[Markup] [int] NOT NULL,
	[InService] [bit] NULL,
	[UserID] [nvarchar](50) NOT NULL,
	[ModDate] [smalldatetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustTypeMaster]    Script Date: 03/27/2013 17:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustTypeMaster](
	[CTID] [nvarchar](10) NOT NULL,
	[CTName] [nvarchar](100) NOT NULL,
	[UserID] [nvarchar](50) NOT NULL,
	[ModDate] [smalldatetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerStatus]    Script Date: 03/27/2013 17:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerStatus](
	[StatusId] [smallint] NULL,
	[StatusName] [nvarchar](25) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerMenuItems]    Script Date: 03/27/2013 17:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CustomerMenuItems](
	[menuId] [char](10) NULL,
	[menuname] [varchar](100) NULL,
	[menutype] [char](1) NULL,
	[GroupId] [char](10) NULL,
	[Sno] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CustomerMaster]    Script Date: 03/27/2013 17:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerMaster](
	[CustomerID] [nvarchar](50) NOT NULL,
	[CustomerName] [nvarchar](200) NOT NULL,
	[CTID] [nvarchar](10) NOT NULL,
	[Address] [nvarchar](300) NULL,
	[CityID] [nvarchar](100) NOT NULL,
	[Telephone] [nvarchar](30) NULL,
	[Fax] [nvarchar](30) NULL,
	[Email] [nvarchar](50) NULL,
	[Status] [nvarchar](1) NOT NULL,
	[CrFacility] [nvarchar](1) NOT NULL,
	[CreditDays] [int] NULL,
	[CreditAmount] [numeric](12, 0) NULL,
	[CreditLimit] [numeric](12, 0) NULL,
	[GraceLimit] [numeric](12, 0) NULL,
	[GraceTillDate] [smalldatetime] NULL,
	[CurID] [nvarchar](10) NOT NULL,
	[SalesmanagerID] [nvarchar](50) NULL,
	[InhouseConsultantID] [nvarchar](50) NULL,
	[WebUserName] [nvarchar](18) NULL,
	[WebPassword] [nvarchar](50) NULL,
	[AccountCode] [nvarchar](50) NULL,
	[UserID] [nvarchar](50) NOT NULL,
	[ModDate] [smalldatetime] NOT NULL,
	[LogoName] [nvarchar](50) NULL,
	[AcCPerson] [nvarchar](100) NULL,
	[AcCPEmail] [nvarchar](100) NULL,
	[AcCPMobile] [nvarchar](30) NULL,
	[LocalMarkup] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustConsultantMaster]    Script Date: 03/27/2013 17:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustConsultantMaster](
	[ConsultantID] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[ConsultantName] [nvarchar](150) NOT NULL,
	[CustomerID] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[Fax] [nvarchar](20) NULL,
	[phone] [nvarchar](20) NULL,
	[WebAccessIP] [nvarchar](25) NOT NULL,
	[Markup] [int] NULL,
	[ModDate] [smalldatetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CurrencyMaster]    Script Date: 03/27/2013 17:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CurrencyMaster](
	[CurID] [nvarchar](10) NOT NULL,
	[CurName] [nvarchar](100) NOT NULL,
	[CoName] [nvarchar](50) NULL,
	[ExRate] [decimal](12, 9) NOT NULL,
	[SellingExRate] [decimal](12, 9) NULL,
	[Decimals] [int] NOT NULL,
	[UserID] [nvarchar](50) NOT NULL,
	[ModDate] [smalldatetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CountryMaster]    Script Date: 03/27/2013 17:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CountryMaster](
	[CountryID] [nvarchar](50) NOT NULL,
	[CountryName] [nvarchar](150) NOT NULL,
	[UserID] [nvarchar](50) NOT NULL,
	[ModDate] [smalldatetime] NULL,
	[H2H] [smallint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ControlCodes]    Script Date: 03/27/2013 17:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ControlCodes](
	[CodeID] [varchar](50) NOT NULL,
	[CodeValue] [int] NOT NULL,
	[CodeDescription] [varchar](200) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ContinentMaster]    Script Date: 03/27/2013 17:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContinentMaster](
	[ContinentID] [nvarchar](50) NULL,
	[ContinentName] [nvarchar](150) NULL,
	[UserID] [nvarchar](50) NULL,
	[ModDate] [smalldatetime] NULL,
	[H2H] [smallint] NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[CompanyInfo]    Script Date: 03/27/2013 17:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[CompanyInfo]  as 
begin
select 
a.ParameterValue 'CompanyName',
b.ParameterValue+c.ParameterValue+d.ParameterValue 'Address ',
e.ParameterValue+' Mail: ' + f.ParameterValue 'Comm'

from 
tblSystemParameters a,
tblSystemParameters b,
tblSystemParameters c,
tblSystemParameters d,
tblSystemParameters e,
tblSystemParameters f
where 
A.ParameterName='CompanyName' and 
b.ParameterName='Address1' and 
c.ParameterName='Address2'and 
d.ParameterName='Address3' and 
e.ParameterName='TelFax' and 
f.ParameterName='Mail'
end
GO
/****** Object:  Table [dbo].[Classifications]    Script Date: 03/27/2013 17:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classifications](
	[ClsID] [int] IDENTITY(1,1) NOT NULL,
	[ClsName] [nvarchar](100) NOT NULL,
	[ServiceID] [int] NOT NULL,
	[DisplayOrder] [tinyint] NULL,
	[ImagePath] [nvarchar](200) NULL,
	[UserID] [nvarchar](50) NOT NULL,
	[ModDate] [smalldatetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CityMaster]    Script Date: 03/27/2013 17:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CityMaster](
	[CityID] [nvarchar](100) NOT NULL,
	[CityName] [nvarchar](200) NOT NULL,
	[CountryID] [nvarchar](50) NULL,
	[UserID] [nvarchar](50) NOT NULL,
	[ModDate] [smalldatetime] NOT NULL,
	[H2H] [smallint] NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[bkgMaster_Update_CustmerRefNo]    Script Date: 03/27/2013 17:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[bkgMaster_Update_CustmerRefNo]
(
	@bkgID nvarchar(50),
	@custrefno nvarchar(50),
	@flg int = 0,
	@flg1 int=0,
	@Trans varchar(1),
	@bkgstatus	nvarchar(1)	=null,
	@consultanatid	nvarchar(50)	=null,
	@customerid	nvarchar(50)	=null
	
)
AS
BEGIN
	SET NOCOUNT OFF
	DECLARE @Err int
if @Trans = 'v' -- flag for view data 
begin
	if @flg = 1 -- customer consultant related Fetch 
	begin
		if @flg1 = 1 
		begin
	UPDATE [BkgMaster]
	SET
		[custrefno] = @custrefno
	WHERE
		([bkgid] = @bkgID) AND([consultanatid]=@consultanatid)AND(customerid=@customerid)
END
END

	SET @Err = @@Error


	RETURN @Err
END
END
GO
/****** Object:  Table [dbo].[aspnet_Users]    Script Date: 03/27/2013 17:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Users](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[LoweredUserName] [nvarchar](256) NOT NULL,
	[MobileAlias] [nvarchar](16) NULL,
	[IsAnonymous] [bit] NOT NULL,
	[LastActivityDate] [datetime] NOT NULL,
PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE CLUSTERED INDEX [aspnet_Users_Index] ON [dbo].[aspnet_Users] 
(
	[ApplicationId] ASC,
	[LoweredUserName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [aspnet_Users_Index2] ON [dbo].[aspnet_Users] 
(
	[ApplicationId] ASC,
	[LastActivityDate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UnRegisterSchemaVersion]    Script Date: 03/27/2013 17:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UnRegisterSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128)
AS
BEGIN
    DELETE FROM dbo.aspnet_SchemaVersions
        WHERE   Feature = LOWER(@Feature) AND @CompatibleSchemaVersion = CompatibleSchemaVersion
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_CheckSchemaVersion]    Script Date: 03/27/2013 17:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_CheckSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128)
AS
BEGIN
    IF (EXISTS( SELECT  *
                FROM    dbo.aspnet_SchemaVersions
                WHERE   Feature = LOWER( @Feature ) AND
                        CompatibleSchemaVersion = @CompatibleSchemaVersion ))
        RETURN 0

    RETURN 1
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Applications_CreateApplication]    Script Date: 03/27/2013 17:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Applications_CreateApplication]
    @ApplicationName      nvarchar(256),
    @ApplicationId        uniqueidentifier OUTPUT
AS
BEGIN
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName

    IF(@ApplicationId IS NULL)
    BEGIN
        DECLARE @TranStarted   bit
        SET @TranStarted = 0

        IF( @@TRANCOUNT = 0 )
        BEGIN
	        BEGIN TRANSACTION
	        SET @TranStarted = 1
        END
        ELSE
    	    SET @TranStarted = 0

        SELECT  @ApplicationId = ApplicationId
        FROM dbo.aspnet_Applications WITH (UPDLOCK, HOLDLOCK)
        WHERE LOWER(@ApplicationName) = LoweredApplicationName

        IF(@ApplicationId IS NULL)
        BEGIN
            SELECT  @ApplicationId = NEWID()
            INSERT  dbo.aspnet_Applications (ApplicationId, ApplicationName, LoweredApplicationName)
            VALUES  (@ApplicationId, @ApplicationName, LOWER(@ApplicationName))
        END


        IF( @TranStarted = 1 )
        BEGIN
            IF(@@ERROR = 0)
            BEGIN
	        SET @TranStarted = 0
	        COMMIT TRANSACTION
            END
            ELSE
            BEGIN
                SET @TranStarted = 0
                ROLLBACK TRANSACTION
            END
        END
    END
END
GO
/****** Object:  Table [dbo].[aspnet_Paths]    Script Date: 03/27/2013 17:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Paths](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[PathId] [uniqueidentifier] NOT NULL,
	[Path] [nvarchar](256) NOT NULL,
	[LoweredPath] [nvarchar](256) NOT NULL,
PRIMARY KEY NONCLUSTERED 
(
	[PathId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE CLUSTERED INDEX [aspnet_Paths_index] ON [dbo].[aspnet_Paths] 
(
	[ApplicationId] ASC,
	[LoweredPath] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_Roles]    Script Date: 03/27/2013 17:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Roles](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
	[LoweredRoleName] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](256) NULL,
PRIMARY KEY NONCLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE CLUSTERED INDEX [aspnet_Roles_index1] ON [dbo].[aspnet_Roles] 
(
	[ApplicationId] ASC,
	[LoweredRoleName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_RegisterSchemaVersion]    Script Date: 03/27/2013 17:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_RegisterSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128),
    @IsCurrentVersion          bit,
    @RemoveIncompatibleSchema  bit
AS
BEGIN
    IF( @RemoveIncompatibleSchema = 1 )
    BEGIN
        DELETE FROM dbo.aspnet_SchemaVersions WHERE Feature = LOWER( @Feature )
    END
    ELSE
    BEGIN
        IF( @IsCurrentVersion = 1 )
        BEGIN
            UPDATE dbo.aspnet_SchemaVersions
            SET IsCurrentVersion = 0
            WHERE Feature = LOWER( @Feature )
        END
    END

    INSERT  dbo.aspnet_SchemaVersions( Feature, CompatibleSchemaVersion, IsCurrentVersion )
    VALUES( LOWER( @Feature ), @CompatibleSchemaVersion, @IsCurrentVersion )
END
GO
/****** Object:  StoredProcedure [dbo].[ABCDB_UpdateCustomerRefNo]    Script Date: 03/27/2013 17:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[ABCDB_UpdateCustomerRefNo]
	(
	@bkgID nvarchar(50),
	@custrefno nvarchar(50),
	@flg int = 0,
	@flg1 int=0,
	@Trans varchar(1),
	@bkgstatus	nvarchar(1)	=null,
	@consultanatid	nvarchar(50)	=null,
	@customerid	nvarchar(50)	=null
	
)
AS
BEGIN
	SET NOCOUNT OFF
	DECLARE @Err int
if @Trans = 'v' -- flag for view data 
begin
	if @flg = 1 -- customer consultant related Fetch 
	begin
		if @flg1 = 1 
		begin
	UPDATE [BkgMaster]
	SET
		[custrefno] = @custrefno
	WHERE
		([bkgid] = @bkgID) AND([consultanatid]=@consultanatid)AND(customerid=@customerid)
END
END

	SET @Err = @@Error


	RETURN @Err
END
END
GO
/****** Object:  StoredProcedure [dbo].[ABCDB_Login]    Script Date: 03/27/2013 17:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[ABCDB_Login]

@ConsultantID	nvarchar(50)=null,
@Password	nvarchar(50)=null,
@CustomerID	nvarchar(50)=null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   declare @date datetime 
set @date=CONVERT(varchar(8), GETDATE(), 112) 
select consultantname from CustConsultantMaster where ConsultantID = @ConsultantID and [Password] = @Password and CustomerID =  @CustomerID   
	if  @@ROWCOUNT > 0 
		return 1
	else
		begin
		select CustomerID  from CustomerMaster where WebUserName =@ConsultantID and WebPassword = @Password and CustomerID = @CustomerID  
		if @@ROWCOUNT > 0 
			return 2 
		else 
			return 0
		end 
END
GO
/****** Object:  StoredProcedure [dbo].[ABCDB_GET_WATINGBOOKINGSTATUS]    Script Date: 03/27/2013 17:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[ABCDB_GET_WATINGBOOKINGSTATUS]
	--@bkgID nvarchar(50),
	
	@flg int = 0,
	@flg1 int=0,
	@Trans varchar(1),
	--@bkgstatus	nvarchar(1)	=null,
	@consultanatid	nvarchar(50)	=null,
	@customerid	nvarchar(50)	=null
AS
BEGIN
	SET NOCOUNT OFF
	DECLARE @Err int
if @Trans = 'v' -- flag for view data 
begin
	if @flg = 1 -- customer consultant related Fetch 
	begin
		if @flg1 = 1 
		begin
	SELECT bkgid,Bkglocid,bkgdate,custrefno,Salesamt,checkin,checkout,noofnights,p.productname,leadpaxName,bkgstatus
 from dbo.BkgMaster AS b INNER JOIN
                      dbo.ProductMaster AS p ON b.productid = p.ProductID
 
	WHERE 
		(b.[bkgstatus]=3) OR (b.[bkgstatus]=2)AND(b.[consultanatid]=@consultanatid) AND(b.customerid=@customerid)
END
END

	SET @Err = @@Error
	RETURN @Err
END
END
GO
/****** Object:  StoredProcedure [dbo].[ABCDB_ChangeRequestBookingStatus]    Script Date: 03/27/2013 17:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[ABCDB_ChangeRequestBookingStatus]
	@bkgID nvarchar(50),
	
	@flg int = 0,
	@flg1 int=0,
	@Trans varchar(1),
	--@bkgstatus	nvarchar(1)	=null,
	@consultanatid	nvarchar(50)	=null,
	@customerid	nvarchar(50)	=null
AS
BEGIN
	SET NOCOUNT OFF
	DECLARE @Err int
if @Trans = 'v' -- flag for view data 
begin
	if @flg = 1 -- customer consultant related Fetch 
	begin
		if @flg1 = 1 
		begin
	UPDATE [BkgMaster]
	SET
		[bkgstatus] = 2
	WHERE 
		([bkgid] IN (select * from dbo.Split(@bkgID,','))) AND ([consultanatid]=@consultanatid) AND(customerid=@customerid)
END
END

	SET @Err = @@Error
	RETURN @Err
END
END
GO
/****** Object:  StoredProcedure [dbo].[ABCDB_ChangeConfirmBookingStatus]    Script Date: 03/27/2013 17:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[ABCDB_ChangeConfirmBookingStatus]
	@bkgID nvarchar(50),
	
	@flg int = 0,
	@flg1 int=0,
	@Trans varchar(1),
	--@bkgstatus	nvarchar(1)	=null,
	@consultanatid	nvarchar(50)	=null,
	@customerid	nvarchar(50)	=null
AS
BEGIN
	SET NOCOUNT OFF
	DECLARE @Err int
if @Trans = 'v' -- flag for view data 
begin
	if @flg = 1 -- customer consultant related Fetch 
	begin
		if @flg1 = 1 
		begin
	UPDATE [BkgMaster]
	SET
		[bkgstatus] = 3
	WHERE 
		([bkgid] IN (select * from dbo.Split(@bkgID,','))) AND ([consultanatid]=@consultanatid) AND(customerid=@customerid)
END
END

	SET @Err = @@Error
	RETURN @Err
END
END
GO
/****** Object:  StoredProcedure [dbo].[ABCDB_BkgMaster_Update]    Script Date: 03/27/2013 17:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ABCDB_BkgMaster_Update]
(
@bkgstatus	nvarchar(1)	=null,
@consultanatid	nvarchar(50)	=null,
@customerid	nvarchar(50)	=null,
@bkgid		nvarchar(50)=null output,
@bkglocid	nvarchar(50)=null,
@compconsulid	nvarchar(10)	=null,
@bkgdate smalldatetime,
@custrefno nvarchar(50)=null,
@Salesamt int,
@checkin smalldatetime,
@checkout smalldatetime,
@noofnights int,
@leadpaxname nvarchar(200),
@ProductName nvarchar(200)
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [bkgmaster]
	SET
		[Bkglocid] = @bkglocid,
		[bkgdate] = @bkgdate,
		[custrefno] = @custrefno,
		[Salesamt] = @Salesamt,
		[checkin] = @checkin,
		[checkout] = @checkout,
		[noofnights] = @noofnights,
		[leadpaxname]=@leadpaxname
		--[ProductMaster].ProductName =@ProductName
		--FROM bkgmaster , productmaster  
	where
		[bkgid] = @bkgid
		
   UPDATE [productmaster]
	SET
		[ProductName] = @ProductName
		
--where productmaster.ProductID = bkgmaster.productid
--[bkgmaster].productid=[ProductMaster].ProductID [bkgid]] = @bkgid

	SET @Err = @@Error


	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Personalization_GetApplicationId]    Script Date: 03/27/2013 17:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Personalization_GetApplicationId] (
    @ApplicationName NVARCHAR(256),
    @ApplicationId UNIQUEIDENTIFIER OUT)
AS
BEGIN
    SELECT @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
END
GO
/****** Object:  StoredProcedure [dbo].[spUserTypeMaster]    Script Date: 03/27/2013 17:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUserTypeMaster] 
(
@flg int = 0,
@Trans varchar(1),
@UTID	nvarchar(10)=null,
@userTypeName	nvarchar(100)=null,
@UserID	nvarchar(50)=null
)AS
declare @date datetime 
set @date=CONVERT(varchar(8), GETDATE(), 112) 
if @Trans = 'v'
begin
	if @UTID is not null
		select * from UserTypeMaster where UTID = @UTID order by UserTypeName
	else
				select * from UserTypeMaster
end 
if @Trans = 'a'
begin 
	Insert into UserTypeMaster(	UserTypeName,UserID,ModDate	) values ( @UserTypeName,@UserID,@date)
	If @@RowCount > 0 
		return '1'
	else
		return '0'
end 
if @Trans = 'e'
begin 
	update UserTypeMaster set 
	UserTypeName=@UserTypeName,UserID=@UserID,moddate =@date	 where utID = @UTID
If @@RowCount > 0 
	return '1'
else
	return '0'
if @Trans = 'd'
begin
	select top 1 * from UserMaster where UTID = @UTID
	if @@ROWCOUNT >0 
	begin  
		return 'First delete User under this type'
	end
	else 
	begin
		delete from UserTypeMaster where UTID = @UTID 
		if @@ROWCOUNT > 0
			return '1'
		else
			return '0'
	end
end 
end
GO
/****** Object:  StoredProcedure [dbo].[spUserrightUpdS]    Script Date: 03/27/2013 17:01:44 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE      PROCEDURE [dbo].[spUserrightUpdS]
(
	@userid varchar(3),
	@Menuid varchar(10),
	@ReadRight char(1),
	@WriteRight char(1),
	@ModDate smalldatetime=null
)

AS
Update tblUserrightss set
	Menuid		=	@Menuid,
	ReadRight		=	@ReadRight,
	WriteRight		=	@WriteRight,
	ModDate		=	getdate()
	Where userid		=	@userid 
	and Menuid	=  	@Menuid
return '1'
GO
/****** Object:  StoredProcedure [dbo].[spUserRightsSelS]    Script Date: 03/27/2013 17:01:44 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE      PROCEDURE [dbo].[spUserRightsSelS]

(
@userid varchar(3),
@Menuid  varchar(10)=Null
)
 
AS
begin
If @Menuid is  not null 
	select * from tblUserRightsS where userid = @userid and Menuid = @Menuid 
else 
	select A.* from tblUserRightsS A,tblUsermenuItems B where  A.menuId = B.MenuID and A.userid=@userid order by B.Sno 
end
GO
/****** Object:  StoredProcedure [dbo].[spUserrightInsS]    Script Date: 03/27/2013 17:01:44 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUserrightInsS]
(
		@userid varchar(3),
		@Menuid char(10),
		@ReadRight char(1),
		@WriteRight char(1),
		@ModDate smalldatetime=null
)
As
Insert into tblUserRightss
(
		userid,
		Menuid,
		ReadRight,
		WriteRight,
		ModDate 
)
values (

		@userid, 
		@Menuid,
		@ReadRight,
		@WriteRight,
		getDate()

)
if @@rowcount > 0 
	return 1
else
	return 0
GO
/****** Object:  StoredProcedure [dbo].[spUserPrivilegesCheck]    Script Date: 03/27/2013 17:01:44 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[spUserPrivilegesCheck](@UserId char(3),@Flag char(1)) AS
Declare @TempValue as varchar(1)
begin
if @Flag = 'F'
begin
	SET @Tempvalue = (select IsFreeze from tblusermaster where userid =@Userid)
		print @Tempvalue
		Return @Tempvalue
end 
else if @Flag = 'A'
begin
	SET @Tempvalue = (select IsSa from tblusermaster where userid =@Userid)
		print @Tempvalue
		Return @Tempvalue
end 


end
GO
/****** Object:  StoredProcedure [dbo].[spUserMenuPrivilege]    Script Date: 03/27/2013 17:01:44 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[spUserMenuPrivilege](@menuid char(10),@Userid char(3),@Read char(1) out,@Write Char(1) out ) AS
begin 
	set @Read = (select ReadRight from tblUserrightss where userid=@userid and menuid = @menuid)
	set @write = (select WriteRight from tblUserrightss where userid=@userid and menuid = @menuid)
	print @Read 
	print @write 
	 return 1

end
GO
/****** Object:  StoredProcedure [dbo].[spUserMenuItemsSelS]    Script Date: 03/27/2013 17:01:44 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[spUserMenuItemsSelS] AS
select * from tblusermenuitems order by sno
GO
/****** Object:  StoredProcedure [dbo].[spUserMasterUpdS]    Script Date: 03/27/2013 17:01:44 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE      PROCEDURE [dbo].[spUserMasterUpdS]
(
	@userid varchar(3),
	@UserName varchar(30) = null,
	@Password char(15)  = null,
	@IsSa tinyint = 0,
	@IsFreeze tinyint = 0,
	@EntryDate smalldatetime = null	
)
AS
if @password is not null begin 
	Update tblUserMaster set
		UserName		=	@UserName,
		Password		=	@Password,
		IsSa			=	@IsSa,
		IsFreeze		=	@IsFreeze,
		EntryDate		=	getdate()
		Where userid		=	@userid
end 
else
begin
	Update tblUserMaster set
		UserName		=	@UserName,
		IsSa			=	@IsSa,
		IsFreeze		=	@IsFreeze,
		EntryDate		=	getdate()
		Where userid		=	@userid
end 
if @@rowcount >0 
	return 1
else
	return 0
GO
/****** Object:  StoredProcedure [dbo].[spUserMasterSelS]    Script Date: 03/27/2013 17:01:44 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE      PROCEDURE [dbo].[spUserMasterSelS](@userid varchar(3)=null ,@password varchar(15)=null) AS
If @userid is not null and @password is null
	select * from tblUserMaster where userid=@userid
else if @userid is not null and @password is not null 
	select * from tblUserMaster where userid=@userid and (password) = @password
else 
	select * from tblUserMaster order by userid
GO
/****** Object:  StoredProcedure [dbo].[spUserMasterSel]    Script Date: 03/27/2013 17:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE      PROCEDURE [dbo].[spUserMasterSel](@userid varchar(3)=null,@SearchTxt varchar(1000)=null) AS
Declare @SqlQry varchar(5000);
if @SearchTxt is null 
begin
If @userid is not null 
	select * from tblUserMaster where userid=@userid
else 
	select * from tblUserMaster order by userid
 end 
else 
begin
	set @SqlQry = 'Select * from TblUserMaster where ' + convert(varchar(5000),@SearchTxt) +' order by Userid'
print @SqlQry	
execute(@SqlQry)
end
GO
/****** Object:  Table [dbo].[RoomTypeDetail]    Script Date: 03/27/2013 17:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomTypeDetail](
	[RoomTDID] [bigint] IDENTITY(1,1) NOT NULL,
	[RoomTDName] [nvarchar](100) NULL,
	[RoomTHID] [bigint] NULL,
 CONSTRAINT [PK_RoomTypeDetail] PRIMARY KEY CLUSTERED 
(
	[RoomTDID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImages]    Script Date: 03/27/2013 17:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImages](
	[ProductImageId] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductID] [bigint] NULL,
	[ImageAddress] [nvarchar](300) NULL,
 CONSTRAINT [PK_ProductImages] PRIMARY KEY CLUSTERED 
(
	[ProductImageId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[spB2CCustomerinfo]    Script Date: 03/27/2013 17:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spB2CCustomerinfo] 
(
@flg int = 0,
@Trans varchar(1),

@CustomerSNo	bigint=null,
@PaxEmail	nvarchar(100)=null,
@PaxFirstName nvarchar(100)=null,
@PaxMiddleName nvarchar(100)=null,
@PaxLastName nvarchar(100)=null,
@PaxTelNo nvarchar(25)=null,
@PaxmobileNo nvarchar(25)=null,
@PaxCity nvarchar(100)=null,
@PaxAdd1 nvarchar(100)=null,
@PaxAdd2 nvarchar(100)=null,
@PaxAdd3 nvarchar(100)=null,
@PaxPassword nvarchar(15)=null,
@SearchText nvarchar(1000)=null,
@authenicationcode nvarchar(25)=null,
@InService nchar(1)=null
)AS
declare @CustID nvarchar(50)
declare @CustSNo bigint
if @Trans = 'v' -- to view data
begin
	if @CustomerSNo is not null
		select * from B2CCustomerinfo where CustomerSNo = @CustomerSNo 
	else
		select * from B2CCustomerinfo order by  CustomerSNo
end 
if @Trans = 'i'
begin
	select @Custid = Parametervalue from sysparameters where ParameterName = 'B2CCustomerID'
	select  @CustSNo = CustomerSNo from B2CCustomerinfo where PaxEmail = @PaxEmail
	if @@rowcount > 0
		set @Trans = 'e'
	else
		set @Trans = 'a'
	if 	@Trans = 'a'  -- to Add new Record
	begin
		Insert into B2CCustomerinfo (	CustomerID ,
				PaxEmail,
		PaxFirstName,
		PaxMiddleName,
		PaxLastName,
		PaxTelNo,
		PaxmobileNo,
		PaxCity,
		PaxAdd1,
		PaxAdd2,
		PaxAdd3,
		PaxPassword, 
		PaxLastLogDatetime,authenicationcode,InService) values (@CustID,
		@PaxEmail,
		@PaxFirstName,
		@PaxMiddleName,
		@PaxLastName,
		@PaxTelNo,
		@PaxmobileNo,
		@PaxCity,
		@PaxAdd1,
		@PaxAdd2,
		@PaxAdd3,
		@PaxPassword, 
		getdate(),@authenicationcode,0)
			If @@RowCount > 0 
				return '1'
			else
				return '0'
	end 
	else --  if @Trans = 'e'  to Edit existing Record
	begin 
		update B2CCustomerinfo set 
		PaxFirstName = @PaxFirstName ,
		PaxMiddleName = @PaxMiddleName,
		PaxLastName = @PaxLastName,
		PaxTelNo = @PaxTelNo,
		PaxmobileNo = @PaxmobileNo,
		PaxCity = @PaxCity,
		PaxAdd1 = @PaxAdd1,
		PaxAdd2= @PaxAdd2,
		PaxAdd3 = @PaxAdd3,
		PaxPassword = @PaxPassword,authenicationcode=@authenicationcode,Inservice=0 where CustomerSNo = @CustSNo 
			If @@RowCount > 0 
				return '1'
			else
				return '0'
	end 
end
If @Trans ='s' -- To Search
begin 
 declare @QryStr varchar(2000)
 set @QryStr ='select * from B2CCustomerinfo where '+ convert(varchar(5000),@SearchText) +' order by CustomerSNo'
 execute(@QryStr)
end
GO
/****** Object:  StoredProcedure [dbo].[spAmenities]    Script Date: 03/27/2013 17:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spAmenities] 
(
@flg int = 0,
@Trans varchar(1),

@AmenitiesID	bigint=null,
@AmenitiesName	nvarchar(150)=null,
@AmenityType nvarchar(50)=null,
@UserID	nvarchar(50)=null,
@SearchText nvarchar(1000)=null
)AS
declare @date datetime 
set @date=CONVERT(varchar(8), GETDATE(), 112) 
if @Trans = 'v' -- to view data
begin
	if @AmenitiesID is not null
		select * from Amenities where AmenitiesID = @AmenitiesID 
	else
		select * from Amenities order by amenityType,AmenitiesName 
end 
if @Trans = 'a'  -- to Add new Record
begin 
	Insert into Amenities (	    [AmenitiesName]      ,[Amenitytype]	) values (@AmenitiesName      ,@Amenitytype)
	If @@RowCount > 0 
		return '1'
	else
		return '0'
end 
if @Trans = 'e'  -- to Edit existing Record
begin 
	update Amenities set 
	[AmenitiesName]=@AmenitiesName,[Amenitytype]=@Amenitytype	 where AmenitiesID = @AmenitiesID 
	If @@RowCount > 0 
		return '1'
	else
		return '0'
end 
if @Trans = 'd'  -- TO Delete Record 
begin
	delete from Amenities where AmenitiesID = @AmenitiesID 
				if @@ROWCOUNT > 0
			return '1'
		else
			return '0'
	end 
If @Trans ='s' -- To Search
begin 
 declare @QryStr varchar(2000)
 set @QryStr ='select * from Amenities where '+ convert(varchar(5000),@SearchText) +' order by AmenitiesID'
 execute(@QryStr)
end
GO
/****** Object:  Table [dbo].[ProductAmenities]    Script Date: 03/27/2013 17:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductAmenities](
	[ProductAmenityId] [bigint] IDENTITY(1,1) NOT NULL,
	[productID] [bigint] NULL,
	[AmenitiesId] [bigint] NULL,
 CONSTRAINT [PK_ProductAmenities] PRIMARY KEY CLUSTERED 
(
	[ProductAmenityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[B2CPaxinfo]    Script Date: 03/27/2013 17:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[B2CPaxinfo](
	[CustomerSno] [bigint] IDENTITY(1,1) NOT NULL,
	[ForeignCustomerSNo] [bigint] NULL,
	[CustomerId] [bigint] NULL,
	[Title] [nvarchar](10) NULL,
	[PaxFirstName] [nvarchar](100) NULL,
	[PaxMiddleName] [nvarchar](100) NULL,
	[PaxLastName] [nvarchar](100) NULL,
	[PaxDOB] [date] NULL,
	[Nationality] [nvarchar](200) NULL,
 CONSTRAINT [PK_B2CPaxinfo] PRIMARY KEY CLUSTERED 
(
	[CustomerSno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_aspnet_Applications]    Script Date: 03/27/2013 17:01:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_Applications]
  AS SELECT [dbo].[aspnet_Applications].[ApplicationName], [dbo].[aspnet_Applications].[LoweredApplicationName], [dbo].[aspnet_Applications].[ApplicationId], [dbo].[aspnet_Applications].[Description]
  FROM [dbo].[aspnet_Applications]
GO
/****** Object:  StoredProcedure [dbo].[spRateperDate]    Script Date: 03/27/2013 17:01:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRateperDate] 
(
@Trans varchar(1),
@flg int = 0,
@Bkgid	bigint	=null,
@BDate	smalldatetime	=null,
@SalesRate	numeric(18, 5)	=null,
@PayRate	numeric(18, 5)	=null
) AS
if @Trans = 'v'
begin
select * from RatePerDate where BkgID = @BkgID 
end 
if @Trans='a'
begin
	insert into RateperDate  (Bkgid,BDate,SalesRate	,PayRate) 	values (@Bkgid,@BDate,@SalesRate	,@PayRate	)
	if @@ROWCOUNT > 0 
		return 1 
	else
		return 0 
end 


/*if @Trans ='e'
begin 
end 
if @Trans ='s'
begin
end  */
GO
/****** Object:  StoredProcedure [dbo].[spRateHeader]    Script Date: 03/27/2013 17:01:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRateHeader] 
(
@Trans varchar(1),
@RateHID bigint=null,
	@ProductID bigint=NULL,
	@Description nvarchar(1000)=NULL,
	@WeekDays nvarchar(20)=NULL,
	@WeekEndDays nvarchar(20)=NULL,
	@SupplierID nvarchar(50)=NULL,
	@CurID nvarchar(10)=NULL,
	@ServiceCharges float=NULL,
	@Commission float=NULL,
	@HotelTel nvarchar(50)=NULL,
	@HotelFax nvarchar(50)=NULL,
	@HoteEmail nvarchar(100)=NULL,
	@Remarks varchar(1000)=NULL,
	@AllMarket bit=NULL,
	@Publish bit =  Null,
	@AllDays bit =  Null,
	@userID nvarchar(50)=NULL,
	@Moddate smalldatetime=NULL,
	@SearchText nvarchar(1000)=null
)AS
declare @date datetime 
set @date=CONVERT(varchar(8), GETDATE(), 112) 
declare @maxval bigint
if @Trans = 'v'
begin
	if @RateHID is not null
	Begin
			select * from rateheader where Ratehid=@RateHID and ProductID = @productID order by RateHID 
			end
	else
	Begin
				select * from rateheader where ProductID = @productID 
	end
end 
if @Trans = 'a'
begin 
	Insert into rateheader(	ProductID ,	[Description]  ,	WeekDays  ,WeekEndDays ,	SupplierID  ,	CurID  ,
	ServiceCharges  ,	Commission  ,	HotelTel  ,	HotelFax ,	HoteEmail  ,	Remarks  ,	AllMarket  , Publish ,AllDays
	,userID ,	Moddate	) values ( @ProductID ,	@Description  ,	@WeekDays  ,@WeekEndDays ,	@SupplierID  ,	@CurID  ,
	 	@ServiceCharges  ,	@Commission  ,	@HotelTel  ,	@HotelFax ,
	@HoteEmail  ,	@Remarks  ,	@AllMarket  , @Publish ,@AllDays,	@userID ,@date)
	If @@RowCount > 0
	begin 
		select @maxval = MAX(RatehId) from RateHeader
		return @maxval  
	end
	else
		return '0'
end 
if @Trans = 'e'
begin 
	update RateHeader  set 
	ProductID = @ProductID ,	[Description]=@Description  ,	WeekDays=@WeekDays ,	WeekEndDays=@WeekEndDays  ,	SupplierID=@SupplierID  ,
	CurID=@CurID  ,	Publish=@Publish ,	ServiceCharges =@ServiceCharges  ,
	Commission=@Commission  ,	HotelTel=@HotelTel  ,	HotelFax=@HotelFax ,	HoteEmail=@HoteEmail  ,
	Remarks=@Remarks  ,	AllMarket=@AllMarket  ,AllDays=@AllDays ,userID=@userID ,	Moddate=@Moddate 	 where RateHID = @RateHID 
If @@RowCount > 0 
	return '1'
else
	return '0'
end 
--if @Trans = 'd'
--If @Trans ='s' 
--begin 
-- declare @QryStr varchar(2000)
-- set @QryStr ='select * from CustTypeMaster where  '+ convert(varchar(5000),@SearchText) +' order by CTID'
-- execute(@QryStr)
--end
GO
/****** Object:  StoredProcedure [dbo].[spRateDetail]    Script Date: 03/27/2013 17:01:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRateDetail] 
(
@flg int = 0,
@Trans varchar(1),
	@RateDID bigint=null,
	@RateHid bigint=null,
	@Seasonid bigint = NULL,
	@DateFrom smalldatetime  = NULL,
	@DateTo smalldatetime  =  NULL,
		@MarkupIP int= NULL,
	@MarkupIA float= NULL,
	@CancelPolicy nvarchar(50)  = NULL,
	@CancellationDetails nvarchar(4000) =NULL,
	@CancelAmt float  = NULL,
	@CancelDays int  = NULL,
	@ChildPolicy nvarchar(100) =  NULL,
	@ExtraBed float  = NULL,
	@Remarks nvarchar(1000) =  NULl,
	@SearchText nvarchar(1000)=null
)AS
declare @date datetime 
set @date=CONVERT(varchar(8), GETDATE(), 112) 
Declare @Maxval int
if @Trans = 'v'
begin
	if @RateDID is not null
	Begin
			select RD.Ratedid,SM.SeaName,DateFrom,DateTo ,MarkupIP, MarkupIA ,CancelPolicy ,  CancelAmt ,CancelDays ,ChildPolicy ,ExtraBed ,Remarks  
 from RateDetail RD,SeasonMaster SM  where 
 RD.Seasonid = SM.SeasonId and RD.Ratedid=@RatedID and RD.Ratehid = @RateHid 
			end
	else
	Begin
				select RD.Ratedid,RD.Ratehid,SM.SeaName,DateFrom,DateTo ,MarkupIP, MarkupIA ,CancelPolicy ,CancelAmt ,CancelDays ,ChildPolicy ,ExtraBed ,Remarks  
 from RateDetail RD,SeasonMaster SM  where 
 RD.Seasonid = SM.SeasonId  and RD.Ratehid = @RateHid order by RD.RatedID 
	end
end 
if @Trans = 'a'
begin 
	Insert into ratedetail(	RateHID,Seasonid ,	DateFrom ,	DateTo ,MarkupIP, MarkupIA ,	CancelPolicy,CancellationDetails,	CancelAmt ,	CancelDays,	ChildPolicy,
	ExtraBed,	Remarks) values ( @RateHID, @Seasonid ,	@DateFrom ,	@DateTo ,@MarkupIP, @MarkupIA,	@CancelPolicy,@CancellationDetails,	@CancelAmt ,	@CancelDays,
	@ChildPolicy,	@ExtraBed,	@Remarks)
	If @@RowCount > 0 
	begin
		select @Maxval =  MAX(RateDID) from RateDetail 
		return @maxval 
	end
	else
		return '0'
end 
if @Trans = 'e'
begin 
	update RateDetail  set  
	Seasonid=@Seasonid ,
	DateFrom=@DateFrom ,
	DateTo=@DateTo ,
	MarkupIP= @MarkupIP, 
	MarkupIA= @MarkupIA,
	CancelPolicy=@CancelPolicy,
	CancellationDetails=@CancellationDetails,
	CancelAmt=@CancelAmt ,
	CancelDays=@CancelDays,
	ChildPolicy=@ChildPolicy,
	ExtraBed=@ExtraBed,
	Remarks=@Remarks	 where RateDID = @RateDID 
If @@RowCount > 0 
	return '1'
else
	return '0'
end 
--if @Trans = 'd'
--If @Trans ='s' 
--begin 
-- declare @QryStr varchar(2000)
-- set @QryStr ='select * from CustTypeMaster where  '+ convert(varchar(5000),@SearchText) +' order by CTID'
-- execute(@QryStr)
--end
GO
/****** Object:  StoredProcedure [dbo].[spRateCategory]    Script Date: 03/27/2013 17:01:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spRateCategory] 
(
@flg int = 0,
@Trans varchar(1),
@RCID	nvarchar(10)=null,
@RCName	nvarchar(100)=null,
@UserId	nvarchar(50)=null,
@SearchText nvarchar(2000)=null
)AS
declare @date datetime 
set @date=CONVERT(varchar(8), GETDATE(), 112) 
if @Trans = 'v'
begin
	if @RCID is not null
	Begin
			select * from RateCategory where RCID = @RCID 
			end
	else
	Begin
			select * from RateCategory order by RCName
	end
end 

if @Trans = 'a'
begin 
	Insert into RateCategory(RCName,UserId,ModDate	) values ( @RCName,@UserId,@date)
	If @@RowCount > 0 
		return '1'
	else
		return '0'
end 
if @Trans = 'e'
begin 
	update RateCategory set 
	RCName=@RCName,UserId=@UserId,ModDate =@date	 where RCID = @RCID
If @@RowCount > 0 
	return '1'
else
	return '0'
end
if @Trans = 'd'
begin
   return 'Rate Category cannot be deleted'
end 
if @Trans = 's' 
begin
declare @QryStr varchar(2000)
set @QryStr ='select * from RateCategory where  ' + convert(varchar(2000),@SearchText) +' order by RCID'
	execute(@QryStr)
end
GO
/****** Object:  StoredProcedure [dbo].[spRateBasis]    Script Date: 03/27/2013 17:01:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spRateBasis]
(
@flg int = 0,
@Trans varchar(1),
@RateBasisID nvarchar(10) = null,
@RateBasisName nvarchar(100) = null,
@UserId nvarchar(50) = null,
@SearchText nvarchar(1000)=null
)AS
declare @date datetime 
set @date=CONVERT(varchar(8), GETDATE(), 112)
if @Trans = 'v'
begin
	if @RateBasisID is not null
		select * from RateBasis where RateBasisID = @RateBasisID 
	else
		select * from RateBasis order by RateBasisName
end 
if @Trans = 'a'
begin 
	Insert into RateBasis(RateBasisID,RateBasisName,UserId,ModDate) values (@RateBasisID, @RateBasisName,@UserId,@date)
	If @@RowCount > 0 
		return '1'
	else
		return '0'
end 
if @Trans = 'e'
begin 
	update RateBasis set 
	RateBasisName = @RateBasisName,UserId = @UserId,ModDate = @date where RateBasisID = @RateBasisID
	If @@RowCount > 0 
		return '1'
	else
		return '0'
end 
if @Trans = 'd'
begin
	return 'RateBasis can not be deleted'
end 
If @Trans ='s' 
begin 
 declare @QryStr varchar(2000)
 set @QryStr ='select * from RateBasis where '+ convert(varchar(5000),@SearchText) +' order by RateBasisID'
 execute(@QryStr)
end
GO
/****** Object:  StoredProcedure [dbo].[spServicesMaster]    Script Date: 03/27/2013 17:01:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spServicesMaster] 
(
@flg int = 0,
@Trans varchar(1),
@ServiceID	nvarchar(10)=null,
@serviceName	nvarchar(100)=null,
@UserID	nvarchar(50)=null,
@SearchText nvarchar(2000)=null
)AS
declare @date datetime 
set @date=CONVERT(varchar(8), GETDATE(), 112) 
if @Trans = 'v'
begin
	if @ServiceID is not null
	Begin
			select * from ServicesMaster where ServiceID = @ServiceID order by ServiceName
			end
	else
	Begin
				select * from ServicesMaster 
	end
end 
if @Trans = 'a'
begin 
	Insert into ServicesMaster(	ServiceName,UserID,ModDate	) values ( @serviceName,@UserID,@date)
	If @@RowCount > 0 
		return '1'
	else
		return '0'
end 
if @Trans = 'e'
begin 
	update ServicesMaster set 
	serviceName=@serviceName,UserID=@UserID,moddate =@date	 where ServiceID = @ServiceID
If @@RowCount > 0 
	return '1'
else
	return '0'
end
if @Trans = 'd'
begin
			return 'Can not Delete'
end 
if @Trans = 's' 
begin
declare @QryStr varchar(2000)

			set @QryStr ='select * from ServicesMaster where  ' + convert(varchar(2000),@SearchText) +' order by ServiceID'
	execute(@QryStr)
end
GO
/****** Object:  StoredProcedure [dbo].[spSeasonMaster]    Script Date: 03/27/2013 17:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spSeasonMaster] 
(
@flg int = 0,
@Trans varchar(1),
@SeasonId bigint = null,
@SeaName nvarchar(200)= null,
@SearchText nvarchar(1000)=null
)
AS
if @Trans = 'v'
BEGIN
if @SeasonId is not null
	Begin
			select * from SeasonMaster where SeasonId = @SeasonId order by SeaName
			end
	else
	Begin
				select * from SeasonMaster 
	end
end 

if @Trans= 'a'
Begin
INSERT INTO SeasonMaster (SeaName)values (@SeaName)
If @@RowCount > 0 
		return '1'
	else
		return '0'
end 

if @Trans = 'e'
begin 
	update SeasonMaster set 
	SeaName=@SeaName where SeasonId = @SeasonId
If @@RowCount > 0 
	return '1'
else
	return '0'
end
if @Trans = 'd'
begin
			return 'Can not Delete'
end
if @Trans = 's' 
begin
declare @QryStr varchar(2000)

			set @QryStr ='select * from SeasonMaster where  ' + convert(varchar(2000),@SearchText) +' order by SeasonId'
	execute(@QryStr)
end
GO
/****** Object:  StoredProcedure [dbo].[spUserMasterrightSel]    Script Date: 03/27/2013 17:01:48 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE      PROCEDURE [dbo].[spUserMasterrightSel](@userid varchar(3)=null) AS
If @userid is not null
	select a.userid,a.username,a.Password,b.userid,b.MenuModule,b.ReadRight,b.WriteRight from tblUserMaster a,tblUserrights b where a.userid=b.userid and a.userid=@userid
else 
	select a.userid,a.username,a.Password,b.userid,b.MenuModule,b.ReadRight,b.WriteRight from tblUserMaster a,tblUserrights b where a.userid=b.userid
GO
/****** Object:  StoredProcedure [dbo].[spUserMasterInsS]    Script Date: 03/27/2013 17:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUserMasterInsS]
(
		@userid varchar(3),
		@UserName varchar(30),
		@Password varchar(15),
		@IsSa tinyint,
		@IsFreeze tinyint,
		@EntryDate smalldatetime =null,
		@CompCode char(3)=null,
		@Dept	varchar(20)=null
)
As
Insert into tblUserMaster
(
		userid,
		UserName,
		[Password] ,
		IsSa,
		IsFreeze,
		EntryDate,
		CompCode,Dept
)
values (

		@userid, 
		@UserName,
		@Password,
		@IsSa,
		@IsFreeze,
		getdate(),
		@CompCode,@Dept
)
if @@rowcount >0
	return 1
else
	return 0
GO
/****** Object:  StoredProcedure [dbo].[spUserMasterDels]    Script Date: 03/27/2013 17:01:48 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE      PROCEDURE [dbo].[spUserMasterDels]
(
	@userid varchar(3),@Flag int
)
AS
if @Flag = 0 begin
	delete from tblUserMaster where userid=@userid
	delete from tbluserrightss where userid=@userid
end 
else if @flag = 1 
	delete from tbluserrightss where userid=@userid
if @@rowcount >0 
	return 1
else
	return 0
GO
/****** Object:  StoredProcedure [dbo].[spUserMaster]    Script Date: 03/27/2013 17:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUserMaster] 
(
@flg int = 0,
@Trans varchar(1)=null,
@UserID nvarchar(50)=null,
@UTID	nvarchar(10)=null,
@userName	nvarchar(100)=null,
@Password nvarchar(100)=null,
@IsFreeze tinyint=null,
@ModuserID nvarchar(50)=null)
AS
declare @date datetime 
set @date=CONVERT(varchar(8), GETDATE(), 112) 
if @flg =1 -- checking user for correct inputs 
begin
	 --SELECT * FROM UserMaster where UserId=@UserID and [Password] = @Password  and Islogin = 0 
	 SELECT * FROM UserMaster where UserId=@UserID and [Password] = @Password   
end 
if @flg = 2 --- setting Islogin to 1 
begin
 update userMaster set Islogin = 1 where Userid = @UserID
end 
if @flg = 3 --- setting Islogin to 0 
begin
 update userMaster set Islogin = 0 where Userid = @UserID
end 
if @Trans = 'v'
begin
	if @UserID is not null
		select U.Userid,userName,UsertypeName,U.IsFreeze,ModUserId,U.ModDate from UserMaster U,UserTypeMaster UT where U.UTID = UT.UTID and U.Userid = @userid 
	else
		select * from UserMaster order by UserName
end 
if @Trans = 'a'
begin 
	Insert into UserMaster(	userid,username,password,isFreeze,UTID,Moduserid,ModDate	) values ( @Userid,@USerNAme,@Password, @isFreeze,@UTID,@ModUserID,@date)
	If @@RowCount > 0 
		return '1'
	else
		return '0'
end 
if @Trans = 'e'
begin 
	update UserMaster set 
	UserName=@UserName,password = @password,UTID = @UTID, ModUserID=@ModUserID,moddate =@date where userid = @UserID
If @@RowCount > 0 
	return '1'
else
	return '0'
if @Trans = 'd'
begin
		return 'User can not be deleted'
end
end
GO
/****** Object:  StoredProcedure [dbo].[spTestFun]    Script Date: 03/27/2013 17:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spTestFun]
 @tempData varchar(max)
AS
BEGIN	
	DECLARE @sql Varchar(max)
	DECLARE @colValue Varchar(max)	
	Select Top 1 @colValue = colData From dbo.fInsTouricoDetails(@tempData)
	Set @sql = 'Insert Into TestFun Values (' + @colValue + ')'
	PRINT @sql
	EXEC(@sql)   
		
END
GO
/****** Object:  StoredProcedure [dbo].[spPaxDetails]    Script Date: 03/27/2013 17:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spPaxDetails] 
(
@Trans varchar(1),
@flg int = 0,
@BkgID	bigint=null,
@PaxName	nvarchar(200)=null
) AS
if @Trans = 'v'
begin
select * from PaxDetails where BkgID = @BkgID 
end 
if @Trans='a'
begin
	insert into PaxDetails  (bkgid,	
	PaxName) 
	values (@bkgid,	
	@PaxName

	)
	if @@ROWCOUNT > 0 
		return 1 
	else
		return 0 
end 


/*if @Trans ='e'
begin 
end 
if @Trans ='s'
begin
end  */
GO
/****** Object:  StoredProcedure [dbo].[spPackageImages]    Script Date: 03/27/2013 17:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPackageImages] 
(
@flg int = 0,
@Trans varchar(1),
@PacImageID bigint = null,
@PacId	bigint=null,
@ImageURL	nvarchar(150)=null,
@SearchText nvarchar(1000)=null
)AS
declare @date datetime 
set @date=CONVERT(varchar(8), GETDATE(), 112) 
if @Trans = 'v'
begin
	if @PacId is not null
		select * from PackageImages where PacId=@PacId 
	else
				select * from PackageImages order by ImageURL
end 
if @Trans = 'a'
begin 
	Insert into PackageImages(PacId,ImageURL) values (@PacId, @ImageURL)
	If @@RowCount > 0 
		return '1'
	else
		return '0'
end 
if @Trans = 'e'
begin 
	update PackageImages set 
	PacId=@PacId,
	ImageURL=@ImageURL	 where PacImageID = @PacImageID
	If @@RowCount > 0 
		return '1'
	else
		return '0'
end 
if @Trans = 'd'
begin
	
		delete from PackageImages where PacImageID = @PacImageID
	if @@ROWCOUNT > 0
		return '1'
	else
		return '0'
end
If @Trans ='s' 
begin 
 declare @QryStr varchar(2000)
 set @QryStr ='select * from PackageImages where '+ convert(varchar(5000),@SearchText) +' order by ImageURL'
 execute(@QryStr)
end
GO
/****** Object:  StoredProcedure [dbo].[spPackageHeader]    Script Date: 03/27/2013 17:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPackageHeader] 
(
@flg int = 0,
@Trans varchar(20),
@PacId bigint=null,
@PacName nvarchar(200)=null,
@Countryid	nvarchar(10)=null,
@CityID nvarchar(10)=null,
@UserID	nvarchar(50)=null,
@Validfrom date=null,
@Validto date=null,
@Pacvalue float=null,
@DisplayImage nvarchar(150)=null,
@InService int = null,
@displayseq int =null,
@ModUser nvarchar(10)=null,
@SearchText nvarchar(1000)=null
)AS
declare @date datetime 
set @date=CONVERT(varchar(8), GETDATE(), 112) 
if @Trans = 'v'
begin
	if @PacId is not null
	begin
		if @flg= 1
			select PacId,PacName,CC.CountryName, C.CityName, P.Countryid,P.displayseq,P.CityID,P.Validfrom,P.Validto,P.Pacvalue,P.DisplayImage,P.InService,P.ModUser,P.ModDate  from PackageHeader P, CityMaster C,CountryMaster CC where CC.CountryID=P.Countryid and   C.CityID = P.CityID and PacId = @PacId
		else
			select * from PackageHeader where PacId = @PacId 
	end 
	else
	BEGIN
		if @flg= 1
			select PacId,PacName,CC.CountryName, C.CityName, P.Countryid,P.CityID,P.Validfrom,P.Validto,P.Pacvalue,P.DisplayImage,P.InService,P.ModUser,P.ModDate  from PackageHeader P, CityMaster C,CountryMaster CC where CC.CountryID=P.Countryid and   C.CityID = P.CityID order by PacName
		else if @flg=2
			select displayseq,Pacid,PacName,DisplayImage from packageheader where InService =1 and displayseq is not null order by displayseq
		else
			select * from PackageHeader order by PacName
	END
end 
if @Trans = 'a'
begin 
	Insert into PackageHeader(	PacName,Countryid,CityId,Validfrom,Validto,Pacvalue,DisplayImage,InService,ModUser,ModDate	) values (@PacName,@Countryid,@CityId,@Validfrom,@Validto,@Pacvalue,@DisplayImage,@InService,@ModUser,@date)
	If @@RowCount > 0 
		return '1'
	else
		return '0'
end 
if @Trans = 'e'
begin 
	update PackageHeader set 
	PacName=@PacName,
	Countryid=@Countryid ,
	CityId=@CityId,
	Validfrom=@Validfrom,
	Validto=@Validto,
	Pacvalue=@Pacvalue,
	DisplayImage=@DisplayImage,
	InService=@InService,
	ModUser=@ModUser,
	ModDate=@date 
	where 
	PacId = @PacId
	delete from packageDetail where Pacid =  @Pacid
If @@RowCount > 0 
	return '1'
else
	return '0'
end
if @Trans = 'e_inservice'
begin 
	update PackageHeader set 
	InService=@InService,
	ModUser=@ModUser,
	ModDate=@date 
	where 
	PacId = @PacId
If @@RowCount > 0 
	return '1'
else
	return '0'
end
if @Trans = 'e_displayseq'
begin 
	update PackageHeader set 
	displayseq=@displayseq,
	ModUser=@ModUser,
	ModDate=@date 
	where 
	PacId = @PacId
If @@RowCount > 0 
	return '1'
else
	return '0'
end
if @Trans = 'd'
begin
	return 'cannot delete PackageHeader'
end 
If @Trans ='s' 
begin 
 declare @QryStr varchar(2000)
 set @QryStr ='select PacId,PacName,CC.CountryName, C.CityName, P.Countryid,P.CityID,P.UserID,P.Validfrom,P.Validto,P.Pacvalue,P.DisplayImage,P.InService,P.ModUser,P.ModDate  from PackageHeader P, CityMaster C,CountryMaster CC where CC.CountryID=P.Countryid and   C.CityID = P.CityID and'+ convert(varchar(5000),@SearchText) +' order by PacId'
 execute(@QryStr)
end
GO
/****** Object:  StoredProcedure [dbo].[spPackageDetail]    Script Date: 03/27/2013 17:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPackageDetail] 
(
@flg int = 0,
@Trans varchar(1), 
	@PacId bigint = NULL,
	@PacDetailsID bigint = NULL,
	@Sno int = NULL,
	@ServiceID int =NULL,
	@SupplierID nvarchar(50) = NULL,
	@PayCruID nvarchar(10)  = NULL,
	@PayExRate decimal(12, 9)  = NULL,
	@PayInBaseCur decimal(18, 0)  = NULL, 
	@AccountCode varchar(50)  = NULL,
	@PayAmount decimal(18, 0)  = NULL
)AS
if @Trans = 'v'
	select * from PackageDetail where pacid = @pacid
else if @Trans = 'a'
begin
   insert into PackageDetail (PacId,
	Sno,
	ServiceID,
	SupplierID,
	PayCruID,
	PayExRate,
	PayInBaseCur,
	AccountCode,
	PayAmount) values (@PacId,
	@Sno ,
	@ServiceID ,
	@SupplierID,
	@PayCruID,
	@PayExRate,
	@PayInBaseCur,
	@AccountCode,
	@PayAmount)
If @@RowCount > 0 
	return '1'
else
	return '0'
end
else if @Trans = 'e'
begin 
 update PackageDetail 
 set Sno = @Sno,
ServiceID =@ServiceID,
SupplierID = @SupplierID,
PayCruID=@PayCruID,
PayExRate=@PayExRate,
PayInBaseCur=@PayInBaseCur,
AccountCode=@AccountCode,
PayAmount=@PayAmount
where PacId=@PacId
If @@RowCount > 0 
		return '1'
	else
		return '0'
end
else if @Trans='d'
begin
	delete from PackageDetail where PacDetailsID = @PacDetailsID
	if @@ROWCOUNT > 0
		return '1'
	else
		return '0'
end
GO
/****** Object:  StoredProcedure [dbo].[spPackageDescription]    Script Date: 03/27/2013 17:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPackageDescription] 
(
@flg int = 0,
@Trans varchar(1),
@PacId	bigint=null,
@PacDes	nvarchar(MAX)=null,
@SearchText nvarchar(1000)=null
)AS
declare @date datetime 
set @date=CONVERT(varchar(8), GETDATE(), 112) 
if @Trans = 'v'
begin
	if @PacId is not null
		select * from PackageDescription where PacId = @PacId
		else
				select * from PackageDescription order by PacDes
end 
if @Trans = 'a'
begin 
	Insert into PackageDescription(PacId,PacDes	) values (@PacId, @PacDes)
	If @@RowCount > 0 
		return '1'
	else
		return '0'
end 
if @Trans = 'e'
begin 
	update PackageDescription set 
	PacDes=@PacDes	 where PacId = @PacId
	If @@RowCount > 0 
		return '1'
	else
		return '0'
end 
if @Trans = 'd'
begin
	
		return 'Cannot delete PackageDescription'
end
If @Trans ='s' 
begin 
 declare @QryStr varchar(2000)
 set @QryStr ='select * from PackageDescription where '+ convert(varchar(5000),@SearchText) +' order by PacId'
 execute(@QryStr)
end
GO
/****** Object:  StoredProcedure [dbo].[sploginvb]    Script Date: 03/27/2013 17:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sploginvb]
(
	@UserId varChar(3),
	@Password varchar(100),
	@CompCode char(3),
	@IsSa bit = 0 output,
	@IsFreeze bit = 0 output
)
AS
	If @UserID is Not Null
	Begin
		Declare @XFlag tinyint
		Select @XFlag=(select count(*) from tblUserMaster where UserId=@UserId)
		If @XFlag = 0 
		Begin
			return '0'
		End
		Else
		Begin
			Declare @pwd varchar(100)
			select @pwd = password, @IsSa = IsSa, @IsFreeze = IsFreeze from tblUserMaster where UserId = @UserId and upper(CompCode) = Upper(@CompCode)
--			If @@RowCount = 1
--			Begin
				If @pwd = @password 
				Begin
					return '1'
				End
				else
				Begin
					return '2'
				End
--			End
--			Else
--			Begin
--				return '3'
--			End
		End
	End
	Else
	Begin
		select * from tblUserMater order by UserId
	End
return '1'
GO
/****** Object:  StoredProcedure [dbo].[sploginRTC]    Script Date: 03/27/2013 17:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sploginRTC]
(
	@UserId varChar(50),
	@Password varchar(100),
	@CompCode varchar(50),
	@IsSa varchar(1) = 0 output,
	@IsFreeze varchar(1) = 0 output
)
AS
	If @UserID is Not Null
	Begin
		Declare @XFlag tinyint
		Select @XFlag=(select count(*) from tblUserMaster where UserId=@UserId)
		If @XFlag = 0 
		Begin
			return '0'
		End
		Else
		Begin
			
			select @IsSa=IsSa ,@IsFreeze =IsFreeze  from tblUserMaster where UserId = @UserId and upper(CompCode) = Upper(@CompCode) and Password = @Password 
				If @@ROWCOUNT > 0 
				Begin
					return '1'
				End
				else
				Begin
					return '2'
				End
		End
	End
GO
/****** Object:  StoredProcedure [dbo].[spLocationMaster]    Script Date: 03/27/2013 17:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLocationMaster] 
(
@flg int = 0,
@Trans varchar(1),
@LocID nvarchar(50)=null,
@LocName	nvarchar(150)=null,
@CityID	nvarchar(50)=null,
@UserID	nvarchar(50)=null,
@SearchText nvarchar(1000)=null
)AS
declare @date datetime 
set @date=CONVERT(varchar(8), GETDATE(), 112) 
if @Trans = 'v'
begin
	if @LocID is not null
	begin
		if @flg= 1
			select LocId,Locname,C.CityName,C.CityID,L.userID,L.moddate from CityMaster C,LocationMaster L where L.CityID=C.CityID and   LocID = @LocID
		else
			select * from LocationMaster where LocID = @LocID 
	end 
	else
	BEGIN
		if @flg= 1
			select LocId,Locname,C.CityName,C.CityID,L.userID,L.moddate from CityMaster C,LocationMaster L where L.cityID=C.CityID   order by L.LocName
		else
			select * from LocationMaster order by LocName
	END
end 
if @Trans = 'a'
begin 
	Insert into LocationMaster(	LocName,CityID, UserID,ModDate	) values ( @LocName,@CityID, @UserID,@date)
	If @@RowCount > 0 
		return '1'
	else
		return '0'
end 
if @Trans = 'e'
begin 
	update LocationMaster set 
	LocName=@LocName,CityID=@CityID ,UserID=@UserID,moddate =@date where LocID = @LocID
If @@RowCount > 0 
	return '1'
else
	return '0'
end
if @Trans = 'd'
begin
	delete from LocationMaster where LocID = @LocID
	if @@ROWCOUNT > 0
			return '1'
		else
			return '0'
end 
If @Trans ='s' 
begin 
 declare @QryStr varchar(2000)
 set @QryStr ='select LocId,Locname,C.CityName,C.CityID,L.userID,L.moddate from CityMaster C,LocationMaster L where L.CityID=C.CityID and   '+ convert(varchar(5000),@SearchText) +' order by LocID'
 execute(@QryStr)
end
GO
/****** Object:  StoredProcedure [dbo].[spInternalMemo]    Script Date: 03/27/2013 17:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInternalMemo] 
(
@flg int = 0,
@Trans varchar(1),
@IDescription nvarchar(MAX)=null,
@ModUser nvarchar(10)=null,
@ModDateTime datetime=null,
@SearchText nvarchar(1000)=null
)AS
declare @date datetime 
set @date= GETDATE()
if @Trans = 'v'
begin
	select * from InternalMemo order by IDescription
end 
if @Trans = 'a'
begin 
	Insert into InternalMemo(IDescription,ModUser,ModDateTime) values (@IDescription, @ModUser,@date)
	If @@RowCount > 0 
		return '1'
	else
		return '0'
end 

if @Trans = 'e'
begin 
	update InternalMemo set 
	IDescription=@IDescription,
	ModDateTime=@date	 
	If @@RowCount > 0 
		return '1'
	else
		return '0'
end 
if @Trans = 'd'
begin
	
		return 'Cannot delete Internal Memo'
end
If @Trans ='s' 
begin 
 declare @QryStr varchar(2000)
 set @QryStr ='select * from InternalMemo where '+ convert(varchar(5000),@SearchText) +' order by IDescription'
 execute(@QryStr)
end
GO
/****** Object:  StoredProcedure [dbo].[spInsTouricoDetails]    Script Date: 03/27/2013 17:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jeelan
-- Create date: 03/03/2013
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spInsTouricoDetails]
	@sessionId varchar(max), @brandId integer, @brandName varchar(255), @category varchar(255), @propertySubType varchar(255), @numOfRooms Integer,
	@minAvrPrice decimal(9,2), @hotelName varchar(255), @bestValue bit, @hotelId int, @provider varchar(255), @description varchar(max),
	@currency varchar(100), @thumb varchar(100), @stars decimal(3,2), @propertyType varchar(100),
	@CountryCode varchar(100), @stateCode varchar(100), @city varchar(255), @searchingState varchar(255), @searchingCity varchar(255),
	@location varchar(255), @address varchar(255), @longitude varchar(max), @latitude varchar(max),
	@roomType varchar(max), @availability varchar(max), @promotion varchar(max), @occupancy varchar(max), @bb varchar(max), @supplement varchar(max),
	@price varchar(max)
	
AS
BEGIN	
	SET NOCOUNT ON;
	DECLARE @ErrMsg varchar(max)	
	DECLARE @countRec int
	DECLARE @searchId int
	DECLARE @colValues varchar(max)
	DECLARE @sql varchar(max)
	DECLARE @roomTypeData Table (roomType varchar(max))
	DECLARE @roomAvailability Table (availability varchar(max))
	DECLARE @roomPromotion Table(promotion varchar(max))
	DECLARE @roomOccupancy Table (occupancy varchar(max))
    DECLARE @roomPrices Table (price varchar(max))
	DECLARE @roomSupplements Table (supplements varchar(max))
	DECLARE @roomBoardBase Table (bb varchar(max))

	BEGIN TRY	 
	 Select @searchId = Max(SearchId) From dbo.SearchReference		
	 INSERT INTO dbo.TouricoHotelsInfo 
	 Values 
	(@sessionId, @searchId, @brandId, @brandName, @category, @propertySubType, @numOfRooms, @minAvrPrice, @hotelName, @bestValue, @hotelId, @provider, @description, 
	 @currency, @thumb, @stars, @propertyType)

	 
	 INSERT INTO dbo.TouricoHotelsLoc
	 Values
	 (@searchId, @hotelId, @CountryCode, @stateCode, @city, @searchingState, @searchingCity, @location, @address, @longitude, @latitude)

	 --RoomType Info Insert
	 INSERT INTO @roomTypeData (roomType) Select colData From dbo.fInsTouricoDetails(@roomType)	 
	 Select @countRec = Count(1) From @roomTypeData	 
	 While(@countRec > 0)
	  BEGIN
		Select Top 1 @colValues = CAST(@searchId as Varchar) + ',' + CAST(@hotelId as Varchar) + ',' + roomType From @roomTypeData
		Set @sql = 'INSERT INTO dbo.TouricoHotelsRoomTypes Values(' + @colValues + ')'
		PRINT 'RoomType Info' + @sql
		EXEC(@sql)

	    --Availability Info Insert
		INSERT INTO @roomAvailability (availability) Select colData From dbo.fInsTouricoDetails(@availability)
		Select @countRec = Count(1) From @roomAvailability	
		While(@countRec > 0)
		 BEGIN
		Select Top 1 @colValues = CAST(@searchId as Varchar) + ',' + CAST(@hotelId as Varchar) + ',' + CAST(HotelRoomTypeId as Varchar) + ',' + CAST(RoomId as Varchar) From dbo.TouricoHotelsRoomTypes
		Select Top 1 @colValues = @colValues + ',' +  availability From @roomAvailability
		Set @sql = 'INSERT INTO dbo.TouricoHotelsRoomAvailability Values(' + @colValues + ')'
		PRINT 'Availability Info' + @sql
		EXEC(@sql)
		Delete Top(1) From @roomAvailability
	    Select @countRec = Count(1) From @roomAvailability
		 END

		--Promotion Info Insert
		INSERT INTO @roomPromotion (promotion) Select colData From dbo.fInsTouricoDetails(@promotion)
		Select @countRec = Count(1) From @roomPromotion	
		While(@countRec > 0)
		 BEGIN
		Select Top 1 @colValues = CAST(@searchId as Varchar) + ',' + CAST(@hotelId as Varchar) + ',' + CAST(HotelRoomTypeId as Varchar) + ',' + CAST(RoomId as Varchar) From dbo.TouricoHotelsRoomTypes
		Select Top 1 @colValues = @colValues + ',' +  promotion From @roomPromotion
		Set @sql = 'INSERT INTO dbo.TouricoHotelsPromotion Values(' + @colValues + ')'
		PRINT 'Promotion Info' + @sql
		EXEC(@sql)
		Delete Top(1) From @roomPromotion
	    Select @countRec = Count(1) From @roomPromotion
		 END
		
		--Occupancy Info Insert
		INSERT INTO @roomOccupancy (occupancy) Select colData From dbo.fInsTouricoDetails(@occupancy)
		Select @countRec = Count(1) From @roomOccupancy	
		While(@countRec > 0)
		 BEGIN
		Select Top 1 @colValues = CAST(@searchId as Varchar) + ',' + CAST(@hotelId as Varchar) + ',' + CAST(HotelRoomTypeId as Varchar) + ',' + CAST(RoomId as Varchar) From dbo.TouricoHotelsRoomTypes
		Select Top 1 @colValues = @colValues + ',' +  occupancy From @roomOccupancy
		Set @sql = 'INSERT INTO dbo.TouricoHotelsRoomOccupancy Values(' + @colValues + ')'
		PRINT 'Occupancy Info' + @sql
		EXEC(@sql)
		Delete Top(1) From @roomOccupancy
	    Select @countRec = Count(1) From @roomOccupancy
		 END		

		--RoomPrice Info Insert
		INSERT INTO @roomPrices (price) Select colData From dbo.fInsTouricoDetails(@price)
		Select @countRec = Count(1) From @roomPrices	
		While(@countRec > 0)
		 BEGIN
		Select Top 1 @colValues = CAST(@searchId as Varchar) + ',' + CAST(@hotelId as Varchar) + ',' + CAST(HotelRoomTypeId as Varchar) + ',' + CAST(RoomId as Varchar) From dbo.TouricoHotelsRoomTypes
		Select Top 1 @colValues = @colValues + ',' +  price From @roomPrices
		Set @sql = 'INSERT INTO dbo.TouricoHotelsRoomPrices Values(' + @colValues + ')'
		PRINT 'Room Price Info' + @sql
		EXEC(@sql)
		Delete Top(1) From @roomPrices
	    Select @countRec = Count(1) From @roomPrices
		 END

		--RoomSupplements Info Insert
		INSERT INTO @roomSupplements (supplements) Select colData From dbo.fInsTouricoDetails(@supplement)
		Select @countRec = Count(1) From @roomSupplements	
		While(@countRec > 0)
		 BEGIN
		Select Top 1 @colValues = CAST(@searchId as Varchar) + ',' + CAST(@hotelId as Varchar) + ',' + CAST(HotelRoomTypeId as Varchar) + ',' + CAST(RoomId as Varchar) From dbo.TouricoHotelsRoomTypes
		Select Top 1 @colValues = @colValues + ',' +  supplements From @roomSupplements
		Set @sql = 'INSERT INTO dbo.TouricoHotelsRoomSupplements Values(' + @colValues + ')'
		PRINT 'Supplements Info' + @sql
		EXEC(@sql)
		Delete Top(1) From @roomSupplements
	    Select @countRec = Count(1) From @roomSupplements
		 END

		--RoomBoardBase Info Insert
		INSERT INTO @roomBoardBase (bb) Select colData From dbo.fInsTouricoDetails(@bb)
		Select @countRec = Count(1) From @roomBoardBase	
		While(@countRec > 0)
		 BEGIN
		Select Top 1 @colValues = CAST(@searchId as Varchar) + ',' + CAST(@hotelId as Varchar) + ',' + CAST(HotelRoomTypeId as Varchar) + ',' + CAST(RoomId as Varchar) From dbo.TouricoHotelsRoomTypes
		Select Top 1 @colValues = @colValues + ',' +  bb From @roomBoardBase
		Set @sql = 'INSERT INTO dbo.TouricoHotelsRoomBoardbase Values(' + @colValues + ')'
		PRINT 'BoardBase Info' + @sql
		EXEC(@sql)
		Delete Top(1) From @roomBoardBase
	    Select @countRec = Count(1) From @roomBoardBase
		 END		

		Delete Top(1) From @roomTypeData
	    Select @countRec = Count(1) From @roomTypeData
			
	   END
		Select @searchId
	 END TRY
	BEGIN CATCH
	 Select @ErrMsg = ERROR_MESSAGE()
     RAISERROR(@ErrMsg,16,1)
	 END CATCH
    
END
GO
/****** Object:  StoredProcedure [dbo].[spGroupHeader]    Script Date: 03/27/2013 17:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGroupHeader] 
(
@flg int = 0,
@Trans varchar(1),
@GroupID bigint=null,
@GroupName nvarchar(200)=null,
@NoOfPassengers	int=null,
@GroupDate date=null,
@InService int = null,
@UserID	nvarchar(50)=null,
@ModUser nvarchar(10)=null,
@SearchText nvarchar(1000)=null
)AS
declare @date datetime 
set @date=CONVERT(varchar(8), GETDATE(), 112) 
if @Trans = 'v'
begin
	if @GroupID is not null
	begin
		select * from GroupHeader where GroupID = @GroupID
	end
	else
	begin 
		select * from GroupHeader order by GroupName
	end
end
if @Trans = 'a'
begin 
	Insert into GroupHeader(GroupName,NoOfPassengers,GroupDate,InService,ModUser,LastModDate	) values (@GroupName,@NoOfPassengers,@GroupDate,@InService,@ModUser,@date)
	If @@RowCount > 0 
		return '1'
	else
		return '0'
end 

if @Trans = 'e'
begin 
	update GroupHeader set 
	GroupName=@GroupName,
	NoOfPassengers=@NoOfPassengers,
	GroupDate=@GroupDate ,
	InService=@InService,
	ModUser=@ModUser,
	LastModDate=@date
	where 
	GroupID = @GroupID
	
If @@RowCount > 0 
	return '1'
else
	return '0'
end
if @Trans = 'd'
begin
	return 'cannot delete GroupHeader'
end 
If @Trans ='s' 
begin 
 declare @QryStr varchar(2000)
 set @QryStr ='select * from GroupHeader where '+ convert(varchar(5000),@SearchText) +' order by GroupName'
 execute(@QryStr)
end
GO
/****** Object:  StoredProcedure [dbo].[spGroupDetail]    Script Date: 03/27/2013 17:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGroupDetail] 
(
@flg int = 0,
@Trans varchar(1), 
	@GroupID bigint=null ,
	@GDNo bigint=null,
	@SeqNo int = NULL,
	@PassengerName nvarchar(100) = null,
	@ConsultantID nvarchar(50) = null,
	@LastModDate date = null
)AS
declare @date datetime 
set @date=CONVERT(varchar(8), GETDATE(), 112)
if @Trans = 'v'
	select * from GroupDetail where GroupID = @GroupID
else if @Trans = 'a'
begin
   insert into GroupDetail (
	GroupID,
	SeqNo,
	PassengerName,
	ConsultantID,
	LastModDate) values (
	@GroupID ,
	@SeqNo ,
	@PassengerName,
	@ConsultantID,
	@date)
If @@RowCount > 0 
	return '1'
else
	return '0'
end
else if @Trans = 'e'
begin 
 update GroupDetail 
 set
PassengerName = @PassengerName,
ConsultantID=@ConsultantID,
LastModDate=@date
where GDNo = @GDNo
If @@RowCount > 0 
		return '1'
	else
		return '0'
end
else if @Trans='d'
begin
	delete from GroupDetail where GDNo = @GDNo
	if @@ROWCOUNT > 0
		return '1'
	else
		return '0'
end
GO
/****** Object:  StoredProcedure [dbo].[spGetActiveSuppliers]    Script Date: 03/27/2013 17:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jeelan
-- Create date: 10/02/2013
-- Description:	Get the list of active suppliers
-- =============================================
CREATE PROCEDURE [dbo].[spGetActiveSuppliers]
	-- Add the parameters for the stored procedure here
	@cityId varchar(50) = 'DXB',
	@sessionID varchar(max)
	--@custId varchar(50) = 1014
AS
BEGIN
	DECLARE @ErrMsg varchar(max)
	DECLARE @searchId int
	DECLARE @ActiveSuppliers Table(SupplierID varchar(10), SupplierName varchar(200),LocCityId varchar(50), XMLCityId varchar(50))
	BEGIN TRY		
		INSERT INTO @ActiveSuppliers
		Select DISTINCT su.SupplierID, su.SupplierName,ci.LocCityId,ci.XMLCityId
			   From dbo.XMLSuppliers su 
				Inner Join dbo.CustXMLMarkUps cu On su.SupplierID = cu.SupplierID 
				Inner Join dbo.XMLCities ci On su.SupplierID = ci.XMLSupplierID
			Where (ISNULL(su.InService,0) = 1 and ISNULL(cu.InService,0) = 1 and ISNULL(ci.InService,0) = 1) and ci.LocCityId = @cityId --'DXB'

		 IF ((SELECT Count(1) From @ActiveSuppliers) <> 0)
			BEGIN
			  Select @searchId = ISNULL(SearchId,0) From SearchReference
			  IF (@searchId = '' OR @searchId IS NULL) Set @searchId = 0
			  INSERT INTO SearchReference Values (@sessionID, @searchId+1)
		     END
		Select * From @ActiveSuppliers
	 END TRY
	BEGIN CATCH
		Select @ErrMsg = ERROR_MESSAGE()
		RAISERROR(@ErrMsg,16,1)
	 END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spProductMaster]    Script Date: 03/27/2013 17:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spProductMaster] 
(
@flg int = 0,
@Trans varchar(1),
@ProductID bigint = NULL,
	@ProductName nvarchar(200) = NULL,
	@ServiceID int = NULL,
	@ClsID int = NULL,
	@LocID int  =  NULL,
	@CityID nvarchar(100) =  NULL,
	@CountryID nvarchar(50)  =  NULL,
	@CheckInTime nvarchar(50)  =  NULL,
	@CheckOutTime nvarchar(50) =  NULL,
	@NoofRooms int =  NULL,
	@ShortDescription nvarchar(1000) =  NULL,
	@Address nvarchar(300) =  NULL,
	@Longitude nvarchar(50)  = NULL,
	@Latitude nvarchar(50)  = NULL,
	@WebSite nvarchar(200)  = NULL,
	@Tel nvarchar(30)  = NULL,
	@Fax nvarchar(30)  = NULL,
	@Email nvarchar(100)  = NULL,
	@ContactPerson nvarchar(100) =  NULL,
	@CurID nvarchar(10)  = NULL,
	@AccountCode nvarchar(50) =  NULL,
	@IsActive bit =  NULL,
	@IsSupplier bit  = NULL,
	@ThumbnailPath nvarchar(300)  = NULL,
	@HotelChain nvarchar(200)  = NULL,
	@NearestAirport nvarchar(200) =  NULL,
	@UserID nvarchar(50) =  NULL,
	@SearchText nvarchar(1000)=null
)AS
declare @date datetime 
set @date=CONVERT(varchar(8), GETDATE(), 112) 
if @Trans = 'v'
begin
	if @ProductID is not null
	begin
		if @flg= 1
			select P.productId,P.productName,S.ServiceName,L.LocName,Ci.CityName,Co.CountryName,IsActive,IsSupplier,ThumbnailPath,ClsName
			from ProductMaster P,ServicesMaster S,CountryMaster Co,CityMaster Ci,LocationMaster L ,Classifications CC
			where P.CountryID = Co.CountryID and P.CityID = Ci.CityID and P.LocID = L.LocID and P.ServiceID =S.ServiceID and p.ProductID = @ProductID  and p.clsid = cc.clsid
	else
			select * from ProductMaster where ProductID = @ProductID 
	end 
	else
	Begin 
	    if @flg=1
	    select P.productId,P.productName,S.ServiceName,L.LocName,Ci.CityName,Co.CountryName,IsActive,IsSupplier,ThumbnailPath
			from ProductMaster P,ServicesMaster S,CountryMaster Co,CityMaster Ci,LocationMaster L 
			where P.CountryID = Co.CountryID and P.CityID = Ci.CityID and P.LocID = L.LocID and P.ServiceID =S.ServiceID order by p.ProductName
	    else
	        Select * from ProductMaster order by ProductName
	END

end 
if @Trans = 'a'
begin 
if @cityid is not null 
	select  @countryId = countryID from CityMaster where CityID = @cityid

	Insert into ProductMaster(	ProductID,
	ProductName,ServiceID,ClsID,LocID,CityID,
CountryID,
CheckInTime,
CheckOutTime,
NoofRooms,
ShortDescription,
Address,
Longitude,
Latitude,
WebSite,
Tel,
Fax,
Email,
ContactPerson,
CurID,
AccountCode,
IsActive,
IsSupplier,
ThumbnailPath,
HotelChain,
NearestAirport,
UserID,
ModDate
) 
	values 
	(@ProductID,@ProductName,
@ServiceID,
@ClsID,
@LocID,
@CityID,
@CountryID,
@CheckInTime,
@CheckOutTime,
@NoofRooms,
@ShortDescription,
@Address,
@Longitude,
@Latitude,
@WebSite,
@Tel,
@Fax,
@Email,
@ContactPerson,
@CurID,
@AccountCode,
@IsActive,
@IsSupplier,
@ThumbnailPath,
@HotelChain,
@NearestAirport,
@UserID,
@date
)
	If @@RowCount > 0 
		return '1'
	else
		return '0'
end 
if @Trans = 'e'
begin 
select  @countryId = countryID from CityMaster where CityID = @cityid

	update ProductMaster set 
	ProductName=@ProductName,
ServiceID=@ServiceID,
ClsID=@ClsID,
LocID=@LocID,
CityID=@CityID,
CountryID=@CountryID,
CheckInTime=@CheckInTime,
CheckOutTime=@CheckOutTime,
NoofRooms=@NoofRooms,
ShortDescription=@ShortDescription,
Address=@Address,
Longitude=@Longitude,
Latitude=@Latitude,
WebSite=@WebSite,
Tel=@Tel,
Fax=@Fax,
Email=@Email,
ContactPerson=@ContactPerson,
CurID=@CurID,
AccountCode=@AccountCode,
IsActive=@IsActive,
IsSupplier=@IsSupplier,
ThumbnailPath=@ThumbnailPath,
HotelChain=@HotelChain,
NearestAirport=@NearestAirport,
UserID=@UserID,
ModDate=@date
	 where ProductID = @ProductID
If @@RowCount > 0 
	return '1'
else
	return '0'
end
if @Trans = 'd'
begin
	delete from ProductMaster where ProductID = @ProductID
	if @@ROWCOUNT > 0
		return '1'
	else
		return '0'
end 
 
if @Trans = 's' 
begin
 declare @QryStr varchar(2000)
 set @QryStr ='select P.productId,P.productName,S.ServiceName,L.LocName,Ci.CityName,Co.CountryName,P.ThumbnailPath
			from ProductMaster P,ServicesMaster S,CountryMaster Co,CityMaster Ci,LocationMaster L 
			where P.CountryID = Co.CountryID and P.CityID = Ci.CityID and P.LocID = L.LocID and P.ServiceID =S.ServiceID  and ' + convert(varchar(5000),@SearchText) +' order by p.ProductID'
		execute(@QryStr)
end


if @Trans = 'image'
begin 

	update ProductMaster	
	set ThumbnailPath = @ThumbnailPath where ProductID = @productid
	If @@RowCount > 0 
	return '1'
else
	return '0'
	End
GO
/****** Object:  StoredProcedure [dbo].[spCustConsultantMaster]    Script Date: 03/27/2013 17:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCustConsultantMaster] 
(
@flg int = 0,
@Trans varchar(1),
@ConsultantID	nvarchar(50)=null,
@Password	nvarchar(50)=null,
@ConsultantName	nvarchar(150)=null,
@CustomerID	nvarchar(50)=null,
@Email	nvarchar(50)=null,
@Fax	nvarchar(20)=null,
@phone	nvarchar(20)=null,
@WebAccessIP	nvarchar(25)=null,
@Markup	int=null,
@SearchText nvarchar(1000)=null
)AS
declare @date datetime 
set @date=CONVERT(varchar(8), GETDATE(), 112) 
if @Trans = 'v' 
begin
	if @ConsultantID is not null and @CustomerID is not null
				select ConsultantID,ConsultantName,C.CustomerName,O.email,O.Phone,O.Password,O.Markup,O.Email,O.Fax,O.CustomerID,O.WebAccessIP    From 
				CustConsultantMaster O, CustomerMaster C where 
				O.CustomerID = C.CustomerID and  O.ConsultantID = @ConsultantID  and O.CustomerID = @CustomerID
	else
	BEGIN
		if  @CustomerID is not null
				select ConsultantID,ConsultantName,C.CustomerName,O.email,O.Phone,O.Password,O.Markup,O.Email,O.Fax   From 
				CustConsultantMaster O, CustomerMaster C where 
				O.CustomerID = C.CustomerID and   O.CustomerID = @CustomerID order by  ConsultantName
		if  @ConsultantID is not null
				select * from CustConsultantMaster where consultantID = @ConsultantID order by  ConsultantName
		if @CustomerID is null and @ConsultantID is null 
				select ConsultantID,ConsultantName,C.CustomerName,O.email,O.Phone,O.Password,O.Markup,O.Email,O.Fax   From 
				CustConsultantMaster O, CustomerMaster C where 
				O.CustomerID = C.CustomerID
	END
end 
if @Trans = 'a'
begin 
	Insert into CustConsultantMaster(ConsultantID,Password,ConsultantName,CustomerID,Email,Fax,phone,WebAccessIP,Markup,ModDate	) values 
	(@ConsultantID,@Password,@ConsultantName,@CustomerID,@Email,@Fax,@phone,@WebAccessIP,@Markup,@date)
	If @@RowCount > 0 
		return '1'
	else
		return '0'
end 
if @Trans = 'e' 
begin 
	update CustConsultantMaster set 
	
Password=@Password,
ConsultantName=@ConsultantName,Email=@Email,
Fax=@Fax,
phone=@phone,
WebAccessIP=@WebAccessIP,
Markup=@Markup,moddate =@date where ConsultantID=@ConsultantID and CustomerID=@CustomerID
If @@RowCount > 0 
	return '1'
else
	return '0'
	end 
if @Trans = 'd'
begin
	
			return 'Cant Delete consultant'
	
end 
If @Trans ='s' 
begin 
 declare @QryStr varchar(2000)
 set @QryStr ='select ConsultantID,ConsultantName,C.CustomerName,O.email,O.Phone From 
CustConsultantMaster O, CustomerMaster C where 
O.CustomerID = C.CustomerID and  '+ convert(varchar(5000),@SearchText) +' order by O.ConsultantID'
 execute(@QryStr)
end
if @Trans ='l'
begin
declare @CustultantName as varchar(150)
 set @CustultantName =  (select consultantname from CustConsultantMaster where ConsultantID = @ConsultantID and [Password] = @Password and CustomerID =  @CustomerID)   
	if  @CustultantName <> '' 
		return  1
	else
		begin
		 set @CustultantName = (select CustomerID  from CustomerMaster where WebUserName =@ConsultantID and WebPassword = @Password and CustomerID = @CustomerID  )
		if   @CustultantName <> '' 
			return 2 
		else 
			return  0
		end 
		
end
GO
/****** Object:  StoredProcedure [dbo].[spCustAdminSelect]    Script Date: 03/27/2013 17:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCustAdminSelect] 
(
@flg int = 0,
@UserID nvarchar(50)=null,
@Password nvarchar(100)=null,
@CustID nvarchar(50)=null,@returnVal int=null output)
AS
declare @val int;
set @val = 9;
if @flg =1 -- checking user for correct inputs 
begin
	select @val = status FROM CustomerMaster where WebUserName=@UserID and WebPassword = @Password and CustomerID=@CustID
If @@RowCount > 0 
begin
	if @val = 1 
	   set @returnVal = 1
	else
	 set @returnVal =0
end
else
	set @returnVal =9
end 
if @flg =2 -- checking user for correct inputs 
begin
	select @val = Status  FROM CustomerMaster,CustConsultantMaster where CustConsultantMaster.CustomerID = CustomerMaster.CustomerID and  ConsultantID =@UserID and [Password] = @Password and CustConsultantMaster.CustomerID=@CustID
If @@RowCount > 0 
begin
	if @val = 1 
	   set @returnVal = 1
	else
	 set @returnVal =0
end
else
	set @returnVal =9
end
GO
/****** Object:  StoredProcedure [dbo].[spCurrencyMaster]    Script Date: 03/27/2013 17:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCurrencyMaster] 
(
@flg int = 0,
@Trans varchar(1),
@CurID	nvarchar(10)=null,
@CurName	nvarchar(100)=null,
@CoName	nvarchar(50)=null,
@ExRate	decimal(12, 9)=null,
@SellingExRate	decimal(12, 9)=null,
@Decimals	int=null,
@UserID	nvarchar(50)=null
)AS
declare @date datetime 
set @date=CONVERT(varchar(8), GETDATE(), 112) 
if @Trans = 'v'
begin
	if @CurID is not null
	Begin
			select * from CurrencyMaster where CurID = @CurID order by CurName
			end
	else
	Begin
				select * from CurrencyMaster 
	end
end 
if @Trans = 'a'
begin 
	Insert into CurrencyMaster(	CurID,CurName,CoName,Decimals,ExRate,UserID,ModDate,SellingExRate	) values ( @CurID,@CurName,@CoName,@ExRate,@Decimals,@UserID,@date,@SellingExRate)
	If @@RowCount > 0 
		return '1'
	else
		return '0'
end 
if @Trans = 'e'
begin 
	update CurrencyMaster set 
	CurName=@CurName,CoName=@CoName,Decimals=@Decimals,ExRate=@ExRate,SellingExRate=@SellingExRate,UserID=@UserID,moddate =@date	 where CurID = @CurID
If @@RowCount > 0 
	return '1'
else
	return '0'
if @Trans = 'd'
begin
	return 'Currency can not be deleted'
end 
end
GO
/****** Object:  StoredProcedure [dbo].[spCountryMaster]    Script Date: 03/27/2013 17:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCountryMaster] 
(
@flg int = 0,
@Trans varchar(1),

@COUNTRYID	nvarchar(50)=null,
@COUNTRYName	nvarchar(150)=null,
@UserID	nvarchar(50)=null,
@SearchText nvarchar(1000)=null
)AS
declare @date datetime 
set @date=CONVERT(varchar(8), GETDATE(), 112) 
if @Trans = 'v'
begin
	if @COUNTRYID is not null
		select * from COUNTRYMaster where COUNTRYID = @COUNTRYID 
	else
				select * from COUNTRYMaster order by COUNTRYName
end 
if @Trans = 'a'
begin 
	Insert into COUNTRYMaster(	COUNTRYID,COUNTRYName,UserID,ModDate	) values (@COUNTRYID, @COUNTRYName,@UserID,@date)
	If @@RowCount > 0 
		return '1'
	else
		return '0'
end 
if @Trans = 'e'
begin 
	update COUNTRYMaster set 
	COUNTRYName=@COUNTRYName,UserID=@UserID,moddate =@date	 where CountryID = @COUNTRYID
	If @@RowCount > 0 
		return '1'
	else
		return '0'
end 
if @Trans = 'd'
begin
	select top 1 * from CityMaster where CountryID = @COUNTRYID
	if @@ROWCOUNT >0 
	begin  
		return 'First delete Cities under this type'
	end
	else 
	begin
		delete from COUNTRYMaster where CountryID = @COUNTRYID
				if @@ROWCOUNT > 0
			return '1'
		else
			return '0'
	end
end 
If @Trans ='s' 
begin 
 declare @QryStr varchar(2000)
 set @QryStr ='select * from COUNTRYMaster where '+ convert(varchar(5000),@SearchText) +' order by CountryID'
 execute(@QryStr)
end
GO
/****** Object:  StoredProcedure [dbo].[spControlParamsSel]    Script Date: 03/27/2013 17:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE    PROCEDURE [dbo].[spControlParamsSel] (@CodeId varchar(50)=Null)
AS
Declare @CodeValue Integer
If @CodeId is Not Null 
Begin
	Update ControlCodes set CodeValue = cast (CodeValue as Integer) + 1 where CodeId =@CodeId
	Set @CodeValue = (Select CodeValue from ControlCodes  where CodeId=@CodeId)--order by CodeId
	return @CodeValue
End
GO
/****** Object:  StoredProcedure [dbo].[spContinentMaster]    Script Date: 03/27/2013 17:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spContinentMaster] 
(
@flg int = 0,
@Trans varchar(1),

@ContinentID	nvarchar(50)=null,
@ContinentName	nvarchar(150)=null,
@UserID	nvarchar(50)=null,
@SearchText nvarchar(1000)=null
)AS
declare @date datetime 
set @date=CONVERT(varchar(8), GETDATE(), 112) 
if @Trans = 'v'
begin
	if @ContinentID is not null
		select * from ContinentMaster where ContinentID = @ContinentID 
	else
				select * from ContinentMaster order by ContinentName
end 
if @Trans = 'a'
begin 
	Insert into ContinentMaster(ContinentID,ContinentName,UserID,ModDate	) values (@ContinentID, @ContinentName,@UserID,@date)
	If @@RowCount > 0 
		return '1'
	else
		return '0'
end 
if @Trans = 'e'
begin 
	update ContinentMaster set 
	ContinentName=@ContinentName,UserID=@UserID,ModDate =@date	 where ContinentID = @ContinentID
	If @@RowCount > 0 
		return '1'
	else
		return '0'
end 
if @Trans = 'd'
begin
	
		return 'Cannot delete Continent Master'
end
If @Trans ='s' 
begin 
 declare @QryStr varchar(2000)
 set @QryStr ='select * from ContinentMaster where '+ convert(varchar(5000),@SearchText) +' order by ContinentID'
 execute(@QryStr)
end
GO
/****** Object:  StoredProcedure [dbo].[spClassifications]    Script Date: 03/27/2013 17:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spClassifications] 
(
@flg int = 0,
@Trans varchar(1),
@ClsId int=null,
@ClsName nvarchar(100)=null,
@ServiceID	int=null,
@DisplayOrder tinyint=null,
@UserID	nvarchar(50)=null,
@SearchText nvarchar(1000)=null
)AS
declare @date datetime 
set @date=CONVERT(varchar(8), GETDATE(), 112) 
if @Trans = 'v'
begin
	if @ClsId is not null
	begin
		if @flg = 1 
		select C.ClsID,c.ClsName,S.ServiceName,C.DisplayOrder,C.UserID,C.ModDate,S.ServiceID  from Classifications C,ServicesMaster S  where C.ServiceID = S.ServiceID and C.ClsID = @ClsId order by ClsName
			
		else
			select *  from Classifications  where  ClsID = @ClsId order by ClsName
	end
	else
	begin
		if @flg = 1 
			select C.ClsID,c.ClsName,S.ServiceName,C.DisplayOrder,C.UserID,C.ModDate,S.ServiceID  from Classifications C,ServicesMaster S  where C.ServiceID = S.ServiceID
		else
		select *  from Classifications  order by ClsName
		end 
		
end 
if @Trans = 'a'
begin 
	Insert into Classifications (	ClsName,DisplayOrder,ServiceID,UserID,ModDate	) values ( @ClsName,@DisplayOrder,@ServiceID,@UserID,@date)
	If @@RowCount > 0 
		return '1'
	else
		return '0'
end 
if @Trans = 'e'
begin 
	update Classifications set 	clsName = @clsName,serviceid=@serviceid,Displayorder = @DisplayOrder,UserID=@UserID,moddate =@date	 where clsID = @clsID
	If @@RowCount > 0 
		return '1'
	else
		return '0'
end
if @Trans = 'd'
begin 
	delete from Classifications where clsID = @clsID
	If @@RowCount > 0 
		return '1'
	else
		return '0'
end
If @Trans ='s' 
begin 
 declare @QryStr varchar(2000)
 set @QryStr ='select C.ClsID,c.ClsName,S.ServiceName,C.DisplayOrder,C.UserID,C.ModDate  from Classifications C,ServicesMaster S  where C.ServiceID = S.ServiceID and '+ convert(varchar(5000),@SearchText) +' order by ClsID'
 execute(@QryStr)
end
GO
/****** Object:  StoredProcedure [dbo].[spCityMaster]    Script Date: 03/27/2013 17:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCityMaster] 
(
@flg int = 0,
@Trans varchar(1),
@CityID nvarchar(50)=null,
@CityName	nvarchar(150)=null,
@CountryID	nvarchar(50)=null,
@UserID	nvarchar(50)=null,
@SearchText nvarchar(1000)=null
)AS
declare @date datetime 
set @date=CONVERT(varchar(8), GETDATE(), 112) 
if @Trans = 'v'
begin
	if @CityID is not null
	begin
		if @flg= 1
			select CityId,Cityname,CC.CountryName,C.CountryID,C.userID,C.moddate from CityMaster C,CountryMaster CC where CC.CountryID=C.CountryID and   CityID = @CityID
		else
			select * from CityMaster where CityID = @CityID 
	end 
	else
	BEGIN
		if @flg= 1
			select CityId,Cityname,CC.CountryName,C.CountryID,C.userID,C.moddate from CityMaster C,CountryMaster CC where CC.CountryID=C.CountryID  order by C.CityName
		else
			select * from CityMaster order by CityName
	END
end 
if @Trans = 'a'
begin 
	Insert into CityMaster(	CityID,CityName,CountryID, UserID,ModDate	) values (@CityID, @CityName,@CountryID, @UserID,@date)
	If @@RowCount > 0 
		return '1'
	else
		return '0'
end 
if @Trans = 'e'
begin 
	update CityMaster set 
	CityName=@CityName,CountryID=@countryid ,UserID=@UserID,moddate =@date where CityID = @CityID
If @@RowCount > 0 
	return '1'
else
	return '0'
end
if @Trans = 'd'
begin
	select top 1 * from LocationMaster where CityID = @CityID
	if @@ROWCOUNT >0 
	begin  
		return 'First delete locations under this Group'
	end
	else 
	begin
		delete from CityMaster where CityID = @CityID
				if @@ROWCOUNT > 0
			return '1'
		else
			return '0'
	end
end 
If @Trans ='s' 
begin 
 declare @QryStr varchar(2000)
 set @QryStr ='select CityId,Cityname,CC.CountryName,C.CountryID,C.userID,C.moddate from CityMaster C,CountryMaster CC where CC.CountryID=C.CountryID and '+ convert(varchar(5000),@SearchText) +' order by CityID'
 execute(@QryStr)
end
GO
/****** Object:  StoredProcedure [dbo].[spFacilities]    Script Date: 03/27/2013 17:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spFacilities] 
(
@flg int = 0,
@Trans varchar(1),

@FID	bigint=null,
@FacilityName	nvarchar(150)=null,
@SearchText nvarchar(1000)=null
)AS
declare @date datetime 
set @date=CONVERT(varchar(8), GETDATE(), 112) 
if @Trans = 'v' -- to view data
begin
	if @FID is not null
		select * from Facilities where FID = @FID 
	else
		select * from Facilities order by FacilityName
end 
if @Trans = 'a'  -- to Add new Record
begin 
	Insert into Facilities ([FacilityName]  ) values (@FacilityName  )
	If @@RowCount > 0 
		return '1'
	else
		return '0'
end 
if @Trans = 'e'  -- to Edit existing Record
begin 
	update Facilities set 
	[FacilityName]=@FacilityName	 where FID = @FID 
	If @@RowCount > 0 
		return '1'
	else
		return '0'
end 
if @Trans = 'd'  -- TO Delete Record 
begin
	delete from Facilities where FID = @FID 
				if @@ROWCOUNT > 0
			return '1'
		else
			return '0'
	end 
If @Trans ='s' -- To Search
begin 
 declare @QryStr varchar(2000)
 set @QryStr ='select * from Facilities where '+ convert(varchar(5000),@SearchText) +' order by FID'
 execute(@QryStr)
end
GO
/****** Object:  StoredProcedure [dbo].[spCustXMLMarkups]    Script Date: 03/27/2013 17:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCustXMLMarkups] 
(
@flg int = 0,
@Trans varchar(1),
@MarkupID int=null,
@CustomerID	nvarchar(50)=null,
@SupplierID	nvarchar(50)=null,
@InService bit=null,
@Markup int=null,
@UserID	nvarchar(50)=null
)AS
declare @date datetime 
set @date=CONVERT(varchar(8), GETDATE(), 112) 
 if @Trans = 'v'
begin
	if @CustomerID is not null
	begin
				select C.MarkupId,C.CustomerID,S.SupplierID,S.SupplierName,C.Markup,C.Userid,C.moddate,InService from CustXMLMarkups C,SupplierMaster S where C.Supplierid = S.SupplierID and C.CustomerID = @CustomerID 
	end 
	
end 
if @Trans = 'a'
begin 
	Insert into CustXMLMarkups (CustomerID, SupplierID,Markup, UserID,moddate,InService)values (@CustomerID, @SupplierID,@Markup, @UserID,@date,@InService)
	If @@RowCount > 0 
		return '1'
	else
		return '0' 
end 
if @Trans = 'e'
begin 
if @flg = 1 
	update CustXMLMarkups set Markup=@Markup,UserID=@UserID,moddate =@date where MarkupID = @MarkupID
if @flg =  2 and @CustomerID is not null
	update CustXMLMarkups set Markup=@Markup ,UserID=@UserID,moddate =@date where CustomerID = @CustomerID
if @flg = 3
	update CustXMLMarkups set Markup=@Markup,UserID=@UserID,moddate =@date,InService=@InService where MarkupID = @MarkupID
If @@RowCount > 0 
	return '1'
else
	return '0'
end
GO
/****** Object:  StoredProcedure [dbo].[spCustTypeMaster]    Script Date: 03/27/2013 17:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCustTypeMaster] 
(
@flg int = 0,
@Trans varchar(1),
@CTID	nvarchar(10)=null,
@CTName	nvarchar(100)=null,
@UserID	nvarchar(50)=null,
@SearchText nvarchar(1000)=null
)AS
declare @date datetime 
set @date=CONVERT(varchar(8), GETDATE(), 112) 
if @Trans = 'v'
begin
	if @CTID is not null
	Begin
			select * from CustTypeMaster where CTID = @CTID
			end
	else
	Begin
				select * from CustTypeMaster  order by CTName
	end
end 
if @Trans = 'a'
begin 
	Insert into CustTypeMaster(	CtID,CtName,UserID,ModDate	) values ( @CTID,@CTName,@UserID,@date)
	If @@RowCount > 0 
		return '1'
	else
		return '0'
end 
if @Trans = 'e'
begin 
	update CustTypeMaster set 
	CTName=@CTName,UserID=@UserID,moddate =@date	 where CTID = @CTID
If @@RowCount > 0 
	return '1'
else
	return '0'
end 
if @Trans = 'd'
begin
	select CTID from CustomerMaster where CTID = @CTID 
	if @@ROWCOUNT > 0
		return 'First Delete Customers with this type'
	else
	begin
		delete from CustTypeMaster where CTID = @CTID
		if @@ROWCOUNT > 0 
			return '1'
		else
			return '0'
	end 
end 
If @Trans ='s' 
begin 
 declare @QryStr varchar(2000)
 set @QryStr ='select * from CustTypeMaster where  '+ convert(varchar(5000),@SearchText) +' order by CTID'
 execute(@QryStr)
end
GO
/****** Object:  StoredProcedure [dbo].[spCustomerMaster]    Script Date: 03/27/2013 17:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCustomerMaster] 
(
@CustomerID nvarchar(50)=Null,
@flg int = 0,
@Trans varchar(1),
@CustomerName	nvarchar(200)=null,
@CTID	nvarchar(10)=null,
@Address	nvarchar(300)=null,
@CityID	nvarchar(100)=null,
@Telephone	nvarchar(30)=null,
@Fax	nvarchar(30)=null,
@Email	nvarchar(50)=null,
@Status	nvarchar(1)=null,
@CrFacility	nvarchar(1)=null,
@CreditDays	int	=null,
@CreditAmount	numeric(12)	=null,
@CreditLimit	numeric(12)	=null,
@GraceLimit	numeric(12)	=null,
@GraceTillDate	smalldatetime	=null,
@CurID	nvarchar(10)=null,
@SalesmanagerID	nvarchar(50)=null,
@InhouseConsultantID	nvarchar(50)=null,
@WebUserName	nvarchar(18)	=null,
@WebPassword	nvarchar(50)	=null,
@UserID	nvarchar(50)=null,
@Logoname	nvarchar(50)=null,
@AcCPerson nvarchar(100)=null,
@AcCPemail nvarchar(100)=null,
@AcCPmobile nvarchar(30)=null,
@Localmarkup float=null,
@SearchText nvarchar(1000)=null


)AS
declare @date datetime 
Declare @AcPrefix as nvarchar(50)
Declare @AcSuffix as nvarchar(50)
Declare @AccountCode as nvarchar(50)
set @date=CONVERT(varchar(8), GETDATE(), 112) 
if @Trans = 'v'
begin
	if @Customerid is not null
	Begin
		if @flg = 1
		Begin
			Select 
			CustomerID,
			CustomerName,
			CityID,
			Telephone,
			U.UserName 'SalesManager',
			U1.UserName 'InhouseConsultant',
			status,
			CrFacility,
			CreditDays,
			CREDITAMOUNT,
			CreditLimit,
			GraceLimit,
			GraceTillDate,Localmarkup
			from 
			customermaster , usermaster U,usermaster U1
			where  salesmanagerid = U.userid and inhouseconsultantid = U1.userid and Customerid = @CustomerID order by CustomerID
		End
		else
		Begin
			Select * from Customermaster where Customerid=@Customerid order by Customerid
		End
	End
	else
	Begin
		if @flg = 1
		Begin
			Select 
			CustomerID,
			CustomerName,
			CityID,
			Telephone,
			U.UserName 'SalesManager',
			U1.UserName 'InhouseConsultant',
			status,
			CrFacility,
			CreditDays,
			CREDITAMOUNT,
			CreditLimit,
			GraceLimit,
			GraceTillDate,Localmarkup
			from 
			customermaster , usermaster U,usermaster U1
			where  salesmanagerid = U.userid and inhouseconsultantid = U1.userid order by CustomerID

		End
		Else
		Begin
			Select * from Customermaster
		End
	End
end 
if @Trans = 'a'
begin 

	
	
	EXECUTE @CustomerID = spControlParamsSel @CodeId='CustomerID'
	Insert into Customermaster( 
			CustomerID,
			CustomerName,
			CTID,
			Address,
			CityID,
			Telephone,
			Fax,
			Email,
			Status,
			CrFacility,
			CreditDays,
			CreditAmount,
			CreditLimit,
			GraceLimit,
			GraceTillDate,
			CurID,
			SalesmanagerID,
			InhouseConsultantID,
			WebUserName,
			WebPassword,
			UserID,
			ModDate,
			AcCPerson,Localmarkup,
AcCPemail,
AcCPmobile	) 
	values ( 
			@CustomerID,
			@CustomerName,
			@CTID,
			@Address,
			@CityID,
			@Telephone,
			@Fax,
			@Email,
			@Status	,
			@CrFacility,
			@CreditDays,
			@CreditAmount,
			@CreditLimit,
			@GraceLimit	,
			@GraceTillDate	,
			@CurID	,
			@SalesmanagerID	,
			@InhouseConsultantID	,
			@WebUserName,
			@WebPassword,
			@UserID	,@date,@AcCPerson,@Localmarkup,
@AcCPemail,
@AcCPmobile)

	If @@RowCount > 0 
	Begin
		Select @AcPrefix = ParameterValue from SysParameters where ParameterName = 'SundryDebtorsTravel'
		Set @AcSuffix = @customerID
		Set @AccountCode = @AcPrefix + @AcSuffix
		
		Insert into tblAccounts (
			AccountCode,		AccountName,		AccountType,
			OpeningBalance,	DC,			Debit,		Credit,
			SubLedger,		BankCash,		IsApply,UserID, ModDate
					)
		Values(
			@AccountCode,		@CustomerName,	@CTID,
			0,			'D',			0,	0,
			1,			'O',			1,	@UserID, @date		
			)
	if @@RowCount > 0
		Update Customermaster SET AccountCode = @AccountCode Where CustomerID = @CustomerID
	End
	Else 
	Begin
		return 0
	End
	return @customerID
end 
if @Trans = 'e'
begin 
	update Customermaster set 
		CustomerName=@CustomerName,
		CTID=@CTID,
		Address=@Address,
		CityID=@CityID,
		Telephone=@Telephone,
		Fax=@Fax,
		Email=@Email,
		Status=@Status,
		CrFacility=@CrFacility,
		CreditDays=@CreditDays,
		CreditAmount=@CreditAmount,
		CreditLimit=@CreditLimit,
		GraceLimit=@GraceLimit,
		GraceTillDate=@GraceTillDate,
		CurID=@CurID,
		SalesmanagerID=@SalesmanagerID,
		InhouseConsultantID=@InhouseConsultantID,
		WebUserName=@WebUserName,
		WebPassword=@WebPassword,
		UserID=@UserID,
		moddate =@date,
		AcCPerson=@AcCPerson,
AcCPemail=@AcCPemail,
AcCPmobile=@AcCPmobile,Localmarkup=@Localmarkup
		
	 where CustomerID = @CustomerID
If @@RowCount > 0 
Begin
	Select @AccountCode = AccountCode From Customermaster where CustomerID = @CustomerID
	Update tblAccounts  set  AccountName = @CustomerName where AccountCode = @AccountCode
End
Else 
Begin
	return 0
End
return @CustomerID
end
if @Trans = 'd'
begin
	return 'Customer can not be deleted'
end 
if @Trans = 'i'
begin
 Update Customermaster SET Logoname =   @Logoname Where CustomerID = @CustomerID
end 
if @Trans = 's' 
begin
 declare @QryStr varchar(2000)
 set @QryStr ='Select 
			CustomerID,
			CustomerName,
			CityID,
			Telephone,
			U.UserName ''SalesManager'',
			U1.UserName ''InhouseConsultant'',
			status,
			CrFacility,
			CreditDays,
			CREDITAMOUNT,
			CreditLimit,
			GraceLimit,
			GraceTillDate,Localmarkup
			from 
			customermaster , usermaster U,usermaster U1
			where  salesmanagerid = U.userid and inhouseconsultantid = U1.userid and ' + convert(varchar(5000),@SearchText) +' order by CustomerID'
		execute(@QryStr)
end
GO
/****** Object:  StoredProcedure [dbo].[spBkgMaster]    Script Date: 03/27/2013 17:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBkgMaster] 
(
@Trans varchar(1),@flg int = 0,@bkgid		nvarchar(50)=null output,	@bkglocid	nvarchar(50)=null,	@bkgdate		smalldatetime	=null,@bkgtype		nvarchar(1)=null,	@bkgstatus	nvarchar(1)	=null,
@fromallocation	nvarchar(1)	=null,@customerid	nvarchar(50)	=null,@consultanatid	nvarchar(50)	=null,@custremarks	nvarchar(500)	=null,@custrefno	nvarchar(50)	=null,
@SalesRate	numeric(18, 5)	=null,@salescurrid	nvarchar(10)	=null,@salesexrate	numeric(18, 5)	=null,@salesamt	numeric(18, 5)	=null,@basecurratbkg	nvarchar(10)	=null,
@supplierid	nvarchar(50)	=null,@supprefno	nvarchar(50)	=null,@suppconfno	nvarchar(50)	=null,@suppremarks	nvarchar(500)	=null,@paycurrid	nvarchar(10)	=null,
@payexrate	numeric(18, 5)	=null,@payamt		numeric(18, 5)	=null,@serviceid	int	=null,@compcode	nvarchar(10)=null,	@compconsulid	nvarchar(10)	=null,
@compconsulmarkupamt	numeric(8, 0)=null,	@checkin	smalldatetime	=null,@checkout	smalldatetime=null,	@noofnights	int	=null,@productid	bigint	=null,@ratehid	bigint	=null,
@ratedid	bigint	=null,@ratesdid	bigint	=null,@leadpaxname	nvarchar(200)=null,	@noofrooms	int	=null,@adults	int	=null,
@children	int	=null,@paxdetail	bit=null,	@SalesInvNo	nvarchar(50)	=null,@PurchaseBillNo	nvarchar(50)	=null,@CancellationRec	numeric(18, 5)	=null,
@CancellationPay	numeric(18, 5)	=null,@lastmoduserid	nvarchar(50)	=null,@SearchText nvarchar(1000)=null,@Ntop bigint=null,@flg1 int=0) AS

declare @date datetime ,@CityId nvarchar(10),@SqlQry nvarchar(1000),@FromDate smalldatetime,@Todate date
set @date=CONVERT(varchar(8), GETDATE(), 112) 
Set @FromDate =DateAdd(Day,-@Ntop,@Date)
Set @Todate =  @date 
Set @SqlQry = ' bkgdate between ''' + convert(varchar(20),@FromDate )+ ''' and ''' + convert(varchar(20),@Todate) + ''''
if @Trans = 'v' -- flag for view data 
begin
	if @flg = 1 -- customer consultant related Fetch 
	begin
		if @flg1 = 1 
		begin
			set @SqlQry = 'select  bkgid,Bkglocid,bkgdate,custrefno,Salesamt,checkin,checkout,noofnights,p.productname,leadpaxName from bkgmaster b, productmaster p where
								   p.productid =b.productid and ' + @SqlQry + ' and customerid= ''' + @customerid + ''' and consultanatid=''' + @consultanatid + ''' and bkgstatus = ' + @bkgstatus 
			exec (@SqlQry )
		end
		if @flg1 = 2
		begin
			set @SqlQry = 'select  count(*) from bkgmaster where    ' + @SqlQry + ' and customerid= ''' + @customerid + ''' and consultanatid=''' + @consultanatid + ''' and bkgstatus = ' + @bkgstatus  
			exec (@SqlQry ) 
		end
	end
	if @flg = 2 --  customer Related Fetch
	begin
		if @flg1 = 1 
		begin
			set @SqlQry = 'select  bkgid,Bkglocid,bkgdate,leadpaxname,custrefno,Salesamt,checkin,checkout,noofnights,p.ProductName,c.ConsultantName,b.consultanatid   from bkgmaster b, productmaster p,CustConsultantMaster C where
								   p.productid =b.productid and C.ConsultantID = b.consultanatid  and' + @SqlQry + ' and b.customerid= ''' + @customerid + '''  and bkgstatus = ' + @bkgstatus 
			exec (@SqlQry ) 
		end
		if @flg1 = 2
		begin
			set @SqlQry = 'select  count(*) from bkgmaster where    ' + @SqlQry + ' and customerid= ''' + @customerid + ''' and bkgstatus = ' + @bkgstatus  
			exec (@SqlQry ) 
		end
	end
	if @flg =3 --  company consultant Related Fetch 
	begin
		if @flg1 = 1 
		begin
			set @SqlQry = 'select  bkgid,Bkglocid,bkgdate,b.serviceid ,leadpaxname,b.customerid,b.supplierid,custrefno,b.suppremarks,Salesamt,payamt,checkin,checkout,noofnights,p.ProductName,b.consultanatid   from bkgmaster b, productmaster p ,UserMaster U where
								   p.productid =b.productid and U.userid = b.compconsulid  and ' + @SqlQry + ' and b.compconsulid= ''' + @compconsulid + '''  and bkgstatus = ' + @bkgstatus 
			exec (@SqlQry ) 
		end
		if @flg1 = 2
		begin
			set @SqlQry = 'select  count(*) from bkgmaster where    ' + @SqlQry + ' and compconsulid= ''' + @compconsulid + ''' and bkgstatus = ' + @bkgstatus  
			exec (@SqlQry )
		end
	end
	if @flg = 4 --- Administrator Related Fetch 
	begin
		if @flg1 = 1 
		begin
			set @SqlQry = 'select  * from bkgmaster where  bkgid=''' + @bkgid + '''  and Bkglocid  = ''' + @bkglocid + ''''
			exec (@SqlQry ) 
		end
		if @flg1 = 2
		begin
				set @SqlQry = 'select  * from bkgmaster where  bkgid=''' + @bkgid + ''''
				exec (@SqlQry ) 
		end
	end 
end
if @Trans='a'
begin
	if @bkgid is null
	begin 
		EXECUTE @bkgid = spControlParamsSel @CodeId='BkgId'
	end 
	EXECUTE @bkglocid = spControlParamsSel @CodeId='BkgLocId'
	select @CityId = CityID  from ProductMaster where ProductID = @productid 
	set @bkglocid = 	@CityId + @bkglocid
	insert into BkgMaster (bkgid,	
	bkglocid	,		bkgdate			,	bkgtype		,		bkgstatus		,	fromallocation		,	customerid		,	consultanatid		,	custremarks		,	custrefno		,
	SalesRate		,	salescurrid		,	salesexrate		,	salesamt		,	basecurratbkg		,	supplierid		,	supprefno		,	suppconfno		,	suppremarks		,
	paycurrid		,	payexrate		,	payamt			,	serviceid,	compcode	,		compconsulid		,	compconsulmarkupamt	,		checkin		,
	checkout	,		noofnights		,	productid		,	ratehid		,	ratedid		,	ratesdid		,	leadpaxname	,		noofrooms	,	adults	,
	children	,	paxdetail,		CancellationRec		,	CancellationPay		,	lastmoduserid		,	moddate	) 
	values (
	@bkgid		,		@bkglocid	,		@date			,	@bkgtype		,		@bkgstatus		,	@fromallocation		,	@customerid		,	@consultanatid		,
	@custremarks		,	@custrefno		,	@SalesRate		,	@salescurrid		,	@salesexrate		,	@salesamt		,	@basecurratbkg		,	@supplierid		,
	@supprefno		,	@suppconfno		,	@suppremarks		,	@paycurrid		,	@payexrate		,	@payamt			,	@serviceid	,	@compcode	,	
	@compconsulid		,	@compconsulmarkupamt	,		@checkin		,	@checkout	,		@noofnights	,	@productid	,	@ratehid	,	@ratedid	,
	@ratesdid	,	@leadpaxname	,		@noofrooms	,	@adults	,	@children	,	@paxdetail,		@CancellationRec		,	@CancellationPay		,	@lastmoduserid		,	@date	
	)
	if @@ROWCOUNT > 0 
		return 1 
	else
		return 0 
end 


/*if @Trans ='e'
begin 
end 
if @Trans ='s'
begin
end  */
GO
/****** Object:  StoredProcedure [dbo].[spProductImages]    Script Date: 03/27/2013 17:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spProductImages]
(
@flg int = 0,
@Trans varchar(1),
@ProductID bigint =NULL,@ImageAddress nvarchar(300)=null
)AS
begin
if @Trans = 'v'
		select * from ProductImages	where ProductID = @ProductID
if @Trans = 'a'
begin 
	Insert into ProductImages(	ProductID,ImageAddress)
	values 
	(@ProductID,@ImageAddress)
	If @@RowCount > 0 
		return '1'
	else
		return '0'
end 
if @Trans = 'd'
begin
	delete from ProductImages where ImageAddress = @ImageAddress and ProductID = @ProductID
	if @@ROWCOUNT > 0
		return '1'
	else
		return '0'
end 
 end
GO
/****** Object:  StoredProcedure [dbo].[spSupplierMaster]    Script Date: 03/27/2013 17:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSupplierMaster] 
(
@flg int = 0,
@Trans varchar(1),
@SupplierID	nvarchar(50)=null,
@SupplierName	nvarchar(50)=null,
@STID	nvarchar(10)=null,
@Address	nvarchar(300)=null,
@CityID	nvarchar(100)=null,
@Telephone	nvarchar(30)=null,
@Fax	nvarchar(30)=null,
@Email	nvarchar(50)=null,
@CurID	nvarchar(10)	=null,
@remarks	nvarchar(100)	=null,
@BankDetails	nvarchar(200)=null,
@AcCPerson	nvarchar(100)	=null,
@AcCPEmail	nvarchar(100)	=null,
@AcCPMobile	nvarchar(30)	=null,
@CreditLimit	decimal(12)	=null,
@CreditDays	decimal(12)	=null,
@WebUserName	nvarchar(18)	=null,
@webPassword	nvarchar(50)	=null,
@ISXML	bit	=null,
@UserID	nvarchar(50)=null,
@SearchText nvarchar(2000)=null

)AS
declare @date datetime 
Declare @AcPrefix as nvarchar(50)
Declare @AcSuffix as nvarchar(50)
Declare @AccountCode as nvarchar(50)
set @date=CONVERT(varchar(8), GETDATE(), 112) 
if @Trans = 'v'
begin
	if @SupplierID is not null
	Begin
		if @flg = 1
		Begin
			select SupplierID,SupplierName,CityID,CurID,CreditLimit,AcCPerson,AcCPEmail,AccountCode,ISXML
			from 
			SupplierMaster where supplierid = @SupplierID order by SupplierName
		End
		else
		Begin
			select * from SupplierMaster  where supplierid = @SupplierID
		End
	End
	else
	Begin
		if @flg = 1
		Begin
			select SupplierID,SupplierName,CityID,CurID,CreditLimit,AcCPerson,AcCPEmail,AccountCode,ISXML
			from 
			SupplierMaster order by SupplierName		
			End
		Else
		Begin
			select * from SupplierMaster
		End
	End
end 
if @Trans = 'a'
begin 

	
	
	EXECUTE @SupplierID = spControlParamsSel @CodeId='SupplierID'
	Insert into SupplierMaster(	SupplierID,
	SupplierName,
	STID,
	Address,
	CityID,
	Telephone,
	Fax,
	Email,
	CurID,
	remarks,
	BankDetails,
	AcCPerson,
	AcCPEmail,
	AcCPMobile,
CreditLimit,
CreditDays,
WebUserName,
webPassword,
ISXML,
UserID,
ModDate	) 	values ( 
			@SupplierID	,
@SupplierName	,
@STID	,
@Address	,
@CityID	,
@Telephone	,
@Fax	,
@Email	,
@CurID	,
@remarks,
@BankDetails	,
@AcCPerson	,
@AcCPEmail	,
@AcCPMobile	,
@CreditLimit	,
@CreditDays	,
@WebUserName,
@webPassword	,
@ISXML	,
@UserID	,
			@date)

	If @@RowCount > 0 
	Begin
		Select @AcPrefix = ParameterValue from SysParameters where ParameterName = 'SundryCreditors'
		Set @AcSuffix = @SupplierID
		Set @AccountCode = @AcPrefix + @AcSuffix
		
		
		Insert into tblAccounts (
		AccountCode,		AccountName,		AccountType,
		OpeningBalance,	DC,			Debit,	Credit,
		SubLedger,		BankCash,		IsApply,
		UserId,			ModDate
		)
	Values(
		@AccountCode,		@SupplierName,	'L',
		0,			'C',			0,	0,
		0,			'O',			1,
		@UserId,		@date
		)
	
	if @@RowCount > 0
		Update SupplierMaster SET AccountCode = @AccountCode Where supplierID = @SupplierID
	End
	Else 
	Begin
		return 0
	End
	return @SupplierID
end 
if @Trans = 'e'
begin 
	update SupplierMaster set 
	SupplierID=@SupplierID,
SupplierName=@SupplierName,
STID=@STID,
Address=@Address,
CityID=@CityID,
Telephone=@Telephone,
Fax=@Fax,
Email=@Email,
CurID=@CurID,
remarks=@remarks,
BankDetails=@BankDetails,
AcCPerson=@AcCPerson,
AcCPEmail=@AcCPEmail,
AcCPMobile=@AcCPMobile,
CreditLimit=@CreditLimit,
CreditDays=@CreditDays,
WebUserName=@WebUserName,
webPassword=@webPassword,
ISXML=@ISXML,	
		UserID=@UserID,
		moddate =@date
	 where SupplierID = @SupplierID
If @@RowCount > 0 
Begin
	Select @AccountCode = AccountCode From SupplierMaster where SupplierID = @SupplierID
	Update tblAccounts  set  AccountName = @SupplierName where AccountCode = @AccountCode
End
Else 
Begin
	return 0
End
return '1'
end 
if @Trans = 'd'
begin
	return 'Supplier can not be deleted'
end 
if @Trans = 's' 
begin
declare @QryStr varchar(2000)

			set @QryStr ='select SupplierID,SupplierName,CityID,CurID,CreditLimit,AcCPerson,AcCPEmail,AccountCode,ISXML
			from 
			SupplierMaster where ' + convert(varchar(5000),@SearchText) +' order by SupplierID'
	execute(@QryStr)
end
GO
/****** Object:  StoredProcedure [dbo].[spRatesDFetch]    Script Date: 03/27/2013 17:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spRatesDFetch]
	(
	@SDate smalldatetime, @Edate smalldatetime,@CId nvarchar(100),@LID int=null,@ProdName nvarchar(200)=null,@CurrId nvarchar(10)=null,
	@SerId int=null,@Cls_Id int=null,@CustID nvarchar(50),@flag int = 0,@flag2 int=0,@pRatehid bigint=null,@pRateDid bigint=null,@pRateSdid bigint=null,
	@ProductId1 bigint=null,@RCID1 int=null,@RoomTHID1 int=null, @RoomTDID1  bigint=null,@RateBasisID1 nvarchar(10)=null ) as

	begin
	--SELECT CURRENT_TIMESTAMP
	-- Rates markup are calculated on  customer's markup from customer table 
	-- Limitation in this SP is rates For Each Product should be under one RateHeaderID , 
	Declare @SingDate smalldatetime,@WeekDay Nvarchar(2),@intFlag INT, @nights INT,@TempVal bigint=0,@ConvertExrate float=1,@CustMarkup float=0

	Declare @RateSdid bigint,@RCID int,@RoomTHID int, @RoomTDID  bigint,@RateBasisID nvarchar(10),@ReleaseDays int,@Rate1 float,@Rate2 float,@Rate3 float,@PayRate float,@SupplierId nvarchar(50)

	if @CurrID is null begin
		set @ConvertExrate =1 
	end 
	else
		begin
		--get current exRate
		Select @ConvertExrate = SellingExrate From CurrencyMaster where CurID = @currid
	end
	--Check for Customer Markup 
	select @CustMarkup = localmarkup from customermaster where customerid = @CustID
	--print  @ConvertExrate
	
	CREATE TABLE #tRHF (ratehid bigint,RateDid bigint,ProductID bigint,	weekdays nvarchar(20),	weekenddays nvarchar(20),CurId nvarchar(10),	serviceCharges float,	Commission float,allDays bit,SupplierID nvarchar(50))

	create table #ratesT1 (RateHid bigint,RateDid bigint,RateSdid bigint,productId bigint,RCID int,RoomTHID int, RoomTDID  bigint,RateBasisID nvarchar(10),ReleaseDays int,Sdate smalldatetime,Sday nvarchar(2),Rate decimal(12,3),AllDay bit,PayRate decimal(12,3),Supplierid nvarchar(50))
	
	insert into #tRHF exec spRatesHFetch @DateFrom= @SDate,@DateTo=@EDate ,@CityId=@CId,@ServiceId=@SerId,@ClsId=@Cls_id,@CustomerID=@CustID,@flg=@flag,@productName=@prodName


--select * from #trhf
	Declare @ratehid bigint,@RateDid bigint,@ProductID bigint,@weekdays nvarchar(20),
		@weekenddays nvarchar(20),@CurId nvarchar(10),@serviceCharges float,@Commission float,@allDays bit,@Exrate float
	DECLARE RHCur CURSOR FAST_FORWARD FOR SELECT ratehid ,RateDid ,ProductID ,	weekdays ,weekenddays ,CurId ,	serviceCharges ,	Commission ,allDays,Supplierid  FROM #TRHF  
	 
	open RHCur;
	fetch next from RHCur into @ratehid ,@RateDid ,@ProductID,	@weekdays ,@weekenddays,@CurId ,@serviceCharges ,@Commission,@allDays,@supplierid ;
		WHILE @@FETCH_STATUS =0 
		begin 
			Select @Exrate = SellingExrate From CurrencyMaster where CurID = @curid

			---------------begin Inner Loop To Add Each Date 

			select @nights =  DATEDIFF(day,@SDate,@Edate)
			SET @intFlag = 0
			WHILE (@intFlag <@nights)
			BEGIN
				select @SingDate = DATEADD(day,@intFlag,@SDate)
				select @WeekDay = upper(CONVERT(VARCHAR(2), DATENAME(dw, @SingDate), 100))
					
				DECLARE RDCur CURSOR FAST_FORWARD FOR SELECT RATESDID,RCID,RoomCHID,RoomCDID,RateBasisID,ReleaseDays,Rate1,Rate2,rate3 FROM RateSubDetail WHERE RateDID = @RateDid
				open RDCur;
				fetch next from RDCur into @RateSdid,@RCID,@RoomTHID,@RoomTDID,@RateBasisID,@ReleaseDays,@Rate1,@Rate2,@Rate3;
					WHILE @@FETCH_STATUS =0 
					begin 
						if @allDays = 1 
						begin
							select @Tempval=ratedid from RateDetail where @SingDate between DateFrom and DateTo and RateHID = @ratehid and RateDID = @RateDid 
							if @@ROWCOUNT > 0 
								insert into #ratesT1 values (@ratehid,@RateDid,@RateSdid,@ProductID,@RCID ,@RoomTHID,@RoomTDID,@RateBasisID ,@ReleaseDays,@SingDate,@WeekDay ,(@Rate1*@Exrate) / @ConvertExrate ,@allDays,(@Rate1*@Exrate) / @ConvertExrate,@SupplierId  );
						end
						else
						begin
							select @Tempval=ratedid from RateDetail where @SingDate between DateFrom and DateTo and RateHID = @ratehid and RateDID = @RateDid  
							if @@ROWCOUNT > 0 
							begin
								select @Tempval=RateHid  from RateHeader where WeekDays like '%' + @weekDay + '%' and RateHID = @ratehid  
								if @@ROWCOUNT > 0 
									insert into #ratesT1 values (@ratehid,@RateDid,@RateSdid,@ProductID,@RCID ,@RoomTHID,@RoomTDID,@RateBasisID ,@ReleaseDays,@SingDate,@WeekDay ,(@Rate1*@Exrate) / @ConvertExrate ,@allDays ,(@Rate1*@Exrate) / @ConvertExrate,@SupplierId );
								select @Tempval=RateHid  from RateHeader where WeekEndDays like '%' + @weekDay + '%' and RateHID = @ratehid 
								if @@ROWCOUNT > 0 
									insert into #ratesT1 values (@ratehid,@RateDid,@RateSdid,@ProductID,@RCID ,@RoomTHID,@RoomTDID,@RateBasisID ,@ReleaseDays,@SingDate,@WeekDay ,(@Rate2*@Exrate) / @ConvertExrate ,@allDays ,(@Rate2*@Exrate) / @ConvertExrate,@SupplierId );
							end
						end  
						fetch next from RDCur into @RateSdid,@RCID,@RoomTHID,@RoomTDID,@RateBasisID,@ReleaseDays,@Rate1,@Rate2,@Rate3;
					end
						deallocate RDCur;
						SET @intFlag = @intFlag + 1
					END
	---------------end Inner Loop
			fetch next from RHCur into @ratehid ,@RateDid ,@ProductID,	@weekdays ,@weekenddays,@CurId ,@serviceCharges ,@Commission,@allDays,@supplierid ;
		end 

		deallocate RHCur;
		if @flag2 = 0 
		begin
			select * from #ratesT1
		end
		else if @flag2 = 1 
		begin
			select RateHid ,RateDid ,RateSdid ,productId ,RCID ,RoomTHID , RoomTDID,RateBasisID,sum(rate)'trate',avg(rate)'arate',sum(PayRate) 'prate',Supplierid    from #ratesT1 
			 group by RateHid ,RateDid ,RateSdid ,productId ,RCID ,RoomTHID , RoomTDID,RateBasisID,Supplierid  having RateHid =@pRatehid and RateDid = @pRateDid 
		end
		else if @flag2 = 11 
		begin
			select RateHid ,RateDid ,RateSdid ,productId ,RCID ,RoomTHID , RoomTDID,RateBasisID,sum(rate)'trate',avg(rate)'arate',sum(PayRate) 'prate',Supplierid    from #ratesT1 
			 group by RateHid ,RateDid ,RateSdid ,productId ,RCID ,RoomTHID , RoomTDID,RateBasisID,Supplierid   
		end
		else if @flag2= 2 
		begin
			select * from #ratesT1 where  RateHid =@pRatehid and RateDid = @pRateDid and RateSdid = @pRateSdid
		end
		else if @flag2= 3
		begin
			create table #ratesT2 (supplierid nvarchar(50),ProductID bigint,RCID int,RoomTHID int, RoomTDID  bigint,RateBasisID nvarchar(10),TotalAmt decimal(12,3),AvgRate decimal(12,3),PayRate decimal(12,3))
			create table #ratesT3 (supplierid nvarchar(50),RCID int,RoomTHID int, RoomTDID  bigint,RateBasisID nvarchar(10),TotalAmt decimal(12,3),AvgRate decimal(12,3),PayRate decimal(12,3))
			
			insert into #ratesT2  select Supplierid,productId,rcid,roomthid,roomtdid,ratebasisID, max(rate)+ max(rate) * (@CustMarkup/100)'Rate',0,Max(PayRate )  from #ratesT1 
 			group by Supplierid,productId,rcid,roomthid,roomtdid,Sdate,RateBasisID  having productId =@ProductId1  order by ratebasisid
			insert into #ratesT3  select supplierid,rcid,roomthid,roomtdid,ratebasisID,SUM(TotalAmt),AVG(TotalAmt),sum(payRate) from #ratesT2 group by  supplierid,rcid,roomthid,roomtdid,ratebasisID 
			
			select TT.supplierid,TT.RCID,TT.RoomTHID,TT.RoomTDID,TT.RateBasisID,rth.RoomTHName,rtd.RoomTDName,rb.RateBasisName ,totalAmt, AvgRate,PayRate from RoomTypeHeader rth,RoomTypeDetail rtd,RateBasis rb ,#ratesT3  TT
			where rth.RoomTHID = rtd.RoomTHID and tt.RoomTdID = rtd.RoomTDID and rb.RateBasisID = TT.RateBasisID
		
		end
		else if @flag2= 31
		begin
		--select * from #ratesT1
			select sday,sdate,max(rate) + max(rate) * (@CustMarkup/100) 'SaleRate' ,MAX(payrate) 'PayRate' from #ratesT1
			 group by productId,rcid,roomthid,roomtdid,Sdate,sday,RateBasisID 
			 having productId =@ProductId1 and rcid=@rcid1 and roomthid=@RoomTHID1 and roomtdid = @RoomTDID1 and  RateBasisID =@RateBasisID1   order by Sdate asc
		end
		else if @flag2= 32
		begin
			create table #ratesT12 (supplierid nvarchar(50),ProductID bigint,RCID int,RoomTHID int, RoomTDID  bigint,RateBasisID nvarchar(10),TotalAmt decimal(12,3),AvgRate decimal(12,3),PayRate decimal(12,3))
			create table #ratesT13 (ProductID bigint,supplierid nvarchar(50),RCID int,RoomTHID int, RoomTDID  bigint,RateBasisID nvarchar(10),TotalAmt decimal(12,3),AvgRate decimal(12,3),PayRate decimal(12,3))
			
			insert into #ratesT12  select Supplierid,productId,rcid,roomthid,roomtdid,ratebasisID, max(rate)+ max(rate) * (@CustMarkup/100)'Rate',0,Max(PayRate )  from #ratesT1 
 			group by Supplierid,productId,rcid,roomthid,roomtdid,Sdate,RateBasisID   order by ratebasisid
			insert into #ratesT13  select productId,supplierid,rcid,roomthid,roomtdid,ratebasisID,SUM(TotalAmt),AVG(TotalAmt),sum(payRate) from #ratesT12 group by  productId,supplierid,rcid,roomthid,roomtdid,ratebasisID 
			
			select TT.ProductID,TT.supplierid,TT.RCID,TT.RoomTHID,TT.RoomTDID,TT.RateBasisID,rth.RoomTHName,rtd.RoomTDName,rb.RateBasisName ,totalAmt, AvgRate,PayRate from RoomTypeHeader rth,RoomTypeDetail rtd,RateBasis rb ,#ratesT13  TT
			where rth.RoomTHID = rtd.RoomTHID and tt.RoomTdID = rtd.RoomTDID and rb.RateBasisID = TT.RateBasisID order by productid,avgRate
		
		end
		else if @flag2= 33
		begin
			create table #ratesT112 (supplierid nvarchar(50),ProductID bigint,RCID int,RoomTHID int, RoomTDID  bigint,RateBasisID nvarchar(10),TotalAmt decimal(12,3),AvgRate decimal(12,3),PayRate decimal(12,3))
			create table #ratesT113 (ProductID bigint,supplierid nvarchar(50),RCID int,RoomTHID int, RoomTDID  bigint,RateBasisID nvarchar(10),TotalAmt decimal(12,3),AvgRate decimal(12,3),PayRate decimal(12,3))
			create table #ratesT114 (ProductID bigint,aaRate float)
			insert into #ratesT112  select Supplierid,productId,rcid,roomthid,roomtdid,ratebasisID, max(rate)+ max(rate) * (@CustMarkup/100)'Rate',0,Max(PayRate )  from #ratesT1 
 			group by Supplierid,productId,rcid,roomthid,roomtdid,Sdate,RateBasisID   order by ratebasisid
			insert into #ratesT113  select productId,supplierid,rcid,roomthid,roomtdid,ratebasisID,SUM(TotalAmt),AVG(TotalAmt),sum(payRate) from #ratesT112 group by  productId,supplierid,rcid,roomthid,roomtdid,ratebasisID 
			
			select TT.ProductID ,min(AvgRate) 'aaRate' from RoomTypeHeader rth,RoomTypeDetail rtd,RateBasis rb ,#ratesT113  TT  
			where rth.RoomTHID = rtd.RoomTHID and tt.RoomTdID = rtd.RoomTDID and rb.RateBasisID = TT.RateBasisID group by TT.ProductID 
		
		end
		--select * from #ratesT1
	--SELECT CURRENT_TIMESTAMP
	end
GO
/****** Object:  StoredProcedure [dbo].[spRoomTypes]    Script Date: 03/27/2013 17:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spRoomTypes]
(
@flg int = 0, -- 1 for Header and 2 for Detail
@Trans varchar(1),
@RoomTHID int=NULL,
@RoomTHName nvarchar(100)=NULL,
@ServiceID int=NULL,
@RCID int=NULL,
@UserID nvarchar(50)=NULL,
@RoomTDID bigint=NULL,
@RoomTDName nvarchar(100)=NULL,
@SearchText nvarchar(1000)=null
)AS
declare @date datetime
set @date=CONVERT(varchar(8), GETDATE(), 112)
if @Trans = 'v'
begin
if @RoomTHID is not null and @flg=1
select RTH.RoomTHID,RTH.RoomTHName,S.ServiceName,RC.RCName from RoomTypeHeader RTH,ServicesMaster S,RateCategory RC where
RTH.ServiceID = s.ServiceID and RTH.RCID = RC.RCID and RTH.RoomTHID = @RoomTHID
else if @RoomTHID is null and @flg=1
select RTH.RoomTHID,RTH.RoomTHName,S.ServiceName,RC.RCName from RoomTypeHeader RTH,ServicesMaster S,RateCategory RC where
RTH.ServiceID = s.ServiceID and RTH.RCID = RC.RCID
if @RoomTHID is not null and @flg=11
select * from RoomTypeHeader where RoomTHID = @RoomTHID
else if @RoomTHID is null and @flg=11
select * from RoomTypeHeader
if @RoomTHID is not null and @flg=2
select * from RoomTypedetail where RoomTHID = @RoomTHID
if @RoomTDID is not null and @flg=22
select * from RoomTypedetail where RoomTDID = @RoomTDID

end
if @Trans = 'a'
begin
if @flg = 1
begin
Insert into RoomTypeHeader( [RoomTHName],[ServiceID],[RCID],[UserID],[ModDate] ) values (@RoomTHName ,@ServiceID ,@RCID ,@UserID,@date)
If @@RowCount > 0
begin
set @RoomTHID = (select MAX(RoomTHID) from roomtypeheader )
return @RoomTHID
end

else
return '0'
end
else if @flg = 2
begin
Insert into RoomTypeDetail ([RoomTDName],[RoomTHID])Values (@RoomTDName,@RoomTHID)
If @@RowCount > 0
return '1'
else
return '0'
end
end
if @Trans = 'e'
begin
if @flg=1
begin
update RoomTypeHeader set RoomTHName=@RoomTHName,[ServiceID]=@ServiceID,[RCID]=@RCID,UserID=@UserID,moddate =@date where RoomTHID = @RoomTHID
If @@RowCount > 0
return @RoomTHID
else
return '0'
end
if @flg=2
begin
update RoomTypedetail set RoomTDName=@RoomTDName where RoomTDID = @RoomTDID
If @@RowCount > 0
return '1'
else
return '0'
end
end
if @Trans = 'd'
begin
delete from RoomTypeDetail where RoomTHID = @RoomTHID
delete from RoomTypeHeader where RoomTHID = @RoomTHID
if @@ROWCOUNT > 0
return '1'
else
return '0'
end

If @Trans ='s'
begin
declare @QryStr varchar(2000)
set @QryStr =' '+ convert(varchar(5000),@SearchText) +' '
execute(@QryStr)
end
GO
/****** Object:  StoredProcedure [dbo].[spRateSubDetail]    Script Date: 03/27/2013 17:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRateSubDetail] 
(
@flg int = 0,
@Trans varchar(1),
	@RateSDID bigint=null,
	@RateDID bigint= NULL,
	@RCID int=null,
	@RoomCHID int= NULL,
	@RoomCDID int= NULL,
	@RateBasisID nvarchar(10)= NULL,
	@Rate1 float =NULL,
	@Rate2 float =NULL,
	@Rate3 float =NULL,
	@AllocRooms int =NULL,
	@ReleaseDays int =NULL
)AS
declare @date datetime 
set @date=CONVERT(varchar(8), GETDATE(), 112) 
if @Trans = 'v'
begin
	if @RateSDID is not null
	Begin
			select RC.RCName,RTH.RoomTHName,RTD.RoomTDName,RB.RateBasisName,Rate1,Rate2,AllocRooms ,ReleaseDays, ratesdid,RateDID  from  
RateSubDetail RSD,RateCategory RC,RoomTypeHeader RTH , RoomTypeDetail RTD,RateBasis RB where 
RSD.rcid = RC.RCID and RSD.RoomCHID = RTH.RoomTHID and RSD.RoomCDID = RTD.RoomTDID and RSD.RateBasisID = RB.RateBasisID 
and  RSD.Ratedid=@RatedID  and RSD.RateSDID = @RateSDID
			end
	else
	Begin
				select RC.RCName,RTH.RoomTHName,RTD.RoomTDName,RB.RateBasisName,Rate1,Rate2,AllocRooms ,ReleaseDays, ratesdid,RateDID  from  
RateSubDetail RSD,RateCategory RC,RoomTypeHeader RTH , RoomTypeDetail RTD,RateBasis RB where 
RSD.rcid = RC.RCID and RSD.RoomCHID = RTH.RoomTHID and RSD.RoomCDID = RTD.RoomTDID and RSD.RateBasisID = RB.RateBasisID 
and RSD.RateDID = @RateDID  order by RSD.RateSDID 
	end
end 
if @Trans = 'a'
begin 
	Insert into RateSubDetail(		RateDID,rcid,	RoomCHID,	RoomCDID,	RateBasisID,	Rate1,Rate2,Rate3,	AllocRooms,	ReleaseDays) values (	@RateDID,@RCID ,	@RoomCHID,	@RoomCDID,	@RateBasisID,	@Rate1,@Rate2,@Rate3,	@AllocRooms,	@ReleaseDays)
	If @@RowCount > 0 
		return '1'
	else
		return '0'
end 
if @Trans = 'e'
begin 
	update RateSubDetail  set 
		rcid= @rcid, RateDID=@RateDID,	RoomCHID=@RoomCHID,	RoomCDID=@RoomCDID,	RateBasisID=@RateBasisID,	Rate1=@Rate1,Rate2=@Rate2,Rate3=@Rate3,	AllocRooms=@AllocRooms,	ReleaseDays=@ReleaseDays
		 where RateSDID=@RateSDID
If @@RowCount > 0 
	return '1'
else
	return '0'
end 
--if @Trans = 'd'
--If @Trans ='s' 
--begin 
-- declare @QryStr varchar(2000)
-- set @QryStr ='select * from CustTypeMaster where  '+ convert(varchar(5000),@SearchText) +' order by CTID'
-- execute(@QryStr)
--end
GO
/****** Object:  StoredProcedure [dbo].[SpRatesProductDisplay]    Script Date: 03/27/2013 17:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SpRatesProductDisplay](
@SDate smalldatetime, @Edate smalldatetime,@CId nvarchar(100),@LID int=null,@ProdName nvarchar(200)=null,@CurrId nvarchar(10)=null,
	@SerId int=null,@Cls_Id int=null,@CustID nvarchar(50),@flag int = 0,@flag2 int=0,@pRatehid bigint=null,@pRateDid bigint=null,@pRateSdid bigint=null,
	@ProductId1 bigint=null,@RCID1 int=null,@RoomTHID1 int=null, @RoomTDID1  bigint=null,@RateBasisID1 nvarchar(10)=null,@virtualDirectory nvarchar(100)=null ) as

 begin

Create table #HeaderInfo

(
      RecordLocator int IDENTITY (1,1) NOT NULL,
      ProductID bigint, ProductName varchar(200),     ratehid bigint,   weekdays nvarchar(20),     weekenddays nvarchar(20),
      supplierid nvarchar(50),      CurId nvarchar(10),     serviceCharges float,      Commission float, HHRemarks varchar(1000),
      hotelTel nvarchar(50),  hotelFax nvarchar(50),  hotelemail nvarchar(50),      Allmarket bit,  allDays bit,
      RateDid bigint,Seasonid bigint,DateFrom smalldatetime,DateTo smalldatetime,
      MarkupIP int,MarkupIA float,CancelPolicy nvarchar(100),
      CancelAmt float,CancelDays int,childPolicy nvarchar(100), ExtraBed float ,HDremarks nvarchar(1000)
      ,ProductAddress nvarchar(100),ThumbnailPath nvarchar(100),ShortDescription nvarchar(1000),ClsName nvarchar(100),CityName nvarchar(200))
 

Declare @SqlStr nvarchar(4000)

Set @SqlStr = 
'insert into #HeaderInfo  select 

      H.ProductID ,     H.Description ,   H.ratehid , H.weekdays ,      H.weekenddays ,      H.supplierid ,    H.CurId ,   H.serviceCharges ,

      H.Commission ,    H.Remarks , H.hotelTel ,      H.hotelFax ,      H.hoteemail ,      H.Allmarket ,     H.allDays ,

      D.RateDid , D.Seasonid ,      D.DateFrom ,      D.DateTo,   D.MarkupIP ,      D.MarkupIA ,      D.CancelPolicy ,

      D.CancelAmt ,     D.CancelDays ,    D.childPolicy ,   D.ExtraBed  ,     D.remarks ,P.Address,''' + convert(varchar,@virtualDirectory) + '''+P.ThumbnailPath ''ThumbnailPath'' ,P.ShortDescription,F.ClsName,C.CityName

from 

RateHeader H , RateDetail  D ,CityMaster C,LocationMaster L ,ProductMaster P,ServicesMaster S,Classifications F

where  

H.RateHID= D.RateHID  and

H.ProductID = P.ProductID and P.LocID = L.LocID and L.CityID = C.CityID and  P.ServiceID = S.ServiceID and P.ClsID = F.ClsID and

P.ServiceID =' + Convert(Varchar,@SerId) +'  and 

 (''' + Convert(Varchar,@SDate) + '''<= D.Dateto and ''' + Convert(Varchar,@EDate) + ''' >= D.DateFrom )

and h.Publish = 1 and C.CityID = ''' + Convert(Varchar,@CId) + ''''

if @ProdName is not null 

begin

Set @SqlStr = @SqlStr + ' AND P.ProductName like ''%' + Convert(Varchar,@ProdName) + '%''  '

end

if @Cls_Id is not null 

 begin 

 Set @SqlStr = @SqlStr + ' And P.ClsID = ' + Convert(Varchar,@Cls_Id) 

 end

if @LID is not null 

 begin 

 Set @SqlStr = @SqlStr + ' And L.LocID = ' + Convert(Varchar,@LID) 

 end


Execute (@SqlStr)


	Declare @SingDate date,@WeekDay Nvarchar(2),@intFlag INT, @nights INT,@TempVal bigint=0,@ConvertExrate float=1,@CustMarkup float=0

	Declare @RateSdid bigint,@RCID int,@RoomTHID int, @RoomTDID  bigint,@RateBasisID nvarchar(10),@ReleaseDays int,@Rate1 float,@Rate2 float,@Rate3 float,@PayRate float,@SupplierId nvarchar(50)

	if @CurrID is null begin
		set @ConvertExrate =1 
	end 
	else
		begin
		--get current exRate
		Select @ConvertExrate = SellingExrate From CurrencyMaster where CurID = @currid
	end
	--Check for Customer Markup 
	select @CustMarkup = localmarkup from customermaster where customerid = @CustID
	--print  @ConvertExrate
	
	CREATE TABLE #tRHF (ratehid bigint,RateDid bigint,ProductID bigint,	weekdays nvarchar(20),	weekenddays nvarchar(20),CurId nvarchar(10),	serviceCharges float,	Commission float,allDays bit,SupplierID nvarchar(50))

	create table #ratesT1 (RateHid bigint,RateDid bigint,RateSdid bigint,productId bigint,RCID int,RoomTHID int, RoomTDID  bigint,RateBasisID nvarchar(10),ReleaseDays int,Sdate date,Sday nvarchar(2),Rate decimal(12,3),AllDay bit,PayRate decimal(12,3),Supplierid nvarchar(50))
	
	--insert into #tRHF  exec spRatesHFetch @DateFrom= @SDate,@DateTo=@EDate ,@CityId=@CId,@ServiceId=@SerId,@ClsId=@Cls_id,@CustomerID=@CustID,@flg=@flag,@productName=@prodName
insert into #tRHF  select ratehid,ratedid,ProductId,Weekdays,weekenddays,CurId,ServiceCharges,Commission,Alldays,SupplierID from #HeaderInfo
	

--select * from #trhf
	Declare @ratehid bigint,@RateDid bigint,@ProductID bigint,@weekdays nvarchar(20),
		@weekenddays nvarchar(20),@CurId nvarchar(10),@serviceCharges float,@Commission float,@allDays bit,@Exrate float
	DECLARE RHCur CURSOR FAST_FORWARD FOR SELECT ratehid ,RateDid ,ProductID ,	weekdays ,weekenddays ,CurId ,	serviceCharges ,	Commission ,allDays,Supplierid  FROM #TRHF  
	 
	open RHCur;
	fetch next from RHCur into @ratehid ,@RateDid ,@ProductID,	@weekdays ,@weekenddays,@CurId ,@serviceCharges ,@Commission,@allDays,@supplierid ;
		WHILE @@FETCH_STATUS =0 
		begin 
			Select @Exrate = SellingExrate From CurrencyMaster where CurID = @curid

			---------------begin Inner Loop To Add Each Date 

			select @nights =  DATEDIFF(day,@SDate,@Edate)
			SET @intFlag = 0
			WHILE (@intFlag <@nights)
			BEGIN
				select @SingDate = DATEADD(day,@intFlag,@SDate)
				select @WeekDay = upper(CONVERT(VARCHAR(2), DATENAME(dw, @SingDate), 100))
					
				DECLARE RDCur CURSOR FAST_FORWARD FOR SELECT RATESDID,RCID,RoomCHID,RoomCDID,RateBasisID,ReleaseDays,Rate1,Rate2,rate3 FROM RateSubDetail WHERE RateDID = @RateDid
				open RDCur;
				fetch next from RDCur into @RateSdid,@RCID,@RoomTHID,@RoomTDID,@RateBasisID,@ReleaseDays,@Rate1,@Rate2,@Rate3;
					WHILE @@FETCH_STATUS =0 
					begin 
						if @allDays = 1 
						begin
							select @Tempval=ratedid from RateDetail where @SingDate between DateFrom and DateTo and RateHID = @ratehid and RateDID = @RateDid 
							if @@ROWCOUNT > 0 
								insert into #ratesT1 values (@ratehid,@RateDid,@RateSdid,@ProductID,@RCID ,@RoomTHID,@RoomTDID,@RateBasisID ,@ReleaseDays,@SingDate,@WeekDay ,(@Rate1*@Exrate) / @ConvertExrate ,@allDays,(@Rate1*@Exrate) / @ConvertExrate,@SupplierId  );
						end
						else
						begin
							select @Tempval=ratedid from RateDetail where @SingDate between DateFrom and DateTo and RateHID = @ratehid and RateDID = @RateDid  
							if @@ROWCOUNT > 0 
							begin
								select @Tempval=RateHid  from RateHeader where WeekDays like '%' + @weekDay + '%' and RateHID = @ratehid  
								if @@ROWCOUNT > 0 
									insert into #ratesT1 values (@ratehid,@RateDid,@RateSdid,@ProductID,@RCID ,@RoomTHID,@RoomTDID,@RateBasisID ,@ReleaseDays,@SingDate,@WeekDay ,(@Rate1*@Exrate) / @ConvertExrate ,@allDays ,(@Rate1*@Exrate) / @ConvertExrate,@SupplierId );
								select @Tempval=RateHid  from RateHeader where WeekEndDays like '%' + @weekDay + '%' and RateHID = @ratehid 
								if @@ROWCOUNT > 0 
									insert into #ratesT1 values (@ratehid,@RateDid,@RateSdid,@ProductID,@RCID ,@RoomTHID,@RoomTDID,@RateBasisID ,@ReleaseDays,@SingDate,@WeekDay ,(@Rate2*@Exrate) / @ConvertExrate ,@allDays ,(@Rate2*@Exrate) / @ConvertExrate,@SupplierId );
							end
						end  
						fetch next from RDCur into @RateSdid,@RCID,@RoomTHID,@RoomTDID,@RateBasisID,@ReleaseDays,@Rate1,@Rate2,@Rate3;
					end
						deallocate RDCur;
						SET @intFlag = @intFlag + 1
					END
	---------------end Inner Loop
			fetch next from RHCur into @ratehid ,@RateDid ,@ProductID,	@weekdays ,@weekenddays,@CurId ,@serviceCharges ,@Commission,@allDays,@supplierid ;
		end 

		deallocate RHCur;
			create table #ratesT112 (supplierid nvarchar(50),ProductID bigint,RCID int,RoomTHID int, RoomTDID  bigint,RateBasisID nvarchar(10),TotalAmt decimal(12,3),AvgRate decimal(12,3),PayRate decimal(12,3))
			create table #ratesT113 (ProductID bigint,supplierid nvarchar(50),RCID int,RoomTHID int, RoomTDID  bigint,RateBasisID nvarchar(10),TotalAmt decimal(12,3),AvgRate decimal(12,3),PayRate decimal(12,3))
			create table #ratesT114 (ProductID bigint,AvgRate float)
			insert into #ratesT112  select Supplierid,productId,rcid,roomthid,roomtdid,ratebasisID, max(rate)+ max(rate) * (@CustMarkup/100)'Rate',0,Max(PayRate )  from #ratesT1 
 			group by Supplierid,productId,rcid,roomthid,roomtdid,Sdate,RateBasisID   order by ratebasisid
			insert into #ratesT113  select productId,supplierid,rcid,roomthid,roomtdid,ratebasisID,SUM(TotalAmt),AVG(TotalAmt),sum(payRate) from #ratesT112 group by  productId,supplierid,rcid,roomthid,roomtdid,ratebasisID 
			
			insert into #ratesT114 select TT.ProductID ,min(AvgRate) 'AvgRate' from RoomTypeHeader rth,RoomTypeDetail rtd,RateBasis rb ,#ratesT113  TT  
			where rth.RoomTHID = rtd.RoomTHID and tt.RoomTdID = rtd.RoomTDID and rb.RateBasisID = TT.RateBasisID group by TT.ProductID 
			
			select A.*,B.AvgRate from #HeaderInfo A,#ratesT114 B where A.ProductID = B.ProductID order by B.AvgRate 
		
	


end
GO
/****** Object:  View [dbo].[vw_aspnet_Users]    Script Date: 03/27/2013 17:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_Users]
  AS SELECT [dbo].[aspnet_Users].[ApplicationId], [dbo].[aspnet_Users].[UserId], [dbo].[aspnet_Users].[UserName], [dbo].[aspnet_Users].[LoweredUserName], [dbo].[aspnet_Users].[MobileAlias], [dbo].[aspnet_Users].[IsAnonymous], [dbo].[aspnet_Users].[LastActivityDate]
  FROM [dbo].[aspnet_Users]
GO
/****** Object:  View [dbo].[vw_aspnet_Roles]    Script Date: 03/27/2013 17:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_Roles]
  AS SELECT [dbo].[aspnet_Roles].[ApplicationId], [dbo].[aspnet_Roles].[RoleId], [dbo].[aspnet_Roles].[RoleName], [dbo].[aspnet_Roles].[LoweredRoleName], [dbo].[aspnet_Roles].[Description]
  FROM [dbo].[aspnet_Roles]
GO
/****** Object:  StoredProcedure [dbo].[spProductAmenities]    Script Date: 03/27/2013 17:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spProductAmenities]
(
@flg int = 0,
@Trans varchar(1),
@ProductID bigint = NULL,
@AmenitiesID bigint = NULL
)AS
begin
if @Trans = 'v'
begin
if @flg=0 
		select * from ProductAmenities	where ProductID = @ProductID
else	
		Select AmenitiesName  from Amenities, productamenities where 	productamenities.AmenitiesId = Amenities.AmenitiesID  and ProductAmenities.productID = @ProductID 
end
if @Trans = 'a'
begin 
	Insert into ProductAmenities(	ProductID,AmenitiesId)
	values 
	(@ProductID,@AmenitiesID)
	If @@RowCount > 0 
		return '1'
	else
		return '0'
end 
if @Trans = 'd'
begin
	delete from ProductAmenities where ProductID = @ProductID
	if @@ROWCOUNT > 0
		return '1'
	else
		return '0'
end 
 end
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_Paths]    Script Date: 03/27/2013 17:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_WebPartState_Paths]
  AS SELECT [dbo].[aspnet_Paths].[ApplicationId], [dbo].[aspnet_Paths].[PathId], [dbo].[aspnet_Paths].[Path], [dbo].[aspnet_Paths].[LoweredPath]
  FROM [dbo].[aspnet_Paths]
GO
/****** Object:  Table [dbo].[ProductRRC]    Script Date: 03/27/2013 17:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductRRC](
	[RRCID] [bigint] IDENTITY(1,1) NOT NULL,
	[productID] [bigint] NULL,
	[RCID] [bigint] NULL,
	[RoomTHID] [bigint] NULL,
	[RoomTDID] [bigint] NULL,
 CONSTRAINT [PK_ProductRRC] PRIMARY KEY CLUSTERED 
(
	[RRCID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_CreateRole]    Script Date: 03/27/2013 17:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Roles_CreateRole]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
        SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF (EXISTS(SELECT RoleId FROM dbo.aspnet_Roles WHERE LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId))
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    INSERT INTO dbo.aspnet_Roles
                (ApplicationId, RoleName, LoweredRoleName)
         VALUES (@ApplicationId, @RoleName, LOWER(@RoleName))

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        COMMIT TRANSACTION
    END

    RETURN(0)

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Paths_CreatePath]    Script Date: 03/27/2013 17:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Paths_CreatePath]
    @ApplicationId UNIQUEIDENTIFIER,
    @Path           NVARCHAR(256),
    @PathId         UNIQUEIDENTIFIER OUTPUT
AS
BEGIN
    BEGIN TRANSACTION
    IF (NOT EXISTS(SELECT * FROM dbo.aspnet_Paths WHERE LoweredPath = LOWER(@Path) AND ApplicationId = @ApplicationId))
    BEGIN
        INSERT dbo.aspnet_Paths (ApplicationId, Path, LoweredPath) VALUES (@ApplicationId, @Path, LOWER(@Path))
    END
    COMMIT TRANSACTION
    SELECT @PathId = PathId FROM dbo.aspnet_Paths WHERE LOWER(@Path) = LoweredPath AND ApplicationId = @ApplicationId
END
GO
/****** Object:  Table [dbo].[aspnet_Membership]    Script Date: 03/27/2013 17:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Membership](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordFormat] [int] NOT NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[MobilePIN] [nvarchar](16) NULL,
	[Email] [nvarchar](256) NULL,
	[LoweredEmail] [nvarchar](256) NULL,
	[PasswordQuestion] [nvarchar](256) NULL,
	[PasswordAnswer] [nvarchar](128) NULL,
	[IsApproved] [bit] NOT NULL,
	[IsLockedOut] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastLoginDate] [datetime] NOT NULL,
	[LastPasswordChangedDate] [datetime] NOT NULL,
	[LastLockoutDate] [datetime] NOT NULL,
	[FailedPasswordAttemptCount] [int] NOT NULL,
	[FailedPasswordAttemptWindowStart] [datetime] NOT NULL,
	[FailedPasswordAnswerAttemptCount] [int] NOT NULL,
	[FailedPasswordAnswerAttemptWindowStart] [datetime] NOT NULL,
	[Comment] [ntext] NULL,
PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [aspnet_Membership_index] ON [dbo].[aspnet_Membership] 
(
	[ApplicationId] ASC,
	[LoweredEmail] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_PersonalizationAllUsers]    Script Date: 03/27/2013 17:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_PersonalizationAllUsers](
	[PathId] [uniqueidentifier] NOT NULL,
	[PageSettings] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PathId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_PersonalizationPerUser]    Script Date: 03/27/2013 17:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_PersonalizationPerUser](
	[Id] [uniqueidentifier] NOT NULL,
	[PathId] [uniqueidentifier] NULL,
	[UserId] [uniqueidentifier] NULL,
	[PageSettings] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE UNIQUE CLUSTERED INDEX [aspnet_PersonalizationPerUser_index1] ON [dbo].[aspnet_PersonalizationPerUser] 
(
	[PathId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [aspnet_PersonalizationPerUser_ncindex2] ON [dbo].[aspnet_PersonalizationPerUser] 
(
	[UserId] ASC,
	[PathId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_Profile]    Script Date: 03/27/2013 17:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Profile](
	[UserId] [uniqueidentifier] NOT NULL,
	[PropertyNames] [ntext] NOT NULL,
	[PropertyValuesString] [ntext] NOT NULL,
	[PropertyValuesBinary] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_RoleExists]    Script Date: 03/27/2013 17:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Roles_RoleExists]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(0)
    IF (EXISTS (SELECT RoleName FROM dbo.aspnet_Roles WHERE LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId ))
        RETURN(1)
    ELSE
        RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_GetAllRoles]    Script Date: 03/27/2013 17:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Roles_GetAllRoles] (
    @ApplicationName           nvarchar(256))
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN
    SELECT RoleName
    FROM   dbo.aspnet_Roles WHERE ApplicationId = @ApplicationId
    ORDER BY RoleName
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Users_CreateUser]    Script Date: 03/27/2013 17:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Users_CreateUser]
    @ApplicationId    uniqueidentifier,
    @UserName         nvarchar(256),
    @IsUserAnonymous  bit,
    @LastActivityDate DATETIME,
    @UserId           uniqueidentifier OUTPUT
AS
BEGIN
    IF( @UserId IS NULL )
        SELECT @UserId = NEWID()
    ELSE
    BEGIN
        IF( EXISTS( SELECT UserId FROM dbo.aspnet_Users
                    WHERE @UserId = UserId ) )
            RETURN -1
    END

    INSERT dbo.aspnet_Users (ApplicationId, UserId, UserName, LoweredUserName, IsAnonymous, LastActivityDate)
    VALUES (@ApplicationId, @UserId, @UserName, LOWER(@UserName), @IsUserAnonymous, @LastActivityDate)

    RETURN 0
END
GO
/****** Object:  Table [dbo].[aspnet_UsersInRoles]    Script Date: 03/27/2013 17:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_UsersInRoles](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [aspnet_UsersInRoles_index] ON [dbo].[aspnet_UsersInRoles] 
(
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Users_DeleteUser]    Script Date: 03/27/2013 17:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Users_DeleteUser]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @TablesToDeleteFrom int,
    @NumTablesDeletedFrom int OUTPUT
AS
BEGIN
    DECLARE @UserId               uniqueidentifier
    SELECT  @UserId               = NULL
    SELECT  @NumTablesDeletedFrom = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
	SET @TranStarted = 0

    DECLARE @ErrorCode   int
    DECLARE @RowCount    int

    SET @ErrorCode = 0
    SET @RowCount  = 0

    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a
    WHERE   u.LoweredUserName       = LOWER(@UserName)
        AND u.ApplicationId         = a.ApplicationId
        AND LOWER(@ApplicationName) = a.LoweredApplicationName

    IF (@UserId IS NULL)
    BEGIN
        GOTO Cleanup
    END

    -- Delete from Membership table if (@TablesToDeleteFrom & 1) is set
    IF ((@TablesToDeleteFrom & 1) <> 0 AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_MembershipUsers') AND (type = 'V'))))
    BEGIN
        DELETE FROM dbo.aspnet_Membership WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
               @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_UsersInRoles table if (@TablesToDeleteFrom & 2) is set
    IF ((@TablesToDeleteFrom & 2) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_UsersInRoles') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_UsersInRoles WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_Profile table if (@TablesToDeleteFrom & 4) is set
    IF ((@TablesToDeleteFrom & 4) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Profiles') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_Profile WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_PersonalizationPerUser table if (@TablesToDeleteFrom & 8) is set
    IF ((@TablesToDeleteFrom & 8) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_WebPartState_User') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationPerUser WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_Users table if (@TablesToDeleteFrom & 1,2,4 & 8) are all set
    IF ((@TablesToDeleteFrom & 1) <> 0 AND
        (@TablesToDeleteFrom & 2) <> 0 AND
        (@TablesToDeleteFrom & 4) <> 0 AND
        (@TablesToDeleteFrom & 8) <> 0 AND
        (EXISTS (SELECT UserId FROM dbo.aspnet_Users WHERE @UserId = UserId)))
    BEGIN
        DELETE FROM dbo.aspnet_Users WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    IF( @TranStarted = 1 )
    BEGIN
	    SET @TranStarted = 0
	    COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:
    SET @NumTablesDeletedFrom = 0

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
	    ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_DeleteRole]    Script Date: 03/27/2013 17:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Roles_DeleteRole]
    @ApplicationName            nvarchar(256),
    @RoleName                   nvarchar(256),
    @DeleteOnlyIfRoleIsEmpty    bit
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
        SET @TranStarted = 0

    DECLARE @RoleId   uniqueidentifier
    SELECT  @RoleId = NULL
    SELECT  @RoleId = RoleId FROM dbo.aspnet_Roles WHERE LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId

    IF (@RoleId IS NULL)
    BEGIN
        SELECT @ErrorCode = 1
        GOTO Cleanup
    END
    IF (@DeleteOnlyIfRoleIsEmpty <> 0)
    BEGIN
        IF (EXISTS (SELECT RoleId FROM dbo.aspnet_UsersInRoles  WHERE @RoleId = RoleId))
        BEGIN
            SELECT @ErrorCode = 2
            GOTO Cleanup
        END
    END


    DELETE FROM dbo.aspnet_UsersInRoles  WHERE @RoleId = RoleId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    DELETE FROM dbo.aspnet_Roles WHERE @RoleId = RoleId  AND ApplicationId = @ApplicationId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        COMMIT TRANSACTION
    END

    RETURN(0)

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_SetPageSettings]    Script Date: 03/27/2013 17:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_SetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @PageSettings     IMAGE,
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Paths_CreatePath @ApplicationId, @Path, @PathId OUTPUT
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, 0, @CurrentTimeUtc, @UserId OUTPUT
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    IF (EXISTS(SELECT PathId FROM dbo.aspnet_PersonalizationPerUser WHERE UserId = @UserId AND PathId = @PathId))
        UPDATE dbo.aspnet_PersonalizationPerUser SET PageSettings = @PageSettings, LastUpdatedDate = @CurrentTimeUtc WHERE UserId = @UserId AND PathId = @PathId
    ELSE
        INSERT INTO dbo.aspnet_PersonalizationPerUser(UserId, PathId, PageSettings, LastUpdatedDate) VALUES (@UserId, @PathId, @PageSettings, @CurrentTimeUtc)
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_ResetPageSettings]    Script Date: 03/27/2013 17:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_ResetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        RETURN
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    DELETE FROM dbo.aspnet_PersonalizationPerUser WHERE PathId = @PathId AND UserId = @UserId
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_GetPageSettings]    Script Date: 03/27/2013 17:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_GetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        RETURN
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    SELECT p.PageSettings FROM dbo.aspnet_PersonalizationPerUser p WHERE p.PathId = @PathId AND p.UserId = @UserId
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UpdateUserInfo]    Script Date: 03/27/2013 17:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UpdateUserInfo]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @IsPasswordCorrect              bit,
    @UpdateLastLoginActivityDate    bit,
    @MaxInvalidPasswordAttempts     int,
    @PasswordAttemptWindow          int,
    @CurrentTimeUtc                 datetime,
    @LastLoginDate                  datetime,
    @LastActivityDate               datetime
AS
BEGIN
    DECLARE @UserId                                 uniqueidentifier
    DECLARE @IsApproved                             bit
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId,
            @IsApproved = m.IsApproved,
            @IsLockedOut = m.IsLockedOut,
            @LastLockoutDate = m.LastLockoutDate,
            @FailedPasswordAttemptCount = m.FailedPasswordAttemptCount,
            @FailedPasswordAttemptWindowStart = m.FailedPasswordAttemptWindowStart,
            @FailedPasswordAnswerAttemptCount = m.FailedPasswordAnswerAttemptCount,
            @FailedPasswordAnswerAttemptWindowStart = m.FailedPasswordAnswerAttemptWindowStart
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m WITH ( UPDLOCK )
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF ( @@rowcount = 0 )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    IF( @IsLockedOut = 1 )
    BEGIN
        GOTO Cleanup
    END

    IF( @IsPasswordCorrect = 0 )
    BEGIN
        IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAttemptWindowStart ) )
        BEGIN
            SET @FailedPasswordAttemptWindowStart = @CurrentTimeUtc
            SET @FailedPasswordAttemptCount = 1
        END
        ELSE
        BEGIN
            SET @FailedPasswordAttemptWindowStart = @CurrentTimeUtc
            SET @FailedPasswordAttemptCount = @FailedPasswordAttemptCount + 1
        END

        BEGIN
            IF( @FailedPasswordAttemptCount >= @MaxInvalidPasswordAttempts )
            BEGIN
                SET @IsLockedOut = 1
                SET @LastLockoutDate = @CurrentTimeUtc
            END
        END
    END
    ELSE
    BEGIN
        IF( @FailedPasswordAttemptCount > 0 OR @FailedPasswordAnswerAttemptCount > 0 )
        BEGIN
            SET @FailedPasswordAttemptCount = 0
            SET @FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            SET @FailedPasswordAnswerAttemptCount = 0
            SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            SET @LastLockoutDate = CONVERT( datetime, '17540101', 112 )
        END
    END

    IF( @UpdateLastLoginActivityDate = 1 )
    BEGIN
        UPDATE  dbo.aspnet_Users
        SET     LastActivityDate = @LastActivityDate
        WHERE   @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END

        UPDATE  dbo.aspnet_Membership
        SET     LastLoginDate = @LastLoginDate
        WHERE   UserId = @UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END


    UPDATE dbo.aspnet_Membership
    SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
        FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
        FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
        FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
        FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
    WHERE @UserId = UserId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UpdateUser]    Script Date: 03/27/2013 17:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UpdateUser]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @Email                nvarchar(256),
    @Comment              ntext,
    @IsApproved           bit,
    @LastLoginDate        datetime,
    @LastActivityDate     datetime,
    @UniqueEmail          int,
    @CurrentTimeUtc       datetime
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId, @ApplicationId = a.ApplicationId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF (@UserId IS NULL)
        RETURN(1)

    IF (@UniqueEmail = 1)
    BEGIN
        IF (EXISTS (SELECT *
                    FROM  dbo.aspnet_Membership WITH (UPDLOCK, HOLDLOCK)
                    WHERE ApplicationId = @ApplicationId  AND @UserId <> UserId AND LoweredEmail = LOWER(@Email)))
        BEGIN
            RETURN(7)
        END
    END

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
	SET @TranStarted = 0

    UPDATE dbo.aspnet_Users WITH (ROWLOCK)
    SET
         LastActivityDate = @LastActivityDate
    WHERE
       @UserId = UserId

    IF( @@ERROR <> 0 )
        GOTO Cleanup

    UPDATE dbo.aspnet_Membership WITH (ROWLOCK)
    SET
         Email            = @Email,
         LoweredEmail     = LOWER(@Email),
         Comment          = @Comment,
         IsApproved       = @IsApproved,
         LastLoginDate    = @LastLoginDate
    WHERE
       @UserId = UserId

    IF( @@ERROR <> 0 )
        GOTO Cleanup

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN -1
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UnlockUser]    Script Date: 03/27/2013 17:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UnlockUser]
    @ApplicationName                         nvarchar(256),
    @UserName                                nvarchar(256)
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF ( @UserId IS NULL )
        RETURN 1

    UPDATE dbo.aspnet_Membership
    SET IsLockedOut = 0,
        FailedPasswordAttemptCount = 0,
        FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 ),
        FailedPasswordAnswerAttemptCount = 0,
        FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 ),
        LastLockoutDate = CONVERT( datetime, '17540101', 112 )
    WHERE @UserId = UserId

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_SetPassword]    Script Date: 03/27/2013 17:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_SetPassword]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @NewPassword      nvarchar(128),
    @PasswordSalt     nvarchar(128),
    @CurrentTimeUtc   datetime,
    @PasswordFormat   int = 0
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF (@UserId IS NULL)
        RETURN(1)

    UPDATE dbo.aspnet_Membership
    SET Password = @NewPassword, PasswordFormat = @PasswordFormat, PasswordSalt = @PasswordSalt,
        LastPasswordChangedDate = @CurrentTimeUtc
    WHERE @UserId = UserId
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_ResetPassword]    Script Date: 03/27/2013 17:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_ResetPassword]
    @ApplicationName             nvarchar(256),
    @UserName                    nvarchar(256),
    @NewPassword                 nvarchar(128),
    @MaxInvalidPasswordAttempts  int,
    @PasswordAttemptWindow       int,
    @PasswordSalt                nvarchar(128),
    @CurrentTimeUtc              datetime,
    @PasswordFormat              int = 0,
    @PasswordAnswer              nvarchar(128) = NULL
AS
BEGIN
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @UserId                                 uniqueidentifier
    SET     @UserId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF ( @UserId IS NULL )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    SELECT @IsLockedOut = IsLockedOut,
           @LastLockoutDate = LastLockoutDate,
           @FailedPasswordAttemptCount = FailedPasswordAttemptCount,
           @FailedPasswordAttemptWindowStart = FailedPasswordAttemptWindowStart,
           @FailedPasswordAnswerAttemptCount = FailedPasswordAnswerAttemptCount,
           @FailedPasswordAnswerAttemptWindowStart = FailedPasswordAnswerAttemptWindowStart
    FROM dbo.aspnet_Membership WITH ( UPDLOCK )
    WHERE @UserId = UserId

    IF( @IsLockedOut = 1 )
    BEGIN
        SET @ErrorCode = 99
        GOTO Cleanup
    END

    UPDATE dbo.aspnet_Membership
    SET    Password = @NewPassword,
           LastPasswordChangedDate = @CurrentTimeUtc,
           PasswordFormat = @PasswordFormat,
           PasswordSalt = @PasswordSalt
    WHERE  @UserId = UserId AND
           ( ( @PasswordAnswer IS NULL ) OR ( LOWER( PasswordAnswer ) = LOWER( @PasswordAnswer ) ) )

    IF ( @@ROWCOUNT = 0 )
        BEGIN
            IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAnswerAttemptWindowStart ) )
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = 1
            END
            ELSE
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount + 1
            END

            BEGIN
                IF( @FailedPasswordAnswerAttemptCount >= @MaxInvalidPasswordAttempts )
                BEGIN
                    SET @IsLockedOut = 1
                    SET @LastLockoutDate = @CurrentTimeUtc
                END
            END

            SET @ErrorCode = 3
        END
    ELSE
        BEGIN
            IF( @FailedPasswordAnswerAttemptCount > 0 )
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = 0
                SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            END
        END

    IF( NOT ( @PasswordAnswer IS NULL ) )
    BEGIN
        UPDATE dbo.aspnet_Membership
        SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
            FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
            FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
            FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
            FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
        WHERE @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByUserId]    Script Date: 03/27/2013 17:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByUserId]
    @UserId               uniqueidentifier,
    @CurrentTimeUtc       datetime,
    @UpdateLastActivity   bit = 0
AS
BEGIN
    IF ( @UpdateLastActivity = 1 )
    BEGIN
        UPDATE   dbo.aspnet_Users
        SET      LastActivityDate = @CurrentTimeUtc
        FROM     dbo.aspnet_Users
        WHERE    @UserId = UserId

        IF ( @@ROWCOUNT = 0 ) -- User ID not found
            RETURN -1
    END

    SELECT  m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate, m.LastLoginDate, u.LastActivityDate,
            m.LastPasswordChangedDate, u.UserName, m.IsLockedOut,
            m.LastLockoutDate
    FROM    dbo.aspnet_Users u, dbo.aspnet_Membership m
    WHERE   @UserId = u.UserId AND u.UserId = m.UserId

    IF ( @@ROWCOUNT = 0 ) -- User ID not found
       RETURN -1

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByName]    Script Date: 03/27/2013 17:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByName]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @CurrentTimeUtc       datetime,
    @UpdateLastActivity   bit = 0
AS
BEGIN
    DECLARE @UserId uniqueidentifier

    IF (@UpdateLastActivity = 1)
    BEGIN
        -- select user ID from aspnet_users table
        SELECT TOP 1 @UserId = u.UserId
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE    LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                LOWER(@UserName) = u.LoweredUserName AND u.UserId = m.UserId

        IF (@@ROWCOUNT = 0) -- Username not found
            RETURN -1

        UPDATE   dbo.aspnet_Users
        SET      LastActivityDate = @CurrentTimeUtc
        WHERE    @UserId = UserId

        SELECT m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
                m.CreateDate, m.LastLoginDate, u.LastActivityDate, m.LastPasswordChangedDate,
                u.UserId, m.IsLockedOut, m.LastLockoutDate
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE  @UserId = u.UserId AND u.UserId = m.UserId 
    END
    ELSE
    BEGIN
        SELECT TOP 1 m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
                m.CreateDate, m.LastLoginDate, u.LastActivityDate, m.LastPasswordChangedDate,
                u.UserId, m.IsLockedOut,m.LastLockoutDate
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE    LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                LOWER(@UserName) = u.LoweredUserName AND u.UserId = m.UserId

        IF (@@ROWCOUNT = 0) -- Username not found
            RETURN -1
    END

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByEmail]    Script Date: 03/27/2013 17:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByEmail]
    @ApplicationName  nvarchar(256),
    @Email            nvarchar(256)
AS
BEGIN
    IF( @Email IS NULL )
        SELECT  u.UserName
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                u.UserId = m.UserId AND
                m.LoweredEmail IS NULL
    ELSE
        SELECT  u.UserName
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                u.UserId = m.UserId AND
                LOWER(@Email) = m.LoweredEmail

    IF (@@rowcount = 0)
        RETURN(1)
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetPasswordWithFormat]    Script Date: 03/27/2013 17:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetPasswordWithFormat]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @UpdateLastLoginActivityDate    bit,
    @CurrentTimeUtc                 datetime
AS
BEGIN
    DECLARE @IsLockedOut                        bit
    DECLARE @UserId                             uniqueidentifier
    DECLARE @Password                           nvarchar(128)
    DECLARE @PasswordSalt                       nvarchar(128)
    DECLARE @PasswordFormat                     int
    DECLARE @FailedPasswordAttemptCount         int
    DECLARE @FailedPasswordAnswerAttemptCount   int
    DECLARE @IsApproved                         bit
    DECLARE @LastActivityDate                   datetime
    DECLARE @LastLoginDate                      datetime

    SELECT  @UserId          = NULL

    SELECT  @UserId = u.UserId, @IsLockedOut = m.IsLockedOut, @Password=Password, @PasswordFormat=PasswordFormat,
            @PasswordSalt=PasswordSalt, @FailedPasswordAttemptCount=FailedPasswordAttemptCount,
		    @FailedPasswordAnswerAttemptCount=FailedPasswordAnswerAttemptCount, @IsApproved=IsApproved,
            @LastActivityDate = LastActivityDate, @LastLoginDate = LastLoginDate
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF (@UserId IS NULL)
        RETURN 1

    IF (@IsLockedOut = 1)
        RETURN 99

    SELECT   @Password, @PasswordFormat, @PasswordSalt, @FailedPasswordAttemptCount,
             @FailedPasswordAnswerAttemptCount, @IsApproved, @LastLoginDate, @LastActivityDate

    IF (@UpdateLastLoginActivityDate = 1 AND @IsApproved = 1)
    BEGIN
        UPDATE  dbo.aspnet_Membership
        SET     LastLoginDate = @CurrentTimeUtc
        WHERE   UserId = @UserId

        UPDATE  dbo.aspnet_Users
        SET     LastActivityDate = @CurrentTimeUtc
        WHERE   @UserId = UserId
    END


    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetPassword]    Script Date: 03/27/2013 17:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetPassword]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @MaxInvalidPasswordAttempts     int,
    @PasswordAttemptWindow          int,
    @CurrentTimeUtc                 datetime,
    @PasswordAnswer                 nvarchar(128) = NULL
AS
BEGIN
    DECLARE @UserId                                 uniqueidentifier
    DECLARE @PasswordFormat                         int
    DECLARE @Password                               nvarchar(128)
    DECLARE @passAns                                nvarchar(128)
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId,
            @Password = m.Password,
            @passAns = m.PasswordAnswer,
            @PasswordFormat = m.PasswordFormat,
            @IsLockedOut = m.IsLockedOut,
            @LastLockoutDate = m.LastLockoutDate,
            @FailedPasswordAttemptCount = m.FailedPasswordAttemptCount,
            @FailedPasswordAttemptWindowStart = m.FailedPasswordAttemptWindowStart,
            @FailedPasswordAnswerAttemptCount = m.FailedPasswordAnswerAttemptCount,
            @FailedPasswordAnswerAttemptWindowStart = m.FailedPasswordAnswerAttemptWindowStart
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m WITH ( UPDLOCK )
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF ( @@rowcount = 0 )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    IF( @IsLockedOut = 1 )
    BEGIN
        SET @ErrorCode = 99
        GOTO Cleanup
    END

    IF ( NOT( @PasswordAnswer IS NULL ) )
    BEGIN
        IF( ( @passAns IS NULL ) OR ( LOWER( @passAns ) <> LOWER( @PasswordAnswer ) ) )
        BEGIN
            IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAnswerAttemptWindowStart ) )
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = 1
            END
            ELSE
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount + 1
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
            END

            BEGIN
                IF( @FailedPasswordAnswerAttemptCount >= @MaxInvalidPasswordAttempts )
                BEGIN
                    SET @IsLockedOut = 1
                    SET @LastLockoutDate = @CurrentTimeUtc
                END
            END

            SET @ErrorCode = 3
        END
        ELSE
        BEGIN
            IF( @FailedPasswordAnswerAttemptCount > 0 )
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = 0
                SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            END
        END

        UPDATE dbo.aspnet_Membership
        SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
            FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
            FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
            FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
            FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
        WHERE @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    IF( @ErrorCode = 0 )
        SELECT @Password, @PasswordFormat

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetNumberOfUsersOnline]    Script Date: 03/27/2013 17:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetNumberOfUsersOnline]
    @ApplicationName            nvarchar(256),
    @MinutesSinceLastInActive   int,
    @CurrentTimeUtc             datetime
AS
BEGIN
    DECLARE @DateActive datetime
    SELECT  @DateActive = DATEADD(minute,  -(@MinutesSinceLastInActive), @CurrentTimeUtc)

    DECLARE @NumOnline int
    SELECT  @NumOnline = COUNT(*)
    FROM    dbo.aspnet_Users u(NOLOCK),
            dbo.aspnet_Applications a(NOLOCK),
            dbo.aspnet_Membership m(NOLOCK)
    WHERE   u.ApplicationId = a.ApplicationId                  AND
            LastActivityDate > @DateActive                     AND
            a.LoweredApplicationName = LOWER(@ApplicationName) AND
            u.UserId = m.UserId
    RETURN(@NumOnline)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetAllUsers]    Script Date: 03/27/2013 17:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetAllUsers]
    @ApplicationName       nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0


    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
    SELECT u.UserId
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u
    WHERE  u.ApplicationId = @ApplicationId AND u.UserId = m.UserId
    ORDER BY u.UserName

    SELECT @TotalRecords = @@ROWCOUNT

    SELECT u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY u.UserName
    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_FindUsersByName]    Script Date: 03/27/2013 17:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_FindUsersByName]
    @ApplicationName       nvarchar(256),
    @UserNameToMatch       nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
        SELECT u.UserId
        FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND u.LoweredUserName LIKE LOWER(@UserNameToMatch)
        ORDER BY u.UserName


    SELECT  u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY u.UserName

    SELECT  @TotalRecords = COUNT(*)
    FROM    #PageIndexForUsers
    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_FindUsersByEmail]    Script Date: 03/27/2013 17:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_FindUsersByEmail]
    @ApplicationName       nvarchar(256),
    @EmailToMatch          nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    IF( @EmailToMatch IS NULL )
        INSERT INTO #PageIndexForUsers (UserId)
            SELECT u.UserId
            FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
            WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND m.Email IS NULL
            ORDER BY m.LoweredEmail
    ELSE
        INSERT INTO #PageIndexForUsers (UserId)
            SELECT u.UserId
            FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
            WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND m.LoweredEmail LIKE LOWER(@EmailToMatch)
            ORDER BY m.LoweredEmail

    SELECT  u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY m.LoweredEmail

    SELECT  @TotalRecords = COUNT(*)
    FROM    #PageIndexForUsers
    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_CreateUser]    Script Date: 03/27/2013 17:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_CreateUser]
    @ApplicationName                        nvarchar(256),
    @UserName                               nvarchar(256),
    @Password                               nvarchar(128),
    @PasswordSalt                           nvarchar(128),
    @Email                                  nvarchar(256),
    @PasswordQuestion                       nvarchar(256),
    @PasswordAnswer                         nvarchar(128),
    @IsApproved                             bit,
    @CurrentTimeUtc                         datetime,
    @CreateDate                             datetime = NULL,
    @UniqueEmail                            int      = 0,
    @PasswordFormat                         int      = 0,
    @UserId                                 uniqueidentifier OUTPUT
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @NewUserId uniqueidentifier
    SELECT @NewUserId = NULL

    DECLARE @IsLockedOut bit
    SET @IsLockedOut = 0

    DECLARE @LastLockoutDate  datetime
    SET @LastLockoutDate = CONVERT( datetime, '17540101', 112 )

    DECLARE @FailedPasswordAttemptCount int
    SET @FailedPasswordAttemptCount = 0

    DECLARE @FailedPasswordAttemptWindowStart  datetime
    SET @FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 )

    DECLARE @FailedPasswordAnswerAttemptCount int
    SET @FailedPasswordAnswerAttemptCount = 0

    DECLARE @FailedPasswordAnswerAttemptWindowStart  datetime
    SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )

    DECLARE @NewUserCreated bit
    DECLARE @ReturnValue   int
    SET @ReturnValue = 0

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    SET @CreateDate = @CurrentTimeUtc

    SELECT  @NewUserId = UserId FROM dbo.aspnet_Users WHERE LOWER(@UserName) = LoweredUserName AND @ApplicationId = ApplicationId
    IF ( @NewUserId IS NULL )
    BEGIN
        SET @NewUserId = @UserId
        EXEC @ReturnValue = dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, 0, @CreateDate, @NewUserId OUTPUT
        SET @NewUserCreated = 1
    END
    ELSE
    BEGIN
        SET @NewUserCreated = 0
        IF( @NewUserId <> @UserId AND @UserId IS NOT NULL )
        BEGIN
            SET @ErrorCode = 6
            GOTO Cleanup
        END
    END

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @ReturnValue = -1 )
    BEGIN
        SET @ErrorCode = 10
        GOTO Cleanup
    END

    IF ( EXISTS ( SELECT UserId
                  FROM   dbo.aspnet_Membership
                  WHERE  @NewUserId = UserId ) )
    BEGIN
        SET @ErrorCode = 6
        GOTO Cleanup
    END

    SET @UserId = @NewUserId

    IF (@UniqueEmail = 1)
    BEGIN
        IF (EXISTS (SELECT *
                    FROM  dbo.aspnet_Membership m WITH ( UPDLOCK, HOLDLOCK )
                    WHERE ApplicationId = @ApplicationId AND LoweredEmail = LOWER(@Email)))
        BEGIN
            SET @ErrorCode = 7
            GOTO Cleanup
        END
    END

    IF (@NewUserCreated = 0)
    BEGIN
        UPDATE dbo.aspnet_Users
        SET    LastActivityDate = @CreateDate
        WHERE  @UserId = UserId
        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    INSERT INTO dbo.aspnet_Membership
                ( ApplicationId,
                  UserId,
                  Password,
                  PasswordSalt,
                  Email,
                  LoweredEmail,
                  PasswordQuestion,
                  PasswordAnswer,
                  PasswordFormat,
                  IsApproved,
                  IsLockedOut,
                  CreateDate,
                  LastLoginDate,
                  LastPasswordChangedDate,
                  LastLockoutDate,
                  FailedPasswordAttemptCount,
                  FailedPasswordAttemptWindowStart,
                  FailedPasswordAnswerAttemptCount,
                  FailedPasswordAnswerAttemptWindowStart )
         VALUES ( @ApplicationId,
                  @UserId,
                  @Password,
                  @PasswordSalt,
                  @Email,
                  LOWER(@Email),
                  @PasswordQuestion,
                  @PasswordAnswer,
                  @PasswordFormat,
                  @IsApproved,
                  @IsLockedOut,
                  @CreateDate,
                  @CreateDate,
                  @CreateDate,
                  @LastLockoutDate,
                  @FailedPasswordAttemptCount,
                  @FailedPasswordAttemptWindowStart,
                  @FailedPasswordAnswerAttemptCount,
                  @FailedPasswordAnswerAttemptWindowStart )

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
	    SET @TranStarted = 0
	    COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]    Script Date: 03/27/2013 17:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]
    @ApplicationName       nvarchar(256),
    @UserName              nvarchar(256),
    @NewPasswordQuestion   nvarchar(256),
    @NewPasswordAnswer     nvarchar(128)
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Membership m, dbo.aspnet_Users u, dbo.aspnet_Applications a
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId
    IF (@UserId IS NULL)
    BEGIN
        RETURN(1)
    END

    UPDATE dbo.aspnet_Membership
    SET    PasswordQuestion = @NewPasswordQuestion, PasswordAnswer = @NewPasswordAnswer
    WHERE  UserId=@UserId
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_AnyDataInTables]    Script Date: 03/27/2013 17:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_AnyDataInTables]
    @TablesToCheck int
AS
BEGIN
    -- Check Membership table if (@TablesToCheck & 1) is set
    IF ((@TablesToCheck & 1) <> 0 AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_MembershipUsers') AND (type = 'V'))))
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Membership))
        BEGIN
            SELECT N'aspnet_Membership'
            RETURN
        END
    END

    -- Check aspnet_Roles table if (@TablesToCheck & 2) is set
    IF ((@TablesToCheck & 2) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Roles') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 RoleId FROM dbo.aspnet_Roles))
        BEGIN
            SELECT N'aspnet_Roles'
            RETURN
        END
    END

    -- Check aspnet_Profile table if (@TablesToCheck & 4) is set
    IF ((@TablesToCheck & 4) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Profiles') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Profile))
        BEGIN
            SELECT N'aspnet_Profile'
            RETURN
        END
    END

    -- Check aspnet_PersonalizationPerUser table if (@TablesToCheck & 8) is set
    IF ((@TablesToCheck & 8) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_WebPartState_User') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_PersonalizationPerUser))
        BEGIN
            SELECT N'aspnet_PersonalizationPerUser'
            RETURN
        END
    END

    -- Check aspnet_PersonalizationPerUser table if (@TablesToCheck & 16) is set
    IF ((@TablesToCheck & 16) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'aspnet_WebEvent_LogEvent') AND (type = 'P'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 * FROM dbo.aspnet_WebEvent_Events))
        BEGIN
            SELECT N'aspnet_WebEvent_Events'
            RETURN
        END
    END

    -- Check aspnet_Users table if (@TablesToCheck & 1,2,4 & 8) are all set
    IF ((@TablesToCheck & 1) <> 0 AND
        (@TablesToCheck & 2) <> 0 AND
        (@TablesToCheck & 4) <> 0 AND
        (@TablesToCheck & 8) <> 0 AND
        (@TablesToCheck & 32) <> 0 AND
        (@TablesToCheck & 128) <> 0 AND
        (@TablesToCheck & 256) <> 0 AND
        (@TablesToCheck & 512) <> 0 AND
        (@TablesToCheck & 1024) <> 0)
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Users))
        BEGIN
            SELECT N'aspnet_Users'
            RETURN
        END
        IF (EXISTS(SELECT TOP 1 ApplicationId FROM dbo.aspnet_Applications))
        BEGIN
            SELECT N'aspnet_Applications'
            RETURN
        END
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_SetPageSettings]    Script Date: 03/27/2013 17:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_SetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path             NVARCHAR(256),
    @PageSettings     IMAGE,
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Paths_CreatePath @ApplicationId, @Path, @PathId OUTPUT
    END

    IF (EXISTS(SELECT PathId FROM dbo.aspnet_PersonalizationAllUsers WHERE PathId = @PathId))
        UPDATE dbo.aspnet_PersonalizationAllUsers SET PageSettings = @PageSettings, LastUpdatedDate = @CurrentTimeUtc WHERE PathId = @PathId
    ELSE
        INSERT INTO dbo.aspnet_PersonalizationAllUsers(PathId, PageSettings, LastUpdatedDate) VALUES (@PathId, @PageSettings, @CurrentTimeUtc)
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings]    Script Date: 03/27/2013 17:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path              NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    DELETE FROM dbo.aspnet_PersonalizationAllUsers WHERE PathId = @PathId
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_GetPageSettings]    Script Date: 03/27/2013 17:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_GetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path              NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT p.PageSettings FROM dbo.aspnet_PersonalizationAllUsers p WHERE p.PathId = @PathId
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_ResetUserState]    Script Date: 03/27/2013 17:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_ResetUserState] (
    @Count                  int                 OUT,
    @ApplicationName        NVARCHAR(256),
    @InactiveSinceDate      DATETIME            = NULL,
    @UserName               NVARCHAR(256)       = NULL,
    @Path                   NVARCHAR(256)       = NULL)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationPerUser
        WHERE Id IN (SELECT PerUser.Id
                     FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
                     WHERE Paths.ApplicationId = @ApplicationId
                           AND PerUser.UserId = Users.UserId
                           AND PerUser.PathId = Paths.PathId
                           AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
                           AND (@UserName IS NULL OR Users.LoweredUserName = LOWER(@UserName))
                           AND (@Path IS NULL OR Paths.LoweredPath = LOWER(@Path)))

        SELECT @Count = @@ROWCOUNT
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_ResetSharedState]    Script Date: 03/27/2013 17:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_ResetSharedState] (
    @Count int OUT,
    @ApplicationName NVARCHAR(256),
    @Path NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationAllUsers
        WHERE PathId IN
            (SELECT AllUsers.PathId
             FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
             WHERE Paths.ApplicationId = @ApplicationId
                   AND AllUsers.PathId = Paths.PathId
                   AND Paths.LoweredPath = LOWER(@Path))

        SELECT @Count = @@ROWCOUNT
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_GetCountOfState]    Script Date: 03/27/2013 17:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_GetCountOfState] (
    @Count int OUT,
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @Path NVARCHAR(256) = NULL,
    @UserName NVARCHAR(256) = NULL,
    @InactiveSinceDate DATETIME = NULL)
AS
BEGIN

    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
        IF (@AllUsersScope = 1)
            SELECT @Count = COUNT(*)
            FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
            WHERE Paths.ApplicationId = @ApplicationId
                  AND AllUsers.PathId = Paths.PathId
                  AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
        ELSE
            SELECT @Count = COUNT(*)
            FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
            WHERE Paths.ApplicationId = @ApplicationId
                  AND PerUser.UserId = Users.UserId
                  AND PerUser.PathId = Paths.PathId
                  AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
                  AND (@UserName IS NULL OR Users.LoweredUserName LIKE LOWER(@UserName))
                  AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_FindState]    Script Date: 03/27/2013 17:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_FindState] (
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @PageIndex              INT,
    @PageSize               INT,
    @Path NVARCHAR(256) = NULL,
    @UserName NVARCHAR(256) = NULL,
    @InactiveSinceDate DATETIME = NULL)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        RETURN

    -- Set the page bounds
    DECLARE @PageLowerBound INT
    DECLARE @PageUpperBound INT
    DECLARE @TotalRecords   INT
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table to store the selected results
    CREATE TABLE #PageIndex (
        IndexId int IDENTITY (0, 1) NOT NULL,
        ItemId UNIQUEIDENTIFIER
    )

    IF (@AllUsersScope = 1)
    BEGIN
        -- Insert into our temp table
        INSERT INTO #PageIndex (ItemId)
        SELECT Paths.PathId
        FROM dbo.aspnet_Paths Paths,
             ((SELECT Paths.PathId
               FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
               WHERE Paths.ApplicationId = @ApplicationId
                      AND AllUsers.PathId = Paths.PathId
                      AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              ) AS SharedDataPerPath
              FULL OUTER JOIN
              (SELECT DISTINCT Paths.PathId
               FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Paths Paths
               WHERE Paths.ApplicationId = @ApplicationId
                      AND PerUser.PathId = Paths.PathId
                      AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              ) AS UserDataPerPath
              ON SharedDataPerPath.PathId = UserDataPerPath.PathId
             )
        WHERE Paths.PathId = SharedDataPerPath.PathId OR Paths.PathId = UserDataPerPath.PathId
        ORDER BY Paths.Path ASC

        SELECT @TotalRecords = @@ROWCOUNT

        SELECT Paths.Path,
               SharedDataPerPath.LastUpdatedDate,
               SharedDataPerPath.SharedDataLength,
               UserDataPerPath.UserDataLength,
               UserDataPerPath.UserCount
        FROM dbo.aspnet_Paths Paths,
             ((SELECT PageIndex.ItemId AS PathId,
                      AllUsers.LastUpdatedDate AS LastUpdatedDate,
                      DATALENGTH(AllUsers.PageSettings) AS SharedDataLength
               FROM dbo.aspnet_PersonalizationAllUsers AllUsers, #PageIndex PageIndex
               WHERE AllUsers.PathId = PageIndex.ItemId
                     AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
              ) AS SharedDataPerPath
              FULL OUTER JOIN
              (SELECT PageIndex.ItemId AS PathId,
                      SUM(DATALENGTH(PerUser.PageSettings)) AS UserDataLength,
                      COUNT(*) AS UserCount
               FROM aspnet_PersonalizationPerUser PerUser, #PageIndex PageIndex
               WHERE PerUser.PathId = PageIndex.ItemId
                     AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
               GROUP BY PageIndex.ItemId
              ) AS UserDataPerPath
              ON SharedDataPerPath.PathId = UserDataPerPath.PathId
             )
        WHERE Paths.PathId = SharedDataPerPath.PathId OR Paths.PathId = UserDataPerPath.PathId
        ORDER BY Paths.Path ASC
    END
    ELSE
    BEGIN
        -- Insert into our temp table
        INSERT INTO #PageIndex (ItemId)
        SELECT PerUser.Id
        FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
        WHERE Paths.ApplicationId = @ApplicationId
              AND PerUser.UserId = Users.UserId
              AND PerUser.PathId = Paths.PathId
              AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              AND (@UserName IS NULL OR Users.LoweredUserName LIKE LOWER(@UserName))
              AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
        ORDER BY Paths.Path ASC, Users.UserName ASC

        SELECT @TotalRecords = @@ROWCOUNT

        SELECT Paths.Path, PerUser.LastUpdatedDate, DATALENGTH(PerUser.PageSettings), Users.UserName, Users.LastActivityDate
        FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths, #PageIndex PageIndex
        WHERE PerUser.Id = PageIndex.ItemId
              AND PerUser.UserId = Users.UserId
              AND PerUser.PathId = Paths.PathId
              AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
        ORDER BY Paths.Path ASC, Users.UserName ASC
    END

    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_DeleteAllState]    Script Date: 03/27/2013 17:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_DeleteAllState] (
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @Count int OUT)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        IF (@AllUsersScope = 1)
            DELETE FROM aspnet_PersonalizationAllUsers
            WHERE PathId IN
               (SELECT Paths.PathId
                FROM dbo.aspnet_Paths Paths
                WHERE Paths.ApplicationId = @ApplicationId)
        ELSE
            DELETE FROM aspnet_PersonalizationPerUser
            WHERE PathId IN
               (SELECT Paths.PathId
                FROM dbo.aspnet_Paths Paths
                WHERE Paths.ApplicationId = @ApplicationId)

        SELECT @Count = @@ROWCOUNT
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_SetProperties]    Script Date: 03/27/2013 17:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_SetProperties]
    @ApplicationName        nvarchar(256),
    @PropertyNames          ntext,
    @PropertyValuesString   ntext,
    @PropertyValuesBinary   image,
    @UserName               nvarchar(256),
    @IsUserAnonymous        bit,
    @CurrentTimeUtc         datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
       BEGIN TRANSACTION
       SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    DECLARE @UserId uniqueidentifier
    DECLARE @LastActivityDate datetime
    SELECT  @UserId = NULL
    SELECT  @LastActivityDate = @CurrentTimeUtc

    SELECT @UserId = UserId
    FROM   dbo.aspnet_Users
    WHERE  ApplicationId = @ApplicationId AND LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
        EXEC dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, @IsUserAnonymous, @LastActivityDate, @UserId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    UPDATE dbo.aspnet_Users
    SET    LastActivityDate=@CurrentTimeUtc
    WHERE  UserId = @UserId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF (EXISTS( SELECT *
               FROM   dbo.aspnet_Profile
               WHERE  UserId = @UserId))
        UPDATE dbo.aspnet_Profile
        SET    PropertyNames=@PropertyNames, PropertyValuesString = @PropertyValuesString,
               PropertyValuesBinary = @PropertyValuesBinary, LastUpdatedDate=@CurrentTimeUtc
        WHERE  UserId = @UserId
    ELSE
        INSERT INTO dbo.aspnet_Profile(UserId, PropertyNames, PropertyValuesString, PropertyValuesBinary, LastUpdatedDate)
             VALUES (@UserId, @PropertyNames, @PropertyValuesString, @PropertyValuesBinary, @CurrentTimeUtc)

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
    	SET @TranStarted = 0
    	COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetProperties]    Script Date: 03/27/2013 17:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_GetProperties]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @CurrentTimeUtc       datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN

    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL

    SELECT @UserId = UserId
    FROM   dbo.aspnet_Users
    WHERE  ApplicationId = @ApplicationId AND LoweredUserName = LOWER(@UserName)

    IF (@UserId IS NULL)
        RETURN
    SELECT TOP 1 PropertyNames, PropertyValuesString, PropertyValuesBinary
    FROM         dbo.aspnet_Profile
    WHERE        UserId = @UserId

    IF (@@ROWCOUNT > 0)
    BEGIN
        UPDATE dbo.aspnet_Users
        SET    LastActivityDate=@CurrentTimeUtc
        WHERE  UserId = @UserId
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetProfiles]    Script Date: 03/27/2013 17:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_GetProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @PageIndex              int,
    @PageSize               int,
    @UserNameToMatch        nvarchar(256) = NULL,
    @InactiveSinceDate      datetime      = NULL
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
        SELECT  u.UserId
        FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p
        WHERE   ApplicationId = @ApplicationId
            AND u.UserId = p.UserId
            AND (@InactiveSinceDate IS NULL OR LastActivityDate <= @InactiveSinceDate)
            AND (     (@ProfileAuthOptions = 2)
                   OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                   OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
                 )
            AND (@UserNameToMatch IS NULL OR LoweredUserName LIKE LOWER(@UserNameToMatch))
        ORDER BY UserName

    SELECT  u.UserName, u.IsAnonymous, u.LastActivityDate, p.LastUpdatedDate,
            DATALENGTH(p.PropertyNames) + DATALENGTH(p.PropertyValuesString) + DATALENGTH(p.PropertyValuesBinary)
    FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p, #PageIndexForUsers i
    WHERE   u.UserId = p.UserId AND p.UserId = i.UserId AND i.IndexId >= @PageLowerBound AND i.IndexId <= @PageUpperBound

    SELECT COUNT(*)
    FROM   #PageIndexForUsers

    DROP TABLE #PageIndexForUsers
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetNumberOfInactiveProfiles]    Script Date: 03/27/2013 17:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_GetNumberOfInactiveProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @InactiveSinceDate      datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
    BEGIN
        SELECT 0
        RETURN
    END

    SELECT  COUNT(*)
    FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p
    WHERE   ApplicationId = @ApplicationId
        AND u.UserId = p.UserId
        AND (LastActivityDate <= @InactiveSinceDate)
        AND (
                (@ProfileAuthOptions = 2)
                OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
            )
END
GO
/****** Object:  Table [dbo].[ProductFacilities]    Script Date: 03/27/2013 17:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductFacilities](
	[ProductFacilityId] [bigint] IDENTITY(1,1) NOT NULL,
	[RRCID] [bigint] NOT NULL,
	[FID] [bigint] NULL,
 CONSTRAINT [PK_ProductFacilities] PRIMARY KEY CLUSTERED 
(
	[ProductFacilityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_DeleteInactiveProfiles]    Script Date: 03/27/2013 17:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_DeleteInactiveProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @InactiveSinceDate      datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
    BEGIN
        SELECT  0
        RETURN
    END

    DELETE
    FROM    dbo.aspnet_Profile
    WHERE   UserId IN
            (   SELECT  UserId
                FROM    dbo.aspnet_Users u
                WHERE   ApplicationId = @ApplicationId
                        AND (LastActivityDate <= @InactiveSinceDate)
                        AND (
                                (@ProfileAuthOptions = 2)
                             OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                             OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
                            )
            )

    SELECT  @@ROWCOUNT
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_IsUserInRole]    Script Date: 03/27/2013 17:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_IsUserInRole]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(2)
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    DECLARE @RoleId uniqueidentifier
    SELECT  @RoleId = NULL

    SELECT  @UserId = UserId
    FROM    dbo.aspnet_Users
    WHERE   LoweredUserName = LOWER(@UserName) AND ApplicationId = @ApplicationId

    IF (@UserId IS NULL)
        RETURN(2)

    SELECT  @RoleId = RoleId
    FROM    dbo.aspnet_Roles
    WHERE   LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId

    IF (@RoleId IS NULL)
        RETURN(3)

    IF (EXISTS( SELECT * FROM dbo.aspnet_UsersInRoles WHERE  UserId = @UserId AND RoleId = @RoleId))
        RETURN(1)
    ELSE
        RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_GetUsersInRoles]    Script Date: 03/27/2013 17:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_GetUsersInRoles]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
     DECLARE @RoleId uniqueidentifier
     SELECT  @RoleId = NULL

     SELECT  @RoleId = RoleId
     FROM    dbo.aspnet_Roles
     WHERE   LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId

     IF (@RoleId IS NULL)
         RETURN(1)

    SELECT u.UserName
    FROM   dbo.aspnet_Users u, dbo.aspnet_UsersInRoles ur
    WHERE  u.UserId = ur.UserId AND @RoleId = ur.RoleId AND u.ApplicationId = @ApplicationId
    ORDER BY u.UserName
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_GetRolesForUser]    Script Date: 03/27/2013 17:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_GetRolesForUser]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL

    SELECT  @UserId = UserId
    FROM    dbo.aspnet_Users
    WHERE   LoweredUserName = LOWER(@UserName) AND ApplicationId = @ApplicationId

    IF (@UserId IS NULL)
        RETURN(1)

    SELECT r.RoleName
    FROM   dbo.aspnet_Roles r, dbo.aspnet_UsersInRoles ur
    WHERE  r.RoleId = ur.RoleId AND r.ApplicationId = @ApplicationId AND ur.UserId = @UserId
    ORDER BY r.RoleName
    RETURN (0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_FindUsersInRole]    Script Date: 03/27/2013 17:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_FindUsersInRole]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256),
    @UserNameToMatch  nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
     DECLARE @RoleId uniqueidentifier
     SELECT  @RoleId = NULL

     SELECT  @RoleId = RoleId
     FROM    dbo.aspnet_Roles
     WHERE   LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId

     IF (@RoleId IS NULL)
         RETURN(1)

    SELECT u.UserName
    FROM   dbo.aspnet_Users u, dbo.aspnet_UsersInRoles ur
    WHERE  u.UserId = ur.UserId AND @RoleId = ur.RoleId AND u.ApplicationId = @ApplicationId AND LoweredUserName LIKE LOWER(@UserNameToMatch)
    ORDER BY u.UserName
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_AddUsersToRoles]    Script Date: 03/27/2013 17:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_AddUsersToRoles]
	@ApplicationName  nvarchar(256),
	@UserNames		  nvarchar(4000),
	@RoleNames		  nvarchar(4000),
	@CurrentTimeUtc   datetime
AS
BEGIN
	DECLARE @AppId uniqueidentifier
	SELECT  @AppId = NULL
	SELECT  @AppId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
	IF (@AppId IS NULL)
		RETURN(2)
	DECLARE @TranStarted   bit
	SET @TranStarted = 0

	IF( @@TRANCOUNT = 0 )
	BEGIN
		BEGIN TRANSACTION
		SET @TranStarted = 1
	END

	DECLARE @tbNames	table(Name nvarchar(256) NOT NULL PRIMARY KEY)
	DECLARE @tbRoles	table(RoleId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @tbUsers	table(UserId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @Num		int
	DECLARE @Pos		int
	DECLARE @NextPos	int
	DECLARE @Name		nvarchar(256)

	SET @Num = 0
	SET @Pos = 1
	WHILE(@Pos <= LEN(@RoleNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @RoleNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@RoleNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@RoleNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbRoles
	  SELECT RoleId
	  FROM   dbo.aspnet_Roles ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredRoleName AND ar.ApplicationId = @AppId

	IF (@@ROWCOUNT <> @Num)
	BEGIN
		SELECT TOP 1 Name
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT ar.LoweredRoleName FROM dbo.aspnet_Roles ar,  @tbRoles r WHERE r.RoleId = ar.RoleId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(2)
	END

	DELETE FROM @tbNames WHERE 1=1
	SET @Num = 0
	SET @Pos = 1

	WHILE(@Pos <= LEN(@UserNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @UserNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@UserNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@UserNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbUsers
	  SELECT UserId
	  FROM   dbo.aspnet_Users ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredUserName AND ar.ApplicationId = @AppId

	IF (@@ROWCOUNT <> @Num)
	BEGIN
		DELETE FROM @tbNames
		WHERE LOWER(Name) IN (SELECT LoweredUserName FROM dbo.aspnet_Users au,  @tbUsers u WHERE au.UserId = u.UserId)

		INSERT dbo.aspnet_Users (ApplicationId, UserId, UserName, LoweredUserName, IsAnonymous, LastActivityDate)
		  SELECT @AppId, NEWID(), Name, LOWER(Name), 0, @CurrentTimeUtc
		  FROM   @tbNames

		INSERT INTO @tbUsers
		  SELECT  UserId
		  FROM	dbo.aspnet_Users au, @tbNames t
		  WHERE   LOWER(t.Name) = au.LoweredUserName AND au.ApplicationId = @AppId
	END

	IF (EXISTS (SELECT * FROM dbo.aspnet_UsersInRoles ur, @tbUsers tu, @tbRoles tr WHERE tu.UserId = ur.UserId AND tr.RoleId = ur.RoleId))
	BEGIN
		SELECT TOP 1 UserName, RoleName
		FROM		 dbo.aspnet_UsersInRoles ur, @tbUsers tu, @tbRoles tr, aspnet_Users u, aspnet_Roles r
		WHERE		u.UserId = tu.UserId AND r.RoleId = tr.RoleId AND tu.UserId = ur.UserId AND tr.RoleId = ur.RoleId

		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(3)
	END

	INSERT INTO dbo.aspnet_UsersInRoles (UserId, RoleId)
	SELECT UserId, RoleId
	FROM @tbUsers, @tbRoles

	IF( @TranStarted = 1 )
		COMMIT TRANSACTION
	RETURN(0)
END
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_User]    Script Date: 03/27/2013 17:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_WebPartState_User]
  AS SELECT [dbo].[aspnet_PersonalizationPerUser].[PathId], [dbo].[aspnet_PersonalizationPerUser].[UserId], [DataSize]=DATALENGTH([dbo].[aspnet_PersonalizationPerUser].[PageSettings]), [dbo].[aspnet_PersonalizationPerUser].[LastUpdatedDate]
  FROM [dbo].[aspnet_PersonalizationPerUser]
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_Shared]    Script Date: 03/27/2013 17:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_WebPartState_Shared]
  AS SELECT [dbo].[aspnet_PersonalizationAllUsers].[PathId], [DataSize]=DATALENGTH([dbo].[aspnet_PersonalizationAllUsers].[PageSettings]), [dbo].[aspnet_PersonalizationAllUsers].[LastUpdatedDate]
  FROM [dbo].[aspnet_PersonalizationAllUsers]
GO
/****** Object:  View [dbo].[vw_aspnet_UsersInRoles]    Script Date: 03/27/2013 17:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_UsersInRoles]
  AS SELECT [dbo].[aspnet_UsersInRoles].[UserId], [dbo].[aspnet_UsersInRoles].[RoleId]
  FROM [dbo].[aspnet_UsersInRoles]
GO
/****** Object:  View [dbo].[vw_aspnet_Profiles]    Script Date: 03/27/2013 17:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_Profiles]
  AS SELECT [dbo].[aspnet_Profile].[UserId], [dbo].[aspnet_Profile].[LastUpdatedDate],
      [DataSize]=  DATALENGTH([dbo].[aspnet_Profile].[PropertyNames])
                 + DATALENGTH([dbo].[aspnet_Profile].[PropertyValuesString])
                 + DATALENGTH([dbo].[aspnet_Profile].[PropertyValuesBinary])
  FROM [dbo].[aspnet_Profile]
GO
/****** Object:  View [dbo].[vw_aspnet_MembershipUsers]    Script Date: 03/27/2013 17:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_MembershipUsers]
  AS SELECT [dbo].[aspnet_Membership].[UserId],
            [dbo].[aspnet_Membership].[PasswordFormat],
            [dbo].[aspnet_Membership].[MobilePIN],
            [dbo].[aspnet_Membership].[Email],
            [dbo].[aspnet_Membership].[LoweredEmail],
            [dbo].[aspnet_Membership].[PasswordQuestion],
            [dbo].[aspnet_Membership].[PasswordAnswer],
            [dbo].[aspnet_Membership].[IsApproved],
            [dbo].[aspnet_Membership].[IsLockedOut],
            [dbo].[aspnet_Membership].[CreateDate],
            [dbo].[aspnet_Membership].[LastLoginDate],
            [dbo].[aspnet_Membership].[LastPasswordChangedDate],
            [dbo].[aspnet_Membership].[LastLockoutDate],
            [dbo].[aspnet_Membership].[FailedPasswordAttemptCount],
            [dbo].[aspnet_Membership].[FailedPasswordAttemptWindowStart],
            [dbo].[aspnet_Membership].[FailedPasswordAnswerAttemptCount],
            [dbo].[aspnet_Membership].[FailedPasswordAnswerAttemptWindowStart],
            [dbo].[aspnet_Membership].[Comment],
            [dbo].[aspnet_Users].[ApplicationId],
            [dbo].[aspnet_Users].[UserName],
            [dbo].[aspnet_Users].[MobileAlias],
            [dbo].[aspnet_Users].[IsAnonymous],
            [dbo].[aspnet_Users].[LastActivityDate]
  FROM [dbo].[aspnet_Membership] INNER JOIN [dbo].[aspnet_Users]
      ON [dbo].[aspnet_Membership].[UserId] = [dbo].[aspnet_Users].[UserId]
GO
/****** Object:  StoredProcedure [dbo].[spProductRRC]    Script Date: 03/27/2013 17:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spProductRRC]
(
@flg int = 0,
@Trans varchar(1),@RRCID bigint = null,
@ProductID bigint =NULL,@RCID INT=null,@RoomTHID Bigint=null,@RoomTDID Bigint=Null
)AS
begin
if @Trans = 'v'
		IF @flg= 1 
			select rrcid,productID,RC.RCName,RTH.RoomTHName,RTD.RoomTDName   from RoomTypeHeader RTH , RoomTypeDetail RTD,RateCategory RC,ProductRRC RRC where RRC.RCID = RC.RCID and RRC.RoomTHID = RTH.RoomTHID and RRC.RoomTDID = RTD.RoomTDID and RRC.productID = @ProductID 
		if @flg=1 and @RRCID is not null 
			select * from ProductRRC	where RRCID = @RRCID
if @Trans = 'a'
begin 
	Insert into ProductRRC(	ProductID,RCID,RoomTHID,RoomTDID)
	values 
	(@ProductID,@RCID,@RoomTHID,@RoomTDID)
	If @@RowCount > 0 
		return '1'
	else
		return '0'
end 
if @Trans = 'd'
begin
	delete from ProductRRC where RRCID = @RRCID
	if @@ROWCOUNT > 0
		return '1'
	else
		return '0'
end 
 end
GO
/****** Object:  StoredProcedure [dbo].[spProductFacilities]    Script Date: 03/27/2013 17:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spProductFacilities]
(
@flg int = 0,
@Trans varchar(1),
@RRCID bigint =NULL,@FID int=null
)AS
begin
if @Trans = 'v'
		select * from ProductFacilities	where RRCID = @RRCID
if @Trans = 'a'
begin 
	Insert into ProductFacilities(	RRCID,FID)
	values 
	(@RRCID,@FID)
	If @@RowCount > 0 
		return '1'
	else
		return '0'
end 
if @Trans = 'd'
begin
	delete from ProductFacilities where RRCID = @RRCID
	if @@ROWCOUNT > 0
		return '1'
	else
		return '0'
end 
 end
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_DeleteProfiles]    Script Date: 03/27/2013 17:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_DeleteProfiles]
    @ApplicationName        nvarchar(256),
    @UserNames              nvarchar(4000)
AS
BEGIN
    DECLARE @UserName     nvarchar(256)
    DECLARE @CurrentPos   int
    DECLARE @NextPos      int
    DECLARE @NumDeleted   int
    DECLARE @DeletedUser  int
    DECLARE @TranStarted  bit
    DECLARE @ErrorCode    int

    SET @ErrorCode = 0
    SET @CurrentPos = 1
    SET @NumDeleted = 0
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    WHILE (@CurrentPos <= LEN(@UserNames))
    BEGIN
        SELECT @NextPos = CHARINDEX(N',', @UserNames,  @CurrentPos)
        IF (@NextPos = 0 OR @NextPos IS NULL)
            SELECT @NextPos = LEN(@UserNames) + 1

        SELECT @UserName = SUBSTRING(@UserNames, @CurrentPos, @NextPos - @CurrentPos)
        SELECT @CurrentPos = @NextPos+1

        IF (LEN(@UserName) > 0)
        BEGIN
            SELECT @DeletedUser = 0
            EXEC dbo.aspnet_Users_DeleteUser @ApplicationName, @UserName, 4, @DeletedUser OUTPUT
            IF( @@ERROR <> 0 )
            BEGIN
                SET @ErrorCode = -1
                GOTO Cleanup
            END
            IF (@DeletedUser <> 0)
                SELECT @NumDeleted = @NumDeleted + 1
        END
    END
    SELECT @NumDeleted
    IF (@TranStarted = 1)
    BEGIN
    	SET @TranStarted = 0
    	COMMIT TRANSACTION
    END
    SET @TranStarted = 0

    RETURN 0

Cleanup:
    IF (@TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END
    RETURN @ErrorCode
END
GO
/****** Object:  Default [DF_B2CCustomerinfo_InService]    Script Date: 03/27/2013 17:01:40 ******/
ALTER TABLE [dbo].[B2CCustomerinfo] ADD  CONSTRAINT [DF_B2CCustomerinfo_InService]  DEFAULT ((0)) FOR [InService]
GO
/****** Object:  Default [DF__aspnet_Ap__Appli__04AFB25B]    Script Date: 03/27/2013 17:01:40 ******/
ALTER TABLE [dbo].[aspnet_Applications] ADD  DEFAULT (newid()) FOR [ApplicationId]
GO
/****** Object:  Default [DF__aspnet_Us__UserI__0697FACD]    Script Date: 03/27/2013 17:01:44 ******/
ALTER TABLE [dbo].[aspnet_Users] ADD  DEFAULT (newid()) FOR [UserId]
GO
/****** Object:  Default [DF__aspnet_Us__Mobil__078C1F06]    Script Date: 03/27/2013 17:01:44 ******/
ALTER TABLE [dbo].[aspnet_Users] ADD  DEFAULT (NULL) FOR [MobileAlias]
GO
/****** Object:  Default [DF__aspnet_Us__IsAno__0880433F]    Script Date: 03/27/2013 17:01:44 ******/
ALTER TABLE [dbo].[aspnet_Users] ADD  DEFAULT ((0)) FOR [IsAnonymous]
GO
/****** Object:  Default [DF__aspnet_Pa__PathI__09746778]    Script Date: 03/27/2013 17:01:44 ******/
ALTER TABLE [dbo].[aspnet_Paths] ADD  DEFAULT (newid()) FOR [PathId]
GO
/****** Object:  Default [DF__aspnet_Ro__RoleI__0A688BB1]    Script Date: 03/27/2013 17:01:44 ******/
ALTER TABLE [dbo].[aspnet_Roles] ADD  DEFAULT (newid()) FOR [RoleId]
GO
/****** Object:  Default [DF__aspnet_Me__Passw__0B5CAFEA]    Script Date: 03/27/2013 17:01:48 ******/
ALTER TABLE [dbo].[aspnet_Membership] ADD  DEFAULT ((0)) FOR [PasswordFormat]
GO
/****** Object:  Default [DF__aspnet_Perso__Id__0C50D423]    Script Date: 03/27/2013 17:01:48 ******/
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] ADD  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  ForeignKey [FK__aspnet_Us__Appli__0D44F85C]    Script Date: 03/27/2013 17:01:44 ******/
ALTER TABLE [dbo].[aspnet_Users]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
/****** Object:  ForeignKey [FK__aspnet_Pa__Appli__0E391C95]    Script Date: 03/27/2013 17:01:44 ******/
ALTER TABLE [dbo].[aspnet_Paths]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
/****** Object:  ForeignKey [FK__aspnet_Ro__Appli__0F2D40CE]    Script Date: 03/27/2013 17:01:44 ******/
ALTER TABLE [dbo].[aspnet_Roles]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
/****** Object:  ForeignKey [FK_RoomTypeDetail_RoomTypeHeader]    Script Date: 03/27/2013 17:01:44 ******/
ALTER TABLE [dbo].[RoomTypeDetail]  WITH CHECK ADD  CONSTRAINT [FK_RoomTypeDetail_RoomTypeHeader] FOREIGN KEY([RoomTHID])
REFERENCES [dbo].[RoomTypeHeader] ([RoomTHID])
GO
ALTER TABLE [dbo].[RoomTypeDetail] CHECK CONSTRAINT [FK_RoomTypeDetail_RoomTypeHeader]
GO
/****** Object:  ForeignKey [FK_ProductImages_ProductMaster]    Script Date: 03/27/2013 17:01:44 ******/
ALTER TABLE [dbo].[ProductImages]  WITH CHECK ADD  CONSTRAINT [FK_ProductImages_ProductMaster] FOREIGN KEY([ProductID])
REFERENCES [dbo].[ProductMaster] ([ProductID])
GO
ALTER TABLE [dbo].[ProductImages] CHECK CONSTRAINT [FK_ProductImages_ProductMaster]
GO
/****** Object:  ForeignKey [FK_ProductAmenities_Amenities]    Script Date: 03/27/2013 17:01:44 ******/
ALTER TABLE [dbo].[ProductAmenities]  WITH CHECK ADD  CONSTRAINT [FK_ProductAmenities_Amenities] FOREIGN KEY([AmenitiesId])
REFERENCES [dbo].[Amenities] ([AmenitiesID])
GO
ALTER TABLE [dbo].[ProductAmenities] CHECK CONSTRAINT [FK_ProductAmenities_Amenities]
GO
/****** Object:  ForeignKey [FK_ProductAmenities_ProductMaster]    Script Date: 03/27/2013 17:01:44 ******/
ALTER TABLE [dbo].[ProductAmenities]  WITH CHECK ADD  CONSTRAINT [FK_ProductAmenities_ProductMaster] FOREIGN KEY([productID])
REFERENCES [dbo].[ProductMaster] ([ProductID])
GO
ALTER TABLE [dbo].[ProductAmenities] CHECK CONSTRAINT [FK_ProductAmenities_ProductMaster]
GO
/****** Object:  ForeignKey [FK_B2CPaxinfo_B2CCustomerinfo1]    Script Date: 03/27/2013 17:01:44 ******/
ALTER TABLE [dbo].[B2CPaxinfo]  WITH CHECK ADD  CONSTRAINT [FK_B2CPaxinfo_B2CCustomerinfo1] FOREIGN KEY([ForeignCustomerSNo])
REFERENCES [dbo].[B2CCustomerinfo] ([CustomerSNo])
GO
ALTER TABLE [dbo].[B2CPaxinfo] CHECK CONSTRAINT [FK_B2CPaxinfo_B2CCustomerinfo1]
GO
/****** Object:  ForeignKey [FK_ProductRRC_ProductMaster]    Script Date: 03/27/2013 17:01:48 ******/
ALTER TABLE [dbo].[ProductRRC]  WITH CHECK ADD  CONSTRAINT [FK_ProductRRC_ProductMaster] FOREIGN KEY([productID])
REFERENCES [dbo].[ProductMaster] ([ProductID])
GO
ALTER TABLE [dbo].[ProductRRC] CHECK CONSTRAINT [FK_ProductRRC_ProductMaster]
GO
/****** Object:  ForeignKey [FK_ProductRRC_RoomTypeDetail]    Script Date: 03/27/2013 17:01:48 ******/
ALTER TABLE [dbo].[ProductRRC]  WITH CHECK ADD  CONSTRAINT [FK_ProductRRC_RoomTypeDetail] FOREIGN KEY([RoomTDID])
REFERENCES [dbo].[RoomTypeDetail] ([RoomTDID])
GO
ALTER TABLE [dbo].[ProductRRC] CHECK CONSTRAINT [FK_ProductRRC_RoomTypeDetail]
GO
/****** Object:  ForeignKey [FK_ProductRRC_RoomTypeHeader]    Script Date: 03/27/2013 17:01:48 ******/
ALTER TABLE [dbo].[ProductRRC]  WITH CHECK ADD  CONSTRAINT [FK_ProductRRC_RoomTypeHeader] FOREIGN KEY([RoomTHID])
REFERENCES [dbo].[RoomTypeHeader] ([RoomTHID])
GO
ALTER TABLE [dbo].[ProductRRC] CHECK CONSTRAINT [FK_ProductRRC_RoomTypeHeader]
GO
/****** Object:  ForeignKey [FK__aspnet_Me__Appli__10216507]    Script Date: 03/27/2013 17:01:48 ******/
ALTER TABLE [dbo].[aspnet_Membership]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
/****** Object:  ForeignKey [FK__aspnet_Me__UserI__11158940]    Script Date: 03/27/2013 17:01:48 ******/
ALTER TABLE [dbo].[aspnet_Membership]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
/****** Object:  ForeignKey [FK__aspnet_Pe__PathI__1209AD79]    Script Date: 03/27/2013 17:01:48 ******/
ALTER TABLE [dbo].[aspnet_PersonalizationAllUsers]  WITH CHECK ADD FOREIGN KEY([PathId])
REFERENCES [dbo].[aspnet_Paths] ([PathId])
GO
/****** Object:  ForeignKey [FK__aspnet_Pe__PathI__12FDD1B2]    Script Date: 03/27/2013 17:01:48 ******/
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]  WITH CHECK ADD FOREIGN KEY([PathId])
REFERENCES [dbo].[aspnet_Paths] ([PathId])
GO
/****** Object:  ForeignKey [FK__aspnet_Pe__UserI__13F1F5EB]    Script Date: 03/27/2013 17:01:48 ******/
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
/****** Object:  ForeignKey [FK__aspnet_Pr__UserI__14E61A24]    Script Date: 03/27/2013 17:01:48 ******/
ALTER TABLE [dbo].[aspnet_Profile]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
/****** Object:  ForeignKey [FK__aspnet_Us__RoleI__15DA3E5D]    Script Date: 03/27/2013 17:01:48 ******/
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[aspnet_Roles] ([RoleId])
GO
/****** Object:  ForeignKey [FK__aspnet_Us__UserI__16CE6296]    Script Date: 03/27/2013 17:01:48 ******/
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
/****** Object:  ForeignKey [FK_ProductFacilities_Facilities]    Script Date: 03/27/2013 17:01:49 ******/
ALTER TABLE [dbo].[ProductFacilities]  WITH CHECK ADD  CONSTRAINT [FK_ProductFacilities_Facilities] FOREIGN KEY([FID])
REFERENCES [dbo].[Facilities] ([FID])
GO
ALTER TABLE [dbo].[ProductFacilities] CHECK CONSTRAINT [FK_ProductFacilities_Facilities]
GO
/****** Object:  ForeignKey [FK_ProductFacilities_ProductRRC]    Script Date: 03/27/2013 17:01:49 ******/
ALTER TABLE [dbo].[ProductFacilities]  WITH CHECK ADD  CONSTRAINT [FK_ProductFacilities_ProductRRC] FOREIGN KEY([RRCID])
REFERENCES [dbo].[ProductRRC] ([RRCID])
GO
ALTER TABLE [dbo].[ProductFacilities] CHECK CONSTRAINT [FK_ProductFacilities_ProductRRC]
GO
