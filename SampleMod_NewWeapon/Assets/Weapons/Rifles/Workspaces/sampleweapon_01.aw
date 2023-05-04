BaseSource {
 AnimSetTemplate "{5CB30278D36EF298}Assets/Weapons/Rifles/Workspaces/sampleweapon_01.ast"
 AnimSetInstances {
  "{58CFBA64E686C110}Assets/Weapons/Rifles/Workspaces/sampleweapon_01_weapon.asi"
  "{A3912B557E87A5FC}Assets/Weapons/Rifles/Workspaces/sampleweapon_01_player.asi"
 }
 AnimGraph "{4E416478E4AB266B}Assets/Weapons/Rifles/Workspaces/sampleweapon_01.agr"
 PreviewModels {
  AnimSrcWorkspacePreviewModel "{588902AFC784CD97}" {
   Model "{CEF64051BB82B9EB}Assets/Weapons/Rifles/SampleWeapon_01/SampleWeapon_01.xob"
  }
  AnimSrcWorkspacePreviewModel "{563EF338E13AB791}" {
   Model "{7297BDBDE223627F}Assets/Characters/Animation/AnimTestChar_USSR_01.xob"
  }
 }
 ChildPreviewModels {
  AnimSrcWorkspaceChildPreviewModel "{588902AFC784CDDF}" {
   Enabled 1
   Model "{AF09C182ADFE3F26}Assets/Weapons/Magazines/SampleWeapon_01/Magazine_65x39c_SampleWeapon_01_30rnd.xob"
   Bone "slot_magazine"
   Parent "{588902AFC784CD97}"
  }
  AnimSrcWorkspaceChildPreviewModel "{588902AFC784CC1E}" {
   Enabled 1
   Model "{CEF64051BB82B9EB}Assets/Weapons/Rifles/SampleWeapon_01/SampleWeapon_01.xob"
   Bone "RightHandProp"
   Parent "{563EF338E13AB791}"
  }
  AnimSrcWorkspaceChildPreviewModel "{5AE0EA91FC2D043F}" {
   Enabled 1
   Model "{AF09C182ADFE3F26}Assets/Weapons/Magazines/SampleWeapon_01/Magazine_65x39c_SampleWeapon_01_30rnd.xob"
   Bone "LeftHandProp"
   Parent "{563EF338E13AB791}"
  }
 }
 AudioTesting AnimSrcWorkspaceAudioTesting "{5888C730804D6108}" {
 }
 AttachmentTesting AnimSrcWorkspaceAttachmentTesting "{51EA7A3AA3EEAED4}" {
 }
 IkTesting AnimSrcWorkspaceIkTesting "{53049245B8940ACD}" {
 }
}