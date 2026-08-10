IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name = 'SynapseParquetFormat') 
	CREATE EXTERNAL FILE FORMAT [SynapseParquetFormat] 
	WITH ( FORMAT_TYPE = PARQUET)
GO

IF NOT EXISTS (SELECT * FROM sys.external_data_sources WHERE name = 'omdshomeworkfinal_studentdatastoragejp_dfs_core_windows_net') 
	CREATE EXTERNAL DATA SOURCE [omdshomeworkfinal_studentdatastoragejp_dfs_core_windows_net] 
	WITH (
		LOCATION = 'abfss://omdshomeworkfinal@studentdatastoragejp.dfs.core.windows.net' 
	)
GO

CREATE EXTERNAL TABLE [dbo].[FordExternalTable] (
	[CMPLID] nvarchar(4000),
	[ODINO] nvarchar(4000),
	[MFR_NAME] nvarchar(4000),
	[MAKETXT] nvarchar(4000),
	[MODELTXT] nvarchar(4000),
	[YEARTXT] nvarchar(4000),
	[CRASH] nvarchar(4000),
	[FAILDATE] nvarchar(4000),
	[FIRE] nvarchar(4000),
	[INJURED] nvarchar(4000),
	[DEATHS] nvarchar(4000),
	[COMPDESC] nvarchar(4000),
	[CITY] nvarchar(4000),
	[STATE] nvarchar(4000),
	[VIN] nvarchar(4000),
	[DATEA] nvarchar(4000),
	[LDATE] nvarchar(4000),
	[MILES] nvarchar(4000),
	[OCCURENCES] nvarchar(4000),
	[CDESCR] nvarchar(4000),
	[CMPL_TYPE] nvarchar(4000),
	[POLICE_RPT_YN] nvarchar(4000),
	[PURCH_DT] nvarchar(4000),
	[ORIG_OWNER_YN] nvarchar(4000),
	[ANTI_BRAKES_YN] nvarchar(4000),
	[CRUISE_CONT_YN] nvarchar(4000),
	[NUM_CYLS] nvarchar(4000),
	[DRIVE_TRAIN] nvarchar(4000),
	[FUEL_SYS] nvarchar(4000),
	[FUEL_TYPE] nvarchar(4000),
	[TRANS_TYPE] nvarchar(4000),
	[VEH_SPEED] nvarchar(4000),
	[DOT] nvarchar(4000),
	[TIRE_SIZE] nvarchar(4000),
	[LOC_OF_TIRE] nvarchar(4000),
	[TIRE_FAIL_TYPE] nvarchar(4000),
	[ORIG_EQUIP_YN] nvarchar(4000),
	[MANUF_DT] nvarchar(4000),
	[SEAT_TYPE] nvarchar(4000),
	[RESTRAINT_TYPE] nvarchar(4000),
	[DEALER_NAME] nvarchar(4000),
	[DEALER_TEL] nvarchar(4000),
	[DEALER_CITY] nvarchar(4000),
	[DEALER_STATE] nvarchar(4000),
	[DEALER_ZIP] nvarchar(4000),
	[PROD_TYPE] nvarchar(4000),
	[REPAIRED_YN] nvarchar(4000),
	[MEDICAL_ATTN] nvarchar(4000),
	[VEHICLES_TOWED_YN] nvarchar(4000)
	)
	WITH (
	LOCATION = 'homework3a/parquet/Ford Motor Company.parquet',
	DATA_SOURCE = [omdshomeworkfinal_studentdatastoragejp_dfs_core_windows_net],
	FILE_FORMAT = [SynapseParquetFormat]
	)
GO


SELECT TOP 100 * FROM [dbo].[FordExternalTable]
GO