#
#  Copyright (c) 2021, Junyu Long <ljy122@qq.com>. All rights reserved.
#  Copyright (c) 2018, Linaro Limited. All rights reserved.
#
#  This program and the accompanying materials
#  are licensed and made available under the terms and conditions of the BSD License
#  which accompanies this distribution.  The full text of the license may be found at
#  http://opensource.org/licenses/bsd-license.php
#
#  THE PROGRAM IS DISTRIBUTED UNDER THE BSD LICENSE ON AN "AS IS" BASIS,
#  WITHOUT WARRANTIES OR REPRESENTATIONS OF ANY KIND, EITHER EXPRESS OR IMPLIED.
#

!include OnePlus6TPkg/CommonDsc.dsc.inc

################################################################################
#
# Defines Section - statements that will be processed to create a Makefile.
#
################################################################################
[Defines]
  PLATFORM_NAME                  = OnePlus6TPkg
  PLATFORM_GUID                  = 28f1a3bf-193a-47e3-a7b9-5a435eaab2ee
  PLATFORM_VERSION               = 0.1
  DSC_SPECIFICATION              = 0x00010019
  OUTPUT_DIRECTORY               = Build/$(PLATFORM_NAME)
  SUPPORTED_ARCHITECTURES        = AARCH64
  BUILD_TARGETS                  = DEBUG|RELEASE
  SKUID_IDENTIFIER               = DEFAULT
  FLASH_DEFINITION               = OnePlus6TPkg/OnePlus6TPkg.fdf

################################################################################
#
# Library Class section - list of all Library Classes needed by this Platform.
#
################################################################################
[LibraryClasses.common]

  ArmLib                       |ArmPkg/Library/ArmLib/ArmBaseLib.inf
  ArmPlatformLib               |OnePlus6TPkg/Library/sdm845Lib/sdm845Lib.inf
  CompilerIntrinsicsLib        |ArmPkg/Library/CompilerIntrinsicsLib/CompilerIntrinsicsLib.inf
  CapsuleLib                   |MdeModulePkg/Library/DxeCapsuleLibNull/DxeCapsuleLibNull.inf
  UefiBootManagerLib           |MdeModulePkg/Library/UefiBootManagerLib/UefiBootManagerLib.inf
  PlatformBootManagerLib       |ArmPkg/Library/PlatformBootManagerLib/PlatformBootManagerLib.inf
  CustomizedDisplayLib         |MdeModulePkg/Library/CustomizedDisplayLib/CustomizedDisplayLib.inf

  # UiApp dependencies
  ReportStatusCodeLib          |MdeModulePkg/Library/DxeReportStatusCodeLib/DxeReportStatusCodeLib.inf
  FileExplorerLib              |MdeModulePkg/Library/FileExplorerLib/FileExplorerLib.inf
  DxeServicesLib               |MdePkg/Library/DxeServicesLib/DxeServicesLib.inf
  BootLogoLib                  |MdeModulePkg/Library/BootLogoLib/BootLogoLib.inf

!if $(TARGET) != RELEASE
  SerialPortLib                |OnePlus6TPkg/Library/InMemorySerialPortLib/InMemorySerialPortLib.inf
!else
  SerialPortLib                |MdePkg/Library/BaseSerialPortLibNull/BaseSerialPortLibNull.inf
!endif

  RealTimeClockLib             |EmbeddedPkg/Library/VirtualRealTimeClockLib/VirtualRealTimeClockLib.inf
  TimeBaseLib                  |EmbeddedPkg/Library/TimeBaseLib/TimeBaseLib.inf

  # USB Requirements
  UefiUsbLib                   |MdePkg/Library/UefiUsbLib/UefiUsbLib.inf

  # Network Libraries
  UefiScsiLib                  |MdePkg/Library/UefiScsiLib/UefiScsiLib.inf
  NetLib                       |NetworkPkg/Library/DxeNetLib/DxeNetLib.inf
  DpcLib                       |NetworkPkg/Library/DxeDpcLib/DxeDpcLib.inf
  IpIoLib                      |NetworkPkg/Library/DxeIpIoLib/DxeIpIoLib.inf
  UdpIoLib                     |NetworkPkg/Library/DxeUdpIoLib/DxeUdpIoLib.inf

  # VariableRuntimeDxe Requirements
  SynchronizationLib           |MdePkg/Library/BaseSynchronizationLib/BaseSynchronizationLib.inf
  AuthVariableLib              |SecurityPkg/Library/AuthVariableLib/AuthVariableLib.inf
  TpmMeasurementLib            |MdeModulePkg/Library/TpmMeasurementLibNull/TpmMeasurementLibNull.inf
  VarCheckLib                  |MdeModulePkg/Library/VarCheckLib/VarCheckLib.inf

  # SimpleFbDxe
  FrameBufferBltLib            |MdeModulePkg/Library/FrameBufferBltLib/FrameBufferBltLib.inf

!if $(TARGET) != RELEASE
  SerialPortLib                |OnePlus6TPkg/Library/FrameBufferSerialPortLib/FrameBufferSerialPortLib.inf
!endif

  PlatformBootManagerLib       |OnePlus6TPkg/Library/PlatformBootManagerLib/PlatformBootManagerLib.inf
  MemoryInitPeiLib             |OnePlus6TPkg/Library/MemoryInitPeiLib/PeiMemoryAllocationLib.inf
  PlatformPeiLib               |OnePlus6TPkg/Library/PlatformPeiLib/PlatformPeiLib.inf
  
  #########################
  # Microsoft Project Mu 
  #########################
  
  # Math Libraries
  FltUsedLib                   |MdePkg/Library/FltUsedLib/FltUsedLib.inf
  MathLib                      |MsCorePkg/Library/MathLib/MathLib.inf
  SafeIntLib                   |MdePkg/Library/BaseSafeIntLib/BaseSafeIntLib.inf
  
  # Whea Libraries
  MsWheaEarlyStorageLib        |MsWheaPkg/Library/MsWheaEarlyStorageLibNull/MsWheaEarlyStorageLibNull.inf
  MuTelemetryHelperLib         |MsWheaPkg/Library/MuTelemetryHelperLib/MuTelemetryHelperLib.inf
  
  # Boot and Boot Policy
  MsBootPolicyLib              |OemPkg/Library/MsBootPolicyLib/MsBootPolicyLib.inf
  DeviceBootManagerLib         |PcBdsPkg/Library/DeviceBootManagerLib/DeviceBootManagerLib.inf
  MsAltBootLib                 |OemPkg/Library/MsAltBootLib/MsAltBootLib.inf # interfaces with alternate boot variable
  MsBootOptionsLib             |PcBdsPkg/Library/MsBootOptionsLib/MsBootOptionsLib.inf # attached to BdsDxe to implement Microsoft extensions to UefiBootManagerLib.
  MsBootManagerSettingsLib     |PcBdsPkg/Library/MsBootManagerSettingsDxeLib/MsBootManagerSettingsDxeLib.inf
  
  # UI and graphics
  BootGraphicsProviderLib      |OemPkg/Library/BootGraphicsProviderLib/BootGraphicsProviderLib.inf #  uses PCDs and raw files in the firmware volumes to get Pcd
  BootGraphicsLib              |MsGraphicsPkg/Library/BootGraphicsLib/BootGraphicsLib.inf
  GraphicsConsoleHelperLib     |PcBdsPkg/Library/GraphicsConsoleHelperLib/GraphicsConsoleHelper.inf
  DisplayDeviceStateLib        |MsGraphicsPkg/Library/ColorBarDisplayDeviceStateLib/ColorBarDisplayDeviceStateLib.inf # Display the On screen notifications for the platform using color bars
  UIToolKitLib                 |MsGraphicsPkg/Library/SimpleUIToolKit/SimpleUIToolKit.inf
  MsColorTableLib              |MsGraphicsPkg/Library/MsColorTableLib/MsColorTableLib.inf
  SwmDialogsLib                |MsGraphicsPkg/Library/SwmDialogsLib/SwmDialogs.inf #  Dialog Boxes in a Simple Window Manager environment.
  DeviceStateLib               |MdeModulePkg/Library/DeviceStateLib/DeviceStateLib.inf
  UiRectangleLib               |MsGraphicsPkg/Library/BaseUiRectangleLib/BaseUiRectangleLib.inf
  MsUiThemeCopyLib             |MsGraphicsPkg/Library/MsUiThemeCopyLib/MsUiThemeCopyLib.inf # handles copying the theme
  # PlatformThemeLib           |QemuQ35Pkg/Library/PlatformThemeLib/PlatformThemeLib.inf # Q35 theme
  
  # Capsule/Versioning Libraries
  MuUefiVersionLib             |OemPkg/Library/MuUefiVersionLib/MuUefiVersionLib.inf
  
  # Security Libraries
  SecurityManagementLib        |MdeModulePkg/Library/DxeSecurityManagementLib/DxeSecurityManagementLib.inf
  BaseBinSecurityLib           |MdePkg/Library/BaseBinSecurityLibNull/BaseBinSecurityLibNull.inf
  SecurityLockAuditLib         |MdeModulePkg/Library/SecurityLockAuditDebugMessageLib/SecurityLockAuditDebugMessageLib.inf ##MU_CHANGE
  LockBoxLib                   |OvmfPkg/Library/LockBoxLib/LockBoxBaseLib.inf
  PlatformSecureLib            |OvmfPkg/Library/PlatformSecureLib/PlatformSecureLib.inf
  PasswordStoreLib             |MsCorePkg/Library/PasswordStoreLibNull/PasswordStoreLibNull.inf
  PasswordPolicyLib            |OemPkg/Library/PasswordPolicyLib/PasswordPolicyLib.inf
  MsSecureBootLib              |OemPkg/Library/MsSecureBootLib/MsSecureBootLib.inf
  PlatformKeyLib               |OemPkg/Library/PlatformKeyLibNull/PlatformKeyLibNull.inf
  
  # Memory Libraries
  MemoryTypeInfoSecVarCheckLib   |MdeModulePkg/Library/MemoryTypeInfoSecVarCheckLib/MemoryTypeInfoSecVarCheckLib.inf # MU_CHANGE TCBZ1086
  MemoryTypeInformationChangeLib |MdeModulePkg/Library/MemoryTypeInformationChangeLibNull/MemoryTypeInformationChangeLibNull.inf
  MtrrLib                        |UefiCpuPkg/Library/MtrrLib/MtrrLib.inf # Memory Type Range Register (https://en.wikipedia.org/wiki/Memory_type_range_register)
  MmUnblockMemoryLib             |MdePkg/Library/MmUnblockMemoryLib/MmUnblockMemoryLibNull.inf
  MemoryProtectionLib            |MdeModulePkg/Library/BaseMemoryProtectionLibNull/BaseMemoryProtectionLibNull.inf
  
  # Variable Libraries
  VariablePolicyLib            |MdeModulePkg/Library/VariablePolicyLib/VariablePolicyLib.inf
  VariablePolicyHelperLib      |MdeModulePkg/Library/VariablePolicyHelperLib/VariablePolicyHelperLib.inf
  AuthVariableLib              |SecurityPkg/Library/AuthVariableLib/AuthVariableLib.inf
  VarCheckLib                  |MdeModulePkg/Library/VarCheckLib/VarCheckLib.inf
  
  # Crypto Libraries
  TlsLib                       |CryptoPkg/Library/TlsLib/TlsLib.inf
  RngLib                       |MdePkg/Library/BaseRngLibNull/BaseRngLibNull.inf
  
  # Power/Thermal/Power State Libraries
  MsNVBootReasonLib            |OemPkg/Library/MsNVBootReasonLib/MsNVBootReasonLib.inf # interface on Reboot Reason non volatile variables
  ResetUtilityLib              |MdeModulePkg/Library/ResetUtilityLib/ResetUtilityLib.inf
  S3BootScriptLib              |MdeModulePkg/Library/PiDxeS3BootScriptLib/DxeS3BootScriptLib.inf
  PowerServicesLib             |PcBdsPkg/Library/PowerServicesLibNull/PowerServicesLibNull.inf
  ThermalServicesLib           |PcBdsPkg/Library/ThermalServicesLibNull/ThermalServicesLibNull.inf
  MsPlatformPowerCheckLib      |PcBdsPkg/Library/MsPlatformPowerCheckLibNull/MsPlatformPowerCheckLibNull.inf
  
  # TPM Libraries
  OemTpm2InitLib               |SecurityPkg/Library/OemTpm2InitLibNull/OemTpm2InitLib.inf
  Tpm2DebugLib                 |SecurityPkg/Library/Tpm2DebugLib/Tpm2DebugLibNull.inf
  Tpm12CommandLib              |SecurityPkg/Library/Tpm12CommandLib/Tpm12CommandLib.inf
  Tpm2CommandLib               |SecurityPkg/Library/Tpm2CommandLib/Tpm2CommandLib.inf
  Tpm2DeviceLib                |SecurityPkg/Library/Tpm2DeviceLibTcg2/Tpm2DeviceLibTcg2.inf
  Tcg2PpVendorLib              |SecurityPkg/Library/Tcg2PpVendorLibNull/Tcg2PpVendorLibNull.inf
  OemTpm2InitLib               |SecurityPkg/Library/OemTpm2InitLibNull/OemTpm2InitLib.inf
!if $(TPM_ENABLE) == TRUE
  TpmMeasurementLib            |SecurityPkg/Library/DxeTpmMeasurementLib/DxeTpmMeasurementLib.inf
  Tpm2DebugLib                 |SecurityPkg/Library/Tpm2DebugLib/Tpm2DebugLibSimple.inf
!endif

  # Shell Libraries
  ShellCommandLib              |ShellPkg/Library/UefiShellCommandLib/UefiShellCommandLib.inf
  ShellCEntryLib               |ShellPkg/Library/UefiShellCEntryLib/UefiShellCEntryLib.inf
  HandleParsingLib             |ShellPkg/Library/UefiHandleParsingLib/UefiHandleParsingLib.inf
  BcfgCommandLib               |ShellPkg/Library/UefiShellBcfgCommandLib/UefiShellBcfgCommandLib.inf
  
  # DFCI / XML / JSON Libraries
  DfciUiSupportLib             |DfciPkg/Library/DfciUiSupportLibNull/DfciUiSupportLibNull.inf # Supports DFCI Groups.
  DfciV1SupportLib             |DfciPkg/Library/DfciV1SupportLibNull/DfciV1SupportLibNull.inf # Backwards compatibility with DFCI V1 functions.
  DfciDeviceIdSupportLib       |DfciPkg/Library/DfciDeviceIdSupportLibNull/DfciDeviceIdSupportLibNull.inf
  DfciGroupLib                 |DfciPkg/Library/DfciGroupLibNull/DfciGroups.inf
  DfciRecoveryLib              |DfciPkg/Library/DfciRecoveryLib/DfciRecoveryLib.inf
   # Zero Touch is part of DFCI
  ZeroTouchSettingsLib              |ZeroTouchPkg/Library/ZeroTouchSettings/ZeroTouchSettings.inf
   # Libraries that understands the MsXml Settings Schema and providers helper functions
  DfciXmlIdentitySchemaSupportLib   |DfciPkg/Library/DfciXmlIdentitySchemaSupportLib/DfciXmlIdentitySchemaSupportLib.inf
  DfciXmlDeviceIdSchemaSupportLib   |DfciPkg/Library/DfciXmlDeviceIdSchemaSupportLib/DfciXmlDeviceIdSchemaSupportLib.inf
  DfciXmlSettingSchemaSupportLib    |DfciPkg/Library/DfciXmlSettingSchemaSupportLib/DfciXmlSettingSchemaSupportLib.inf
  DfciXmlPermissionSchemaSupportLib |DfciPkg/Library/DfciXmlPermissionSchemaSupportLib/DfciXmlPermissionSchemaSupportLib.inf
  DfciXmlIdentitySchemaSupportLib   |DfciPkg/Library/DfciXmlIdentitySchemaSupportLib/DfciXmlIdentitySchemaSupportLib.inf
  DfciSettingChangedNotificationLib |DfciPkg/Library/DfciSettingChangedNotificationLib/DfciSettingChangedNotificationLibNull.inf
   #XML libraries
  XmlTreeQueryLib              |XmlSupportPkg/Library/XmlTreeQueryLib/XmlTreeQueryLib.inf
  XmlTreeLib                   |XmlSupportPkg/Library/XmlTreeLib/XmlTreeLib.inf
   # Json parser
  JsonLiteParserLib            |MsCorePkg/Library/JsonLiteParser/JsonLiteParser.inf
  
[LibraryClasses.common.SEC]
  PrePiLib                     |EmbeddedPkg/Library/PrePiLib/PrePiLib.inf
  ExtractGuidedSectionLib      |EmbeddedPkg/Library/PrePiExtractGuidedSectionLib/PrePiExtractGuidedSectionLib.inf
  HobLib                       |EmbeddedPkg/Library/PrePiHobLib/PrePiHobLib.inf
  MemoryAllocationLib          |EmbeddedPkg/Library/PrePiMemoryAllocationLib/PrePiMemoryAllocationLib.inf
  MemoryInitPeiLib             |OnePlus6TPkg/Library/MemoryInitPeiLib/PeiMemoryAllocationLib.inf
  PlatformPeiLib               |OnePlus6TPkg/Library/PlatformPeiLib/PlatformPeiLib.inf
  PrePiHobListPointerLib       |ArmPlatformPkg/Library/PrePiHobListPointerLib/PrePiHobListPointerLib.inf
  
[LibraryClasses.common.PEIM]
  MsPlatformEarlyGraphicsLib   |MsGraphicsPkg/Library/MsEarlyGraphicsLibNull/Pei/MsEarlyGraphicsLibNull.inf
  MsUiThemeLib                 |MsGraphicsPkg/Library/MsUiThemeLib/Pei/MsUiThemeLib.inf
!if $(SOURCE_DEBUG_ENABLE) == TRUE
  DebugAgentLib                |SourceLevelDebugPkg/Library/DebugAgent/SecPeiDebugAgentLib.inf
!endif
!if $(TPM_ENABLE) == TRUE
  Tpm12DeviceLib               |SecurityPkg/Library/Tpm12DeviceLibDTpm/Tpm12DeviceLibDTpm.inf
  Tpm2DeviceLib                |SecurityPkg/Library/Tpm2DeviceLibDTpm/Tpm2DeviceLibDTpm.inf
  SourceDebugEnabledLib        |SourceLevelDebugPkg/Library/SourceDebugEnabled/SourceDebugEnabledLib.inf
  Tcg2PreUefiEventLogLib       |SecurityPkg/Library/TempPreUefiEventLogLib/TempPreUefiEventLogLib.inf ## BRET - Do we have a null instance
!endif

#########################################
# DXE Libraries
#########################################
# Common to all DXE phases
[LibraryClasses.common.DXE_CORE, LibraryClasses.common.DXE_RUNTIME_DRIVER, LibraryClasses.common.UEFI_DRIVER, LibraryClasses.common.DXE_DRIVER, LibraryClasses.common.UEFI_APPLICATION]
  MsUiThemeLib                 |MsGraphicsPkg/Library/MsUiThemeLib/Dxe/MsUiThemeLib.inf
  MsPlatformEarlyGraphicsLib   |MsGraphicsPkg/Library/MsEarlyGraphicsLibNull/Dxe/MsEarlyGraphicsLibNull.inf
  HwResetSystemLib             |MdeModulePkg/Library/DxeResetSystemLib/DxeResetSystemLib.inf
  DxeCoreEntryPoint            |MdePkg/Library/DxeCoreEntryPoint/DxeCoreEntryPoint.inf
  MemoryAllocationLib          |MdePkg/Library/UefiMemoryAllocationLib/UefiMemoryAllocationLib.inf
  CpuExceptionHandlerLib       |UefiCpuPkg/Library/CpuExceptionHandlerLib/DxeCpuExceptionHandlerLib.inf

################################################################################
#
# Pcd Section - list of all EDK II PCD Entries defined by this Platform
#
################################################################################
[PcdsFeatureFlag.common]
  ## If TRUE, Graphics Output Protocol will be installed on virtual handle created by ConsplitterDxe.
  #  It could be set FALSE to save size.
  gEfiMdeModulePkgTokenSpaceGuid.PcdConOutGopSupport|TRUE
  gEfiMdeModulePkgTokenSpaceGuid.PcdConOutUgaSupport|FALSE


[PcdsFixedAtBuild.common]
  # System Memory (5GB)
  gArmTokenSpaceGuid.PcdSystemMemorySize|0x140000000
  
  gOnePlus6TPkgTokenSpaceGuid.PcdMipiFrameBufferWidth|1080
  gOnePlus6TPkgTokenSpaceGuid.PcdMipiFrameBufferHeight|2340
  
  gEfiMdePkgTokenSpaceGuid.PcdDefaultTerminalType|4

  gEfiMdeModulePkgTokenSpaceGuid.PcdFirmwareVersionString|L"Alpha"

  gArmTokenSpaceGuid.PcdSystemMemoryBase|0x80000000

  # bring up eight cores
  gArmPlatformTokenSpaceGuid.PcdCoreCount|8
  gArmPlatformTokenSpaceGuid.PcdClusterCount|2

  #
  # ARM General Interrupt Controller
  #
  gArmTokenSpaceGuid.PcdGicDistributorBase|0x17a00000
  gArmTokenSpaceGuid.PcdGicRedistributorsBase|0x17a60000

  gArmTokenSpaceGuid.PcdArmArchTimerIntrNum|0x12
  gArmTokenSpaceGuid.PcdArmArchTimerVirtIntrNum|0x13

  # GUID of the UI app
  gEfiMdeModulePkgTokenSpaceGuid.PcdBootManagerMenuFile|{ 0x21, 0xaa, 0x2c, 0x46, 0x14, 0x76, 0x03, 0x45, 0x83, 0x6e, 0x8a, 0xb6, 0xf4, 0x66, 0x23, 0x31 }
  gEfiMdePkgTokenSpaceGuid.PcdPlatformBootTimeOut|5

  gEfiMdeModulePkgTokenSpaceGuid.PcdResetOnMemoryTypeInformationChange|FALSE

  gEmbeddedTokenSpaceGuid.PcdMetronomeTickPeriod|1000

  #
  # Fastboot
  #
  gEmbeddedTokenSpaceGuid.PcdAndroidFastbootUsbVendorId|0x18d1
  gEmbeddedTokenSpaceGuid.PcdAndroidFastbootUsbProductId|0xd00d

  #
  # Make VariableRuntimeDxe work at emulated non-volatile variable mode.
  #
  gEfiMdeModulePkgTokenSpaceGuid.PcdEmuVariableNvModeEnable|TRUE
  
  gOnePlus6TPkgTokenSpaceGuid.PcdMipiFrameBufferAddress|0x9d400000

  gEfiMdeModulePkgTokenSpaceGuid.PcdAcpiExposedTableVersions|0x20

################################################################################
#
# Components Section - list of all EDK II Modules needed by this Platform
#
################################################################################
[Components.common]
  #
  # PEI Phase modules
  #
  ArmPlatformPkg/PrePi/PeiUniCore.inf

  #
  # DXE
  #
  MdeModulePkg/Core/Dxe/DxeMain.inf {
    <LibraryClasses>
      PcdLib|MdePkg/Library/BasePcdLibNull/BasePcdLibNull.inf
      NULL|MdeModulePkg/Library/DxeCrc32GuidedSectionExtractLib/DxeCrc32GuidedSectionExtractLib.inf
  }

  #
  # Architectural Protocols
  #
  ArmPkg/Drivers/CpuDxe/CpuDxe.inf
  MdeModulePkg/Core/RuntimeDxe/RuntimeDxe.inf
  MdeModulePkg/Universal/SecurityStubDxe/SecurityStubDxe.inf
  MdeModulePkg/Universal/CapsuleRuntimeDxe/CapsuleRuntimeDxe.inf
  EmbeddedPkg/EmbeddedMonotonicCounter/EmbeddedMonotonicCounter.inf
  MdeModulePkg/Universal/ResetSystemRuntimeDxe/ResetSystemRuntimeDxe.inf
  EmbeddedPkg/RealTimeClockRuntimeDxe/RealTimeClockRuntimeDxe.inf
  EmbeddedPkg/MetronomeDxe/MetronomeDxe.inf

  MdeModulePkg/Universal/Console/ConPlatformDxe/ConPlatformDxe.inf
  MdeModulePkg/Universal/Console/ConSplitterDxe/ConSplitterDxe.inf
  MdeModulePkg/Universal/Console/GraphicsConsoleDxe/GraphicsConsoleDxe.inf
  MdeModulePkg/Universal/Console/TerminalDxe/TerminalDxe.inf
  
!if $(TARGET) != RELEASE  
  MdeModulePkg/Universal/SerialDxe/SerialDxe.inf
!endif

  MdeModulePkg/Universal/Variable/RuntimeDxe/VariableRuntimeDxe.inf
  
  ArmPkg/Drivers/ArmGic/ArmGicDxe.inf
  ArmPkg/Drivers/TimerDxe/TimerDxe.inf

  MdeModulePkg/Universal/WatchdogTimerDxe/WatchdogTimer.inf

  MdeModulePkg/Universal/PCD/Dxe/Pcd.inf

  EmbeddedPkg/RealTimeClockRuntimeDxe/RealTimeClockRuntimeDxe.inf {
    <LibraryClasses>
      RealTimeClockLib|OnePlus6TPkg/Library/VirtualRealTimeClockLib/VirtualRealTimeClockLib.inf
  }

  MdeModulePkg/Universal/ReportStatusCodeRouter/RuntimeDxe/ReportStatusCodeRouterRuntimeDxe.inf
  MdeModulePkg/Universal/StatusCodeHandler/RuntimeDxe/StatusCodeHandlerRuntimeDxe.inf
  
  #
  # Virtual Keyboard
  #
  EmbeddedPkg/Drivers/VirtualKeyboardDxe/VirtualKeyboardDxe.inf
  
  #
  # Sdm845 Cpu
  #
  OnePlus6TPkg/Drivers/sdm845Dxe/sdm845Dxe.inf
  
  #
  # FD Support
  #
  OnePlus6TPkg/Drivers/SimpleFbDxe/SimpleFbDxe.inf

  #
  # USB Host Support
  #
  MdeModulePkg/Bus/Usb/UsbBusDxe/UsbBusDxe.inf

  #
  # USB Mass Storage Support
  #
  MdeModulePkg/Bus/Usb/UsbMassStorageDxe/UsbMassStorageDxe.inf

  #
  # USB Peripheral Support
  #
  EmbeddedPkg/Drivers/AndroidFastbootTransportUsbDxe/FastbootTransportUsbDxe.inf

  #
  # Fastboot
  #
  EmbeddedPkg/Application/AndroidFastboot/AndroidFastbootApp.inf


  #
  # FAT filesystem with GPT/MBR partitioning
  #
  MdeModulePkg/Universal/Disk/DiskIoDxe/DiskIoDxe.inf
  MdeModulePkg/Universal/Disk/PartitionDxe/PartitionDxe.inf
  MdeModulePkg/Universal/Disk/UnicodeCollation/EnglishDxe/EnglishDxe.inf
  FatPkg/EnhancedFatDxe/Fat.inf

  #
  # ACPI Support
  #
  MdeModulePkg/Universal/Acpi/AcpiTableDxe/AcpiTableDxe.inf
  MdeModulePkg/Universal/Acpi/AcpiPlatformDxe/AcpiPlatformDxe.inf
  MdeModulePkg/Universal/Acpi/BootGraphicsResourceTableDxe/BootGraphicsResourceTableDxe.inf
  # OnePlus6TPkg/AcpiTables/AcpiTables.inf

  #
  # FDT support
  #
  EmbeddedPkg/Drivers/DtPlatformDxe/DtPlatformDxe.inf

  #
  # SMBIOS Support
  #
  OnePlus6TPkg/Drivers/SmbiosPlatformDxe/SmbiosPlatformDxe.inf
  MdeModulePkg/Universal/SmbiosDxe/SmbiosDxe.inf
  
  #
  # OnePlus 6T A/B Slot Support
  #
  OnePlus6TPkg/Drivers/Op6tSlotDxe/Op6tSlotDxe.inf
  
  #
  # Bds
  #
  MdeModulePkg/Universal/PrintDxe/PrintDxe.inf
  MdeModulePkg/Universal/DevicePathDxe/DevicePathDxe.inf
  MdeModulePkg/Universal/HiiDatabaseDxe/HiiDatabaseDxe.inf {
    <LibraryClasses>
      PcdLib|MdePkg/Library/DxePcdLib/DxePcdLib.inf
  }
  MdeModulePkg/Universal/DisplayEngineDxe/DisplayEngineDxe.inf
  MdeModulePkg/Universal/SetupBrowserDxe/SetupBrowserDxe.inf
  MdeModulePkg/Universal/DriverHealthManagerDxe/DriverHealthManagerDxe.inf
  MdeModulePkg/Universal/BdsDxe/BdsDxe.inf
  MdeModulePkg/Application/UiApp/UiApp.inf {
    <LibraryClasses>
      NULL|MdeModulePkg/Library/DeviceManagerUiLib/DeviceManagerUiLib.inf
      NULL|MdeModulePkg/Library/BootManagerUiLib/BootManagerUiLib.inf
      NULL|MdeModulePkg/Library/BootMaintenanceManagerUiLib/BootMaintenanceManagerUiLib.inf
      PcdLib|MdePkg/Library/DxePcdLib/DxePcdLib.inf
  }
  # OnePlus6TPkg/Drivers/LogoDxe/LogoDxe.inf

  ShellPkg/Application/Shell/Shell.inf {
    <LibraryClasses>
      ShellCommandLib|ShellPkg/Library/UefiShellCommandLib/UefiShellCommandLib.inf
      NULL|ShellPkg/Library/UefiShellLevel2CommandsLib/UefiShellLevel2CommandsLib.inf
      NULL|ShellPkg/Library/UefiShellLevel1CommandsLib/UefiShellLevel1CommandsLib.inf
      NULL|ShellPkg/Library/UefiShellLevel3CommandsLib/UefiShellLevel3CommandsLib.inf
      NULL|ShellPkg/Library/UefiShellDriver1CommandsLib/UefiShellDriver1CommandsLib.inf
      NULL|ShellPkg/Library/UefiShellDebug1CommandsLib/UefiShellDebug1CommandsLib.inf
      NULL|ShellPkg/Library/UefiShellInstall1CommandsLib/UefiShellInstall1CommandsLib.inf
      NULL|ShellPkg/Library/UefiShellNetwork1CommandsLib/UefiShellNetwork1CommandsLib.inf
      NULL|ShellPkg/Library/UefiShellAcpiViewCommandLib/UefiShellAcpiViewCommandLib.inf
      HandleParsingLib|ShellPkg/Library/UefiHandleParsingLib/UefiHandleParsingLib.inf
      PrintLib|MdePkg/Library/BasePrintLib/BasePrintLib.inf
      BcfgCommandLib|ShellPkg/Library/UefiShellBcfgCommandLib/UefiShellBcfgCommandLib.inf
    <PcdsFixedAtBuild>
      gEfiMdePkgTokenSpaceGuid.PcdDebugPropertyMask|0xFF
      gEfiShellPkgTokenSpaceGuid.PcdShellLibAutoInitialize|FALSE
      gEfiMdePkgTokenSpaceGuid.PcdUefiLibMaxPrintBufferSize|8000
  }
!ifdef $(INCLUDE_TFTP_COMMAND)
  ShellPkg/DynamicCommand/TftpDynamicCommand/TftpDynamicCommand.inf
!endif #$(INCLUDE_TFTP_COMMAND)
