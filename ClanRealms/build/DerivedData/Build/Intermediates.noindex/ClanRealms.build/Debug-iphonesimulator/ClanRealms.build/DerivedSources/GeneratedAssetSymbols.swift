import Foundation
#if canImport(DeveloperToolsSupport)
import DeveloperToolsSupport
#endif

#if SWIFT_PACKAGE
private let resourceBundle = Foundation.Bundle.module
#else
private class ResourceBundleClass {}
private let resourceBundle = Foundation.Bundle(for: ResourceBundleClass.self)
#endif

// MARK: - Color Symbols -

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension DeveloperToolsSupport.ColorResource {

    /// The "AccentColor" asset catalog color resource.
    static let accent = DeveloperToolsSupport.ColorResource(name: "AccentColor", bundle: resourceBundle)

}

// MARK: - Image Symbols -

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension DeveloperToolsSupport.ImageResource {

    /// The "adult_dragon" asset catalog image resource.
    static let adultDragon = DeveloperToolsSupport.ImageResource(name: "adult_dragon", bundle: resourceBundle)

    /// The "anvil" asset catalog image resource.
    static let anvil = DeveloperToolsSupport.ImageResource(name: "anvil", bundle: resourceBundle)

    /// The "ap_tileGreen_01" asset catalog image resource.
    static let apTileGreen01 = DeveloperToolsSupport.ImageResource(name: "ap_tileGreen_01", bundle: resourceBundle)

    /// The "ap_tileGreen_02" asset catalog image resource.
    static let apTileGreen02 = DeveloperToolsSupport.ImageResource(name: "ap_tileGreen_02", bundle: resourceBundle)

    /// The "ap_tileGreen_03" asset catalog image resource.
    static let apTileGreen03 = DeveloperToolsSupport.ImageResource(name: "ap_tileGreen_03", bundle: resourceBundle)

    /// The "ap_tileGreen_04" asset catalog image resource.
    static let apTileGreen04 = DeveloperToolsSupport.ImageResource(name: "ap_tileGreen_04", bundle: resourceBundle)

    /// The "ap_tileGreen_05" asset catalog image resource.
    static let apTileGreen05 = DeveloperToolsSupport.ImageResource(name: "ap_tileGreen_05", bundle: resourceBundle)

    /// The "ap_tileGreen_06" asset catalog image resource.
    static let apTileGreen06 = DeveloperToolsSupport.ImageResource(name: "ap_tileGreen_06", bundle: resourceBundle)

    /// The "ap_tileGreen_07" asset catalog image resource.
    static let apTileGreen07 = DeveloperToolsSupport.ImageResource(name: "ap_tileGreen_07", bundle: resourceBundle)

    /// The "ap_tileGreen_08" asset catalog image resource.
    static let apTileGreen08 = DeveloperToolsSupport.ImageResource(name: "ap_tileGreen_08", bundle: resourceBundle)

    /// The "ap_tileGreen_09" asset catalog image resource.
    static let apTileGreen09 = DeveloperToolsSupport.ImageResource(name: "ap_tileGreen_09", bundle: resourceBundle)

    /// The "ap_tileGreen_10" asset catalog image resource.
    static let apTileGreen10 = DeveloperToolsSupport.ImageResource(name: "ap_tileGreen_10", bundle: resourceBundle)

    /// The "ap_tileGreen_11" asset catalog image resource.
    static let apTileGreen11 = DeveloperToolsSupport.ImageResource(name: "ap_tileGreen_11", bundle: resourceBundle)

    /// The "ap_tileGreen_12" asset catalog image resource.
    static let apTileGreen12 = DeveloperToolsSupport.ImageResource(name: "ap_tileGreen_12", bundle: resourceBundle)

    /// The "ap_tileGreen_13" asset catalog image resource.
    static let apTileGreen13 = DeveloperToolsSupport.ImageResource(name: "ap_tileGreen_13", bundle: resourceBundle)

    /// The "ap_tileGreen_14" asset catalog image resource.
    static let apTileGreen14 = DeveloperToolsSupport.ImageResource(name: "ap_tileGreen_14", bundle: resourceBundle)

    /// The "ap_tileGreen_15" asset catalog image resource.
    static let apTileGreen15 = DeveloperToolsSupport.ImageResource(name: "ap_tileGreen_15", bundle: resourceBundle)

    /// The "ap_tileGreen_16" asset catalog image resource.
    static let apTileGreen16 = DeveloperToolsSupport.ImageResource(name: "ap_tileGreen_16", bundle: resourceBundle)

    /// The "ap_tileGreen_17" asset catalog image resource.
    static let apTileGreen17 = DeveloperToolsSupport.ImageResource(name: "ap_tileGreen_17", bundle: resourceBundle)

    /// The "ap_tileGreen_18" asset catalog image resource.
    static let apTileGreen18 = DeveloperToolsSupport.ImageResource(name: "ap_tileGreen_18", bundle: resourceBundle)

    /// The "ap_tileGreen_19" asset catalog image resource.
    static let apTileGreen19 = DeveloperToolsSupport.ImageResource(name: "ap_tileGreen_19", bundle: resourceBundle)

    /// The "ap_tileGreen_20" asset catalog image resource.
    static let apTileGreen20 = DeveloperToolsSupport.ImageResource(name: "ap_tileGreen_20", bundle: resourceBundle)

    /// The "ap_tileGreen_21" asset catalog image resource.
    static let apTileGreen21 = DeveloperToolsSupport.ImageResource(name: "ap_tileGreen_21", bundle: resourceBundle)

    /// The "ap_tileGreen_22" asset catalog image resource.
    static let apTileGreen22 = DeveloperToolsSupport.ImageResource(name: "ap_tileGreen_22", bundle: resourceBundle)

    /// The "ap_tileGreen_23" asset catalog image resource.
    static let apTileGreen23 = DeveloperToolsSupport.ImageResource(name: "ap_tileGreen_23", bundle: resourceBundle)

    /// The "ap_tileGreen_24" asset catalog image resource.
    static let apTileGreen24 = DeveloperToolsSupport.ImageResource(name: "ap_tileGreen_24", bundle: resourceBundle)

    /// The "ap_tileGreen_25" asset catalog image resource.
    static let apTileGreen25 = DeveloperToolsSupport.ImageResource(name: "ap_tileGreen_25", bundle: resourceBundle)

    /// The "ap_tileGreen_26" asset catalog image resource.
    static let apTileGreen26 = DeveloperToolsSupport.ImageResource(name: "ap_tileGreen_26", bundle: resourceBundle)

    /// The "ap_tileGreen_27" asset catalog image resource.
    static let apTileGreen27 = DeveloperToolsSupport.ImageResource(name: "ap_tileGreen_27", bundle: resourceBundle)

    /// The "ap_tileYellow_01" asset catalog image resource.
    static let apTileYellow01 = DeveloperToolsSupport.ImageResource(name: "ap_tileYellow_01", bundle: resourceBundle)

    /// The "ap_tileYellow_02" asset catalog image resource.
    static let apTileYellow02 = DeveloperToolsSupport.ImageResource(name: "ap_tileYellow_02", bundle: resourceBundle)

    /// The "ap_tileYellow_03" asset catalog image resource.
    static let apTileYellow03 = DeveloperToolsSupport.ImageResource(name: "ap_tileYellow_03", bundle: resourceBundle)

    /// The "ap_tileYellow_04" asset catalog image resource.
    static let apTileYellow04 = DeveloperToolsSupport.ImageResource(name: "ap_tileYellow_04", bundle: resourceBundle)

    /// The "ap_tileYellow_05" asset catalog image resource.
    static let apTileYellow05 = DeveloperToolsSupport.ImageResource(name: "ap_tileYellow_05", bundle: resourceBundle)

    /// The "ap_tileYellow_06" asset catalog image resource.
    static let apTileYellow06 = DeveloperToolsSupport.ImageResource(name: "ap_tileYellow_06", bundle: resourceBundle)

    /// The "ap_tileYellow_07" asset catalog image resource.
    static let apTileYellow07 = DeveloperToolsSupport.ImageResource(name: "ap_tileYellow_07", bundle: resourceBundle)

    /// The "ap_tileYellow_10" asset catalog image resource.
    static let apTileYellow10 = DeveloperToolsSupport.ImageResource(name: "ap_tileYellow_10", bundle: resourceBundle)

    /// The "ap_tileYellow_11" asset catalog image resource.
    static let apTileYellow11 = DeveloperToolsSupport.ImageResource(name: "ap_tileYellow_11", bundle: resourceBundle)

    /// The "ap_tileYellow_12" asset catalog image resource.
    static let apTileYellow12 = DeveloperToolsSupport.ImageResource(name: "ap_tileYellow_12", bundle: resourceBundle)

    /// The "ap_tileYellow_13" asset catalog image resource.
    static let apTileYellow13 = DeveloperToolsSupport.ImageResource(name: "ap_tileYellow_13", bundle: resourceBundle)

    /// The "ap_tileYellow_14" asset catalog image resource.
    static let apTileYellow14 = DeveloperToolsSupport.ImageResource(name: "ap_tileYellow_14", bundle: resourceBundle)

    /// The "ap_tileYellow_15" asset catalog image resource.
    static let apTileYellow15 = DeveloperToolsSupport.ImageResource(name: "ap_tileYellow_15", bundle: resourceBundle)

    /// The "ap_tileYellow_16" asset catalog image resource.
    static let apTileYellow16 = DeveloperToolsSupport.ImageResource(name: "ap_tileYellow_16", bundle: resourceBundle)

    /// The "ap_tileYellow_17" asset catalog image resource.
    static let apTileYellow17 = DeveloperToolsSupport.ImageResource(name: "ap_tileYellow_17", bundle: resourceBundle)

    /// The "ap_tileYellow_18" asset catalog image resource.
    static let apTileYellow18 = DeveloperToolsSupport.ImageResource(name: "ap_tileYellow_18", bundle: resourceBundle)

    /// The "ap_tileYellow_19" asset catalog image resource.
    static let apTileYellow19 = DeveloperToolsSupport.ImageResource(name: "ap_tileYellow_19", bundle: resourceBundle)

    /// The "ap_tileYellow_22" asset catalog image resource.
    static let apTileYellow22 = DeveloperToolsSupport.ImageResource(name: "ap_tileYellow_22", bundle: resourceBundle)

    /// The "ap_tileYellow_23" asset catalog image resource.
    static let apTileYellow23 = DeveloperToolsSupport.ImageResource(name: "ap_tileYellow_23", bundle: resourceBundle)

    /// The "ap_tileYellow_24" asset catalog image resource.
    static let apTileYellow24 = DeveloperToolsSupport.ImageResource(name: "ap_tileYellow_24", bundle: resourceBundle)

    /// The "ap_tileYellow_25" asset catalog image resource.
    static let apTileYellow25 = DeveloperToolsSupport.ImageResource(name: "ap_tileYellow_25", bundle: resourceBundle)

    /// The "ap_tileYellow_26" asset catalog image resource.
    static let apTileYellow26 = DeveloperToolsSupport.ImageResource(name: "ap_tileYellow_26", bundle: resourceBundle)

    /// The "ap_tileYellow_27" asset catalog image resource.
    static let apTileYellow27 = DeveloperToolsSupport.ImageResource(name: "ap_tileYellow_27", bundle: resourceBundle)

    /// The "apple" asset catalog image resource.
    static let apple = DeveloperToolsSupport.ImageResource(name: "apple", bundle: resourceBundle)

    /// The "baby_dragon" asset catalog image resource.
    static let babyDragon = DeveloperToolsSupport.ImageResource(name: "baby_dragon", bundle: resourceBundle)

    /// The "backpack" asset catalog image resource.
    static let backpack = DeveloperToolsSupport.ImageResource(name: "backpack", bundle: resourceBundle)

    /// The "barrel" asset catalog image resource.
    static let barrel = DeveloperToolsSupport.ImageResource(name: "barrel", bundle: resourceBundle)

    /// The "bat" asset catalog image resource.
    static let bat = DeveloperToolsSupport.ImageResource(name: "bat", bundle: resourceBundle)

    /// The "battle_axe" asset catalog image resource.
    static let battleAxe = DeveloperToolsSupport.ImageResource(name: "battle_axe", bundle: resourceBundle)

    /// The "bee" asset catalog image resource.
    static let bee = DeveloperToolsSupport.ImageResource(name: "bee", bundle: resourceBundle)

    /// The "boat" asset catalog image resource.
    static let boat = DeveloperToolsSupport.ImageResource(name: "boat", bundle: resourceBundle)

    /// The "bomb" asset catalog image resource.
    static let bomb = DeveloperToolsSupport.ImageResource(name: "bomb", bundle: resourceBundle)

    /// The "bow" asset catalog image resource.
    static let bow = DeveloperToolsSupport.ImageResource(name: "bow", bundle: resourceBundle)

    /// The "bridge" asset catalog image resource.
    static let bridge = DeveloperToolsSupport.ImageResource(name: "bridge", bundle: resourceBundle)

    /// The "bsmoke_blackSmoke00" asset catalog image resource.
    static let bsmokeBlackSmoke00 = DeveloperToolsSupport.ImageResource(name: "bsmoke_blackSmoke00", bundle: resourceBundle)

    /// The "bsmoke_blackSmoke01" asset catalog image resource.
    static let bsmokeBlackSmoke01 = DeveloperToolsSupport.ImageResource(name: "bsmoke_blackSmoke01", bundle: resourceBundle)

    /// The "bsmoke_blackSmoke02" asset catalog image resource.
    static let bsmokeBlackSmoke02 = DeveloperToolsSupport.ImageResource(name: "bsmoke_blackSmoke02", bundle: resourceBundle)

    /// The "bsmoke_blackSmoke03" asset catalog image resource.
    static let bsmokeBlackSmoke03 = DeveloperToolsSupport.ImageResource(name: "bsmoke_blackSmoke03", bundle: resourceBundle)

    /// The "bsmoke_blackSmoke04" asset catalog image resource.
    static let bsmokeBlackSmoke04 = DeveloperToolsSupport.ImageResource(name: "bsmoke_blackSmoke04", bundle: resourceBundle)

    /// The "bsmoke_blackSmoke05" asset catalog image resource.
    static let bsmokeBlackSmoke05 = DeveloperToolsSupport.ImageResource(name: "bsmoke_blackSmoke05", bundle: resourceBundle)

    /// The "bsmoke_blackSmoke06" asset catalog image resource.
    static let bsmokeBlackSmoke06 = DeveloperToolsSupport.ImageResource(name: "bsmoke_blackSmoke06", bundle: resourceBundle)

    /// The "bsmoke_blackSmoke07" asset catalog image resource.
    static let bsmokeBlackSmoke07 = DeveloperToolsSupport.ImageResource(name: "bsmoke_blackSmoke07", bundle: resourceBundle)

    /// The "bsmoke_blackSmoke08" asset catalog image resource.
    static let bsmokeBlackSmoke08 = DeveloperToolsSupport.ImageResource(name: "bsmoke_blackSmoke08", bundle: resourceBundle)

    /// The "bsmoke_blackSmoke09" asset catalog image resource.
    static let bsmokeBlackSmoke09 = DeveloperToolsSupport.ImageResource(name: "bsmoke_blackSmoke09", bundle: resourceBundle)

    /// The "bsmoke_blackSmoke10" asset catalog image resource.
    static let bsmokeBlackSmoke10 = DeveloperToolsSupport.ImageResource(name: "bsmoke_blackSmoke10", bundle: resourceBundle)

    /// The "bsmoke_blackSmoke11" asset catalog image resource.
    static let bsmokeBlackSmoke11 = DeveloperToolsSupport.ImageResource(name: "bsmoke_blackSmoke11", bundle: resourceBundle)

    /// The "bsmoke_blackSmoke12" asset catalog image resource.
    static let bsmokeBlackSmoke12 = DeveloperToolsSupport.ImageResource(name: "bsmoke_blackSmoke12", bundle: resourceBundle)

    /// The "bsmoke_blackSmoke13" asset catalog image resource.
    static let bsmokeBlackSmoke13 = DeveloperToolsSupport.ImageResource(name: "bsmoke_blackSmoke13", bundle: resourceBundle)

    /// The "bsmoke_blackSmoke14" asset catalog image resource.
    static let bsmokeBlackSmoke14 = DeveloperToolsSupport.ImageResource(name: "bsmoke_blackSmoke14", bundle: resourceBundle)

    /// The "bsmoke_blackSmoke15" asset catalog image resource.
    static let bsmokeBlackSmoke15 = DeveloperToolsSupport.ImageResource(name: "bsmoke_blackSmoke15", bundle: resourceBundle)

    /// The "bsmoke_blackSmoke16" asset catalog image resource.
    static let bsmokeBlackSmoke16 = DeveloperToolsSupport.ImageResource(name: "bsmoke_blackSmoke16", bundle: resourceBundle)

    /// The "bsmoke_blackSmoke17" asset catalog image resource.
    static let bsmokeBlackSmoke17 = DeveloperToolsSupport.ImageResource(name: "bsmoke_blackSmoke17", bundle: resourceBundle)

    /// The "bsmoke_blackSmoke18" asset catalog image resource.
    static let bsmokeBlackSmoke18 = DeveloperToolsSupport.ImageResource(name: "bsmoke_blackSmoke18", bundle: resourceBundle)

    /// The "bsmoke_blackSmoke19" asset catalog image resource.
    static let bsmokeBlackSmoke19 = DeveloperToolsSupport.ImageResource(name: "bsmoke_blackSmoke19", bundle: resourceBundle)

    /// The "bsmoke_blackSmoke20" asset catalog image resource.
    static let bsmokeBlackSmoke20 = DeveloperToolsSupport.ImageResource(name: "bsmoke_blackSmoke20", bundle: resourceBundle)

    /// The "bsmoke_blackSmoke21" asset catalog image resource.
    static let bsmokeBlackSmoke21 = DeveloperToolsSupport.ImageResource(name: "bsmoke_blackSmoke21", bundle: resourceBundle)

    /// The "bsmoke_blackSmoke22" asset catalog image resource.
    static let bsmokeBlackSmoke22 = DeveloperToolsSupport.ImageResource(name: "bsmoke_blackSmoke22", bundle: resourceBundle)

    /// The "bsmoke_blackSmoke23" asset catalog image resource.
    static let bsmokeBlackSmoke23 = DeveloperToolsSupport.ImageResource(name: "bsmoke_blackSmoke23", bundle: resourceBundle)

    /// The "bush" asset catalog image resource.
    static let bush = DeveloperToolsSupport.ImageResource(name: "bush", bundle: resourceBundle)

    /// The "campfire" asset catalog image resource.
    static let campfire = DeveloperToolsSupport.ImageResource(name: "campfire", bundle: resourceBundle)

    /// The "cart" asset catalog image resource.
    static let cart = DeveloperToolsSupport.ImageResource(name: "cart", bundle: resourceBundle)

    /// The "chicken" asset catalog image resource.
    static let chicken = DeveloperToolsSupport.ImageResource(name: "chicken", bundle: resourceBundle)

    /// The "closed_chest" asset catalog image resource.
    static let closedChest = DeveloperToolsSupport.ImageResource(name: "closed_chest", bundle: resourceBundle)

    /// The "cottage" asset catalog image resource.
    static let cottage = DeveloperToolsSupport.ImageResource(name: "cottage", bundle: resourceBundle)

    /// The "crate" asset catalog image resource.
    static let crate = DeveloperToolsSupport.ImageResource(name: "crate", bundle: resourceBundle)

    /// The "crystal" asset catalog image resource.
    static let crystal = DeveloperToolsSupport.ImageResource(name: "crystal", bundle: resourceBundle)

    /// The "dagger" asset catalog image resource.
    static let dagger = DeveloperToolsSupport.ImageResource(name: "dagger", bundle: resourceBundle)

    /// The "dark_knight" asset catalog image resource.
    static let darkKnight = DeveloperToolsSupport.ImageResource(name: "dark_knight", bundle: resourceBundle)

    /// The "expl_explosion00" asset catalog image resource.
    static let explExplosion00 = DeveloperToolsSupport.ImageResource(name: "expl_explosion00", bundle: resourceBundle)

    /// The "expl_explosion01" asset catalog image resource.
    static let explExplosion01 = DeveloperToolsSupport.ImageResource(name: "expl_explosion01", bundle: resourceBundle)

    /// The "expl_explosion02" asset catalog image resource.
    static let explExplosion02 = DeveloperToolsSupport.ImageResource(name: "expl_explosion02", bundle: resourceBundle)

    /// The "expl_explosion03" asset catalog image resource.
    static let explExplosion03 = DeveloperToolsSupport.ImageResource(name: "expl_explosion03", bundle: resourceBundle)

    /// The "expl_explosion04" asset catalog image resource.
    static let explExplosion04 = DeveloperToolsSupport.ImageResource(name: "expl_explosion04", bundle: resourceBundle)

    /// The "expl_explosion05" asset catalog image resource.
    static let explExplosion05 = DeveloperToolsSupport.ImageResource(name: "expl_explosion05", bundle: resourceBundle)

    /// The "expl_explosion06" asset catalog image resource.
    static let explExplosion06 = DeveloperToolsSupport.ImageResource(name: "expl_explosion06", bundle: resourceBundle)

    /// The "expl_explosion07" asset catalog image resource.
    static let explExplosion07 = DeveloperToolsSupport.ImageResource(name: "expl_explosion07", bundle: resourceBundle)

    /// The "expl_explosion08" asset catalog image resource.
    static let explExplosion08 = DeveloperToolsSupport.ImageResource(name: "expl_explosion08", bundle: resourceBundle)

    /// The "fence" asset catalog image resource.
    static let fence = DeveloperToolsSupport.ImageResource(name: "fence", bundle: resourceBundle)

    /// The "flash_flash00" asset catalog image resource.
    static let flashFlash00 = DeveloperToolsSupport.ImageResource(name: "flash_flash00", bundle: resourceBundle)

    /// The "flash_flash01" asset catalog image resource.
    static let flashFlash01 = DeveloperToolsSupport.ImageResource(name: "flash_flash01", bundle: resourceBundle)

    /// The "flash_flash02" asset catalog image resource.
    static let flashFlash02 = DeveloperToolsSupport.ImageResource(name: "flash_flash02", bundle: resourceBundle)

    /// The "flash_flash03" asset catalog image resource.
    static let flashFlash03 = DeveloperToolsSupport.ImageResource(name: "flash_flash03", bundle: resourceBundle)

    /// The "flash_flash04" asset catalog image resource.
    static let flashFlash04 = DeveloperToolsSupport.ImageResource(name: "flash_flash04", bundle: resourceBundle)

    /// The "flash_flash05" asset catalog image resource.
    static let flashFlash05 = DeveloperToolsSupport.ImageResource(name: "flash_flash05", bundle: resourceBundle)

    /// The "flash_flash06" asset catalog image resource.
    static let flashFlash06 = DeveloperToolsSupport.ImageResource(name: "flash_flash06", bundle: resourceBundle)

    /// The "flash_flash07" asset catalog image resource.
    static let flashFlash07 = DeveloperToolsSupport.ImageResource(name: "flash_flash07", bundle: resourceBundle)

    /// The "flash_flash08" asset catalog image resource.
    static let flashFlash08 = DeveloperToolsSupport.ImageResource(name: "flash_flash08", bundle: resourceBundle)

    /// The "fx_circle_01" asset catalog image resource.
    static let fxCircle01 = DeveloperToolsSupport.ImageResource(name: "fx_circle_01", bundle: resourceBundle)

    /// The "fx_circle_02" asset catalog image resource.
    static let fxCircle02 = DeveloperToolsSupport.ImageResource(name: "fx_circle_02", bundle: resourceBundle)

    /// The "fx_circle_03" asset catalog image resource.
    static let fxCircle03 = DeveloperToolsSupport.ImageResource(name: "fx_circle_03", bundle: resourceBundle)

    /// The "fx_circle_04" asset catalog image resource.
    static let fxCircle04 = DeveloperToolsSupport.ImageResource(name: "fx_circle_04", bundle: resourceBundle)

    /// The "fx_circle_05" asset catalog image resource.
    static let fxCircle05 = DeveloperToolsSupport.ImageResource(name: "fx_circle_05", bundle: resourceBundle)

    /// The "fx_dirt_01" asset catalog image resource.
    static let fxDirt01 = DeveloperToolsSupport.ImageResource(name: "fx_dirt_01", bundle: resourceBundle)

    /// The "fx_dirt_02" asset catalog image resource.
    static let fxDirt02 = DeveloperToolsSupport.ImageResource(name: "fx_dirt_02", bundle: resourceBundle)

    /// The "fx_dirt_03" asset catalog image resource.
    static let fxDirt03 = DeveloperToolsSupport.ImageResource(name: "fx_dirt_03", bundle: resourceBundle)

    /// The "fx_fire_01" asset catalog image resource.
    static let fxFire01 = DeveloperToolsSupport.ImageResource(name: "fx_fire_01", bundle: resourceBundle)

    /// The "fx_fire_02" asset catalog image resource.
    static let fxFire02 = DeveloperToolsSupport.ImageResource(name: "fx_fire_02", bundle: resourceBundle)

    /// The "fx_flame_01" asset catalog image resource.
    static let fxFlame01 = DeveloperToolsSupport.ImageResource(name: "fx_flame_01", bundle: resourceBundle)

    /// The "fx_flame_02" asset catalog image resource.
    static let fxFlame02 = DeveloperToolsSupport.ImageResource(name: "fx_flame_02", bundle: resourceBundle)

    /// The "fx_flame_03" asset catalog image resource.
    static let fxFlame03 = DeveloperToolsSupport.ImageResource(name: "fx_flame_03", bundle: resourceBundle)

    /// The "fx_flame_04" asset catalog image resource.
    static let fxFlame04 = DeveloperToolsSupport.ImageResource(name: "fx_flame_04", bundle: resourceBundle)

    /// The "fx_flame_05" asset catalog image resource.
    static let fxFlame05 = DeveloperToolsSupport.ImageResource(name: "fx_flame_05", bundle: resourceBundle)

    /// The "fx_flame_06" asset catalog image resource.
    static let fxFlame06 = DeveloperToolsSupport.ImageResource(name: "fx_flame_06", bundle: resourceBundle)

    /// The "fx_flare_01" asset catalog image resource.
    static let fxFlare01 = DeveloperToolsSupport.ImageResource(name: "fx_flare_01", bundle: resourceBundle)

    /// The "fx_light_01" asset catalog image resource.
    static let fxLight01 = DeveloperToolsSupport.ImageResource(name: "fx_light_01", bundle: resourceBundle)

    /// The "fx_light_02" asset catalog image resource.
    static let fxLight02 = DeveloperToolsSupport.ImageResource(name: "fx_light_02", bundle: resourceBundle)

    /// The "fx_light_03" asset catalog image resource.
    static let fxLight03 = DeveloperToolsSupport.ImageResource(name: "fx_light_03", bundle: resourceBundle)

    /// The "fx_magic_01" asset catalog image resource.
    static let fxMagic01 = DeveloperToolsSupport.ImageResource(name: "fx_magic_01", bundle: resourceBundle)

    /// The "fx_magic_02" asset catalog image resource.
    static let fxMagic02 = DeveloperToolsSupport.ImageResource(name: "fx_magic_02", bundle: resourceBundle)

    /// The "fx_magic_03" asset catalog image resource.
    static let fxMagic03 = DeveloperToolsSupport.ImageResource(name: "fx_magic_03", bundle: resourceBundle)

    /// The "fx_magic_04" asset catalog image resource.
    static let fxMagic04 = DeveloperToolsSupport.ImageResource(name: "fx_magic_04", bundle: resourceBundle)

    /// The "fx_magic_05" asset catalog image resource.
    static let fxMagic05 = DeveloperToolsSupport.ImageResource(name: "fx_magic_05", bundle: resourceBundle)

    /// The "fx_muzzle_01" asset catalog image resource.
    static let fxMuzzle01 = DeveloperToolsSupport.ImageResource(name: "fx_muzzle_01", bundle: resourceBundle)

    /// The "fx_muzzle_02" asset catalog image resource.
    static let fxMuzzle02 = DeveloperToolsSupport.ImageResource(name: "fx_muzzle_02", bundle: resourceBundle)

    /// The "fx_muzzle_03" asset catalog image resource.
    static let fxMuzzle03 = DeveloperToolsSupport.ImageResource(name: "fx_muzzle_03", bundle: resourceBundle)

    /// The "fx_muzzle_04" asset catalog image resource.
    static let fxMuzzle04 = DeveloperToolsSupport.ImageResource(name: "fx_muzzle_04", bundle: resourceBundle)

    /// The "fx_muzzle_05" asset catalog image resource.
    static let fxMuzzle05 = DeveloperToolsSupport.ImageResource(name: "fx_muzzle_05", bundle: resourceBundle)

    /// The "fx_scorch_01" asset catalog image resource.
    static let fxScorch01 = DeveloperToolsSupport.ImageResource(name: "fx_scorch_01", bundle: resourceBundle)

    /// The "fx_scorch_02" asset catalog image resource.
    static let fxScorch02 = DeveloperToolsSupport.ImageResource(name: "fx_scorch_02", bundle: resourceBundle)

    /// The "fx_scorch_03" asset catalog image resource.
    static let fxScorch03 = DeveloperToolsSupport.ImageResource(name: "fx_scorch_03", bundle: resourceBundle)

    /// The "fx_scratch_01" asset catalog image resource.
    static let fxScratch01 = DeveloperToolsSupport.ImageResource(name: "fx_scratch_01", bundle: resourceBundle)

    /// The "fx_slash_01" asset catalog image resource.
    static let fxSlash01 = DeveloperToolsSupport.ImageResource(name: "fx_slash_01", bundle: resourceBundle)

    /// The "fx_slash_02" asset catalog image resource.
    static let fxSlash02 = DeveloperToolsSupport.ImageResource(name: "fx_slash_02", bundle: resourceBundle)

    /// The "fx_slash_03" asset catalog image resource.
    static let fxSlash03 = DeveloperToolsSupport.ImageResource(name: "fx_slash_03", bundle: resourceBundle)

    /// The "fx_slash_04" asset catalog image resource.
    static let fxSlash04 = DeveloperToolsSupport.ImageResource(name: "fx_slash_04", bundle: resourceBundle)

    /// The "fx_smoke_01" asset catalog image resource.
    static let fxSmoke01 = DeveloperToolsSupport.ImageResource(name: "fx_smoke_01", bundle: resourceBundle)

    /// The "fx_smoke_02" asset catalog image resource.
    static let fxSmoke02 = DeveloperToolsSupport.ImageResource(name: "fx_smoke_02", bundle: resourceBundle)

    /// The "fx_smoke_03" asset catalog image resource.
    static let fxSmoke03 = DeveloperToolsSupport.ImageResource(name: "fx_smoke_03", bundle: resourceBundle)

    /// The "fx_smoke_04" asset catalog image resource.
    static let fxSmoke04 = DeveloperToolsSupport.ImageResource(name: "fx_smoke_04", bundle: resourceBundle)

    /// The "fx_smoke_05" asset catalog image resource.
    static let fxSmoke05 = DeveloperToolsSupport.ImageResource(name: "fx_smoke_05", bundle: resourceBundle)

    /// The "fx_smoke_06" asset catalog image resource.
    static let fxSmoke06 = DeveloperToolsSupport.ImageResource(name: "fx_smoke_06", bundle: resourceBundle)

    /// The "fx_smoke_07" asset catalog image resource.
    static let fxSmoke07 = DeveloperToolsSupport.ImageResource(name: "fx_smoke_07", bundle: resourceBundle)

    /// The "fx_smoke_08" asset catalog image resource.
    static let fxSmoke08 = DeveloperToolsSupport.ImageResource(name: "fx_smoke_08", bundle: resourceBundle)

    /// The "fx_smoke_09" asset catalog image resource.
    static let fxSmoke09 = DeveloperToolsSupport.ImageResource(name: "fx_smoke_09", bundle: resourceBundle)

    /// The "fx_smoke_10" asset catalog image resource.
    static let fxSmoke10 = DeveloperToolsSupport.ImageResource(name: "fx_smoke_10", bundle: resourceBundle)

    /// The "fx_spark_01" asset catalog image resource.
    static let fxSpark01 = DeveloperToolsSupport.ImageResource(name: "fx_spark_01", bundle: resourceBundle)

    /// The "fx_spark_02" asset catalog image resource.
    static let fxSpark02 = DeveloperToolsSupport.ImageResource(name: "fx_spark_02", bundle: resourceBundle)

    /// The "fx_spark_03" asset catalog image resource.
    static let fxSpark03 = DeveloperToolsSupport.ImageResource(name: "fx_spark_03", bundle: resourceBundle)

    /// The "fx_spark_04" asset catalog image resource.
    static let fxSpark04 = DeveloperToolsSupport.ImageResource(name: "fx_spark_04", bundle: resourceBundle)

    /// The "fx_spark_05" asset catalog image resource.
    static let fxSpark05 = DeveloperToolsSupport.ImageResource(name: "fx_spark_05", bundle: resourceBundle)

    /// The "fx_spark_06" asset catalog image resource.
    static let fxSpark06 = DeveloperToolsSupport.ImageResource(name: "fx_spark_06", bundle: resourceBundle)

    /// The "fx_spark_07" asset catalog image resource.
    static let fxSpark07 = DeveloperToolsSupport.ImageResource(name: "fx_spark_07", bundle: resourceBundle)

    /// The "fx_star_01" asset catalog image resource.
    static let fxStar01 = DeveloperToolsSupport.ImageResource(name: "fx_star_01", bundle: resourceBundle)

    /// The "fx_star_02" asset catalog image resource.
    static let fxStar02 = DeveloperToolsSupport.ImageResource(name: "fx_star_02", bundle: resourceBundle)

    /// The "fx_star_03" asset catalog image resource.
    static let fxStar03 = DeveloperToolsSupport.ImageResource(name: "fx_star_03", bundle: resourceBundle)

    /// The "fx_star_04" asset catalog image resource.
    static let fxStar04 = DeveloperToolsSupport.ImageResource(name: "fx_star_04", bundle: resourceBundle)

    /// The "fx_star_05" asset catalog image resource.
    static let fxStar05 = DeveloperToolsSupport.ImageResource(name: "fx_star_05", bundle: resourceBundle)

    /// The "fx_star_06" asset catalog image resource.
    static let fxStar06 = DeveloperToolsSupport.ImageResource(name: "fx_star_06", bundle: resourceBundle)

    /// The "fx_star_07" asset catalog image resource.
    static let fxStar07 = DeveloperToolsSupport.ImageResource(name: "fx_star_07", bundle: resourceBundle)

    /// The "fx_star_08" asset catalog image resource.
    static let fxStar08 = DeveloperToolsSupport.ImageResource(name: "fx_star_08", bundle: resourceBundle)

    /// The "fx_star_09" asset catalog image resource.
    static let fxStar09 = DeveloperToolsSupport.ImageResource(name: "fx_star_09", bundle: resourceBundle)

    /// The "fx_symbol_01" asset catalog image resource.
    static let fxSymbol01 = DeveloperToolsSupport.ImageResource(name: "fx_symbol_01", bundle: resourceBundle)

    /// The "fx_symbol_02" asset catalog image resource.
    static let fxSymbol02 = DeveloperToolsSupport.ImageResource(name: "fx_symbol_02", bundle: resourceBundle)

    /// The "fx_trace_01" asset catalog image resource.
    static let fxTrace01 = DeveloperToolsSupport.ImageResource(name: "fx_trace_01", bundle: resourceBundle)

    /// The "fx_trace_02" asset catalog image resource.
    static let fxTrace02 = DeveloperToolsSupport.ImageResource(name: "fx_trace_02", bundle: resourceBundle)

    /// The "fx_trace_03" asset catalog image resource.
    static let fxTrace03 = DeveloperToolsSupport.ImageResource(name: "fx_trace_03", bundle: resourceBundle)

    /// The "fx_trace_04" asset catalog image resource.
    static let fxTrace04 = DeveloperToolsSupport.ImageResource(name: "fx_trace_04", bundle: resourceBundle)

    /// The "fx_trace_05" asset catalog image resource.
    static let fxTrace05 = DeveloperToolsSupport.ImageResource(name: "fx_trace_05", bundle: resourceBundle)

    /// The "fx_trace_06" asset catalog image resource.
    static let fxTrace06 = DeveloperToolsSupport.ImageResource(name: "fx_trace_06", bundle: resourceBundle)

    /// The "fx_trace_07" asset catalog image resource.
    static let fxTrace07 = DeveloperToolsSupport.ImageResource(name: "fx_trace_07", bundle: resourceBundle)

    /// The "fx_twirl_01" asset catalog image resource.
    static let fxTwirl01 = DeveloperToolsSupport.ImageResource(name: "fx_twirl_01", bundle: resourceBundle)

    /// The "fx_twirl_02" asset catalog image resource.
    static let fxTwirl02 = DeveloperToolsSupport.ImageResource(name: "fx_twirl_02", bundle: resourceBundle)

    /// The "fx_twirl_03" asset catalog image resource.
    static let fxTwirl03 = DeveloperToolsSupport.ImageResource(name: "fx_twirl_03", bundle: resourceBundle)

    /// The "fx_window_01" asset catalog image resource.
    static let fxWindow01 = DeveloperToolsSupport.ImageResource(name: "fx_window_01", bundle: resourceBundle)

    /// The "fx_window_02" asset catalog image resource.
    static let fxWindow02 = DeveloperToolsSupport.ImageResource(name: "fx_window_02", bundle: resourceBundle)

    /// The "fx_window_03" asset catalog image resource.
    static let fxWindow03 = DeveloperToolsSupport.ImageResource(name: "fx_window_03", bundle: resourceBundle)

    /// The "fx_window_04" asset catalog image resource.
    static let fxWindow04 = DeveloperToolsSupport.ImageResource(name: "fx_window_04", bundle: resourceBundle)

    /// The "geode" asset catalog image resource.
    static let geode = DeveloperToolsSupport.ImageResource(name: "geode", bundle: resourceBundle)

    /// The "ghost" asset catalog image resource.
    static let ghost = DeveloperToolsSupport.ImageResource(name: "ghost", bundle: resourceBundle)

    /// The "gi_arrowDown" asset catalog image resource.
    static let giArrowDown = DeveloperToolsSupport.ImageResource(name: "gi_arrowDown", bundle: resourceBundle)

    /// The "gi_arrowDown_045d" asset catalog image resource.
    static let giArrowDown045D = DeveloperToolsSupport.ImageResource(name: "gi_arrowDown_045d", bundle: resourceBundle)

    /// The "gi_arrowDown_29b5" asset catalog image resource.
    static let giArrowDown29B5 = DeveloperToolsSupport.ImageResource(name: "gi_arrowDown_29b5", bundle: resourceBundle)

    /// The "gi_arrowDown_b0ef" asset catalog image resource.
    static let giArrowDownB0Ef = DeveloperToolsSupport.ImageResource(name: "gi_arrowDown_b0ef", bundle: resourceBundle)

    /// The "gi_arrowLeft" asset catalog image resource.
    static let giArrowLeft = DeveloperToolsSupport.ImageResource(name: "gi_arrowLeft", bundle: resourceBundle)

    /// The "gi_arrowLeft_4db8" asset catalog image resource.
    static let giArrowLeft4Db8 = DeveloperToolsSupport.ImageResource(name: "gi_arrowLeft_4db8", bundle: resourceBundle)

    /// The "gi_arrowLeft_7d03" asset catalog image resource.
    static let giArrowLeft7D03 = DeveloperToolsSupport.ImageResource(name: "gi_arrowLeft_7d03", bundle: resourceBundle)

    /// The "gi_arrowLeft_8cc2" asset catalog image resource.
    static let giArrowLeft8Cc2 = DeveloperToolsSupport.ImageResource(name: "gi_arrowLeft_8cc2", bundle: resourceBundle)

    /// The "gi_arrowRight" asset catalog image resource.
    static let giArrowRight = DeveloperToolsSupport.ImageResource(name: "gi_arrowRight", bundle: resourceBundle)

    /// The "gi_arrowRight_0b7a" asset catalog image resource.
    static let giArrowRight0B7A = DeveloperToolsSupport.ImageResource(name: "gi_arrowRight_0b7a", bundle: resourceBundle)

    /// The "gi_arrowRight_39fc" asset catalog image resource.
    static let giArrowRight39Fc = DeveloperToolsSupport.ImageResource(name: "gi_arrowRight_39fc", bundle: resourceBundle)

    /// The "gi_arrowRight_5bc1" asset catalog image resource.
    static let giArrowRight5Bc1 = DeveloperToolsSupport.ImageResource(name: "gi_arrowRight_5bc1", bundle: resourceBundle)

    /// The "gi_arrowUp" asset catalog image resource.
    static let giArrowUp = DeveloperToolsSupport.ImageResource(name: "gi_arrowUp", bundle: resourceBundle)

    /// The "gi_arrowUp_4373" asset catalog image resource.
    static let giArrowUp4373 = DeveloperToolsSupport.ImageResource(name: "gi_arrowUp_4373", bundle: resourceBundle)

    /// The "gi_arrowUp_530f" asset catalog image resource.
    static let giArrowUp530F = DeveloperToolsSupport.ImageResource(name: "gi_arrowUp_530f", bundle: resourceBundle)

    /// The "gi_arrowUp_f7b4" asset catalog image resource.
    static let giArrowUpF7B4 = DeveloperToolsSupport.ImageResource(name: "gi_arrowUp_f7b4", bundle: resourceBundle)

    /// The "gi_audioOff" asset catalog image resource.
    static let giAudioOff = DeveloperToolsSupport.ImageResource(name: "gi_audioOff", bundle: resourceBundle)

    /// The "gi_audioOff_b75b" asset catalog image resource.
    static let giAudioOffB75B = DeveloperToolsSupport.ImageResource(name: "gi_audioOff_b75b", bundle: resourceBundle)

    /// The "gi_audioOff_c188" asset catalog image resource.
    static let giAudioOffC188 = DeveloperToolsSupport.ImageResource(name: "gi_audioOff_c188", bundle: resourceBundle)

    /// The "gi_audioOff_c938" asset catalog image resource.
    static let giAudioOffC938 = DeveloperToolsSupport.ImageResource(name: "gi_audioOff_c938", bundle: resourceBundle)

    /// The "gi_audioOn" asset catalog image resource.
    static let giAudioOn = DeveloperToolsSupport.ImageResource(name: "gi_audioOn", bundle: resourceBundle)

    /// The "gi_audioOn_82f7" asset catalog image resource.
    static let giAudioOn82F7 = DeveloperToolsSupport.ImageResource(name: "gi_audioOn_82f7", bundle: resourceBundle)

    /// The "gi_audioOn_ab65" asset catalog image resource.
    static let giAudioOnAb65 = DeveloperToolsSupport.ImageResource(name: "gi_audioOn_ab65", bundle: resourceBundle)

    /// The "gi_audioOn_deeb" asset catalog image resource.
    static let giAudioOnDeeb = DeveloperToolsSupport.ImageResource(name: "gi_audioOn_deeb", bundle: resourceBundle)

    /// The "gi_backward" asset catalog image resource.
    static let giBackward = DeveloperToolsSupport.ImageResource(name: "gi_backward", bundle: resourceBundle)

    /// The "gi_barsHorizontal" asset catalog image resource.
    static let giBarsHorizontal = DeveloperToolsSupport.ImageResource(name: "gi_barsHorizontal", bundle: resourceBundle)

    /// The "gi_barsHorizontal_76e0" asset catalog image resource.
    static let giBarsHorizontal76E0 = DeveloperToolsSupport.ImageResource(name: "gi_barsHorizontal_76e0", bundle: resourceBundle)

    /// The "gi_barsHorizontal_cb3e" asset catalog image resource.
    static let giBarsHorizontalCb3E = DeveloperToolsSupport.ImageResource(name: "gi_barsHorizontal_cb3e", bundle: resourceBundle)

    /// The "gi_barsVertical" asset catalog image resource.
    static let giBarsVertical = DeveloperToolsSupport.ImageResource(name: "gi_barsVertical", bundle: resourceBundle)

    /// The "gi_barsVertical_0346" asset catalog image resource.
    static let giBarsVertical0346 = DeveloperToolsSupport.ImageResource(name: "gi_barsVertical_0346", bundle: resourceBundle)

    /// The "gi_barsVertical_45b9" asset catalog image resource.
    static let giBarsVertical45B9 = DeveloperToolsSupport.ImageResource(name: "gi_barsVertical_45b9", bundle: resourceBundle)

    /// The "gi_barsVertical_ecab" asset catalog image resource.
    static let giBarsVerticalEcab = DeveloperToolsSupport.ImageResource(name: "gi_barsVertical_ecab", bundle: resourceBundle)

    /// The "gi_basket" asset catalog image resource.
    static let giBasket = DeveloperToolsSupport.ImageResource(name: "gi_basket", bundle: resourceBundle)

    /// The "gi_basket_7bb8" asset catalog image resource.
    static let giBasket7Bb8 = DeveloperToolsSupport.ImageResource(name: "gi_basket_7bb8", bundle: resourceBundle)

    /// The "gi_button1" asset catalog image resource.
    static let giButton1 = DeveloperToolsSupport.ImageResource(name: "gi_button1", bundle: resourceBundle)

    /// The "gi_button1_2e4b" asset catalog image resource.
    static let giButton12E4B = DeveloperToolsSupport.ImageResource(name: "gi_button1_2e4b", bundle: resourceBundle)

    /// The "gi_button1_996c" asset catalog image resource.
    static let giButton1996C = DeveloperToolsSupport.ImageResource(name: "gi_button1_996c", bundle: resourceBundle)

    /// The "gi_button1_ffd1" asset catalog image resource.
    static let giButton1Ffd1 = DeveloperToolsSupport.ImageResource(name: "gi_button1_ffd1", bundle: resourceBundle)

    /// The "gi_button2" asset catalog image resource.
    static let giButton2 = DeveloperToolsSupport.ImageResource(name: "gi_button2", bundle: resourceBundle)

    /// The "gi_button2_3b3e" asset catalog image resource.
    static let giButton23B3E = DeveloperToolsSupport.ImageResource(name: "gi_button2_3b3e", bundle: resourceBundle)

    /// The "gi_button2_8319" asset catalog image resource.
    static let giButton28319 = DeveloperToolsSupport.ImageResource(name: "gi_button2_8319", bundle: resourceBundle)

    /// The "gi_button2_9370" asset catalog image resource.
    static let giButton29370 = DeveloperToolsSupport.ImageResource(name: "gi_button2_9370", bundle: resourceBundle)

    /// The "gi_button3" asset catalog image resource.
    static let giButton3 = DeveloperToolsSupport.ImageResource(name: "gi_button3", bundle: resourceBundle)

    /// The "gi_button3_5f77" asset catalog image resource.
    static let giButton35F77 = DeveloperToolsSupport.ImageResource(name: "gi_button3_5f77", bundle: resourceBundle)

    /// The "gi_button3_a53a" asset catalog image resource.
    static let giButton3A53A = DeveloperToolsSupport.ImageResource(name: "gi_button3_a53a", bundle: resourceBundle)

    /// The "gi_button3_e5dc" asset catalog image resource.
    static let giButton3E5Dc = DeveloperToolsSupport.ImageResource(name: "gi_button3_e5dc", bundle: resourceBundle)

    /// The "gi_buttonA" asset catalog image resource.
    static let giButtonA = DeveloperToolsSupport.ImageResource(name: "gi_buttonA", bundle: resourceBundle)

    /// The "gi_buttonA_3d0f" asset catalog image resource.
    static let giButtonA3D0F = DeveloperToolsSupport.ImageResource(name: "gi_buttonA_3d0f", bundle: resourceBundle)

    /// The "gi_buttonA_c26a" asset catalog image resource.
    static let giButtonAC26A = DeveloperToolsSupport.ImageResource(name: "gi_buttonA_c26a", bundle: resourceBundle)

    /// The "gi_buttonA_d4b1" asset catalog image resource.
    static let giButtonAD4B1 = DeveloperToolsSupport.ImageResource(name: "gi_buttonA_d4b1", bundle: resourceBundle)

    /// The "gi_buttonB" asset catalog image resource.
    static let giButtonB = DeveloperToolsSupport.ImageResource(name: "gi_buttonB", bundle: resourceBundle)

    /// The "gi_buttonB_3d96" asset catalog image resource.
    static let giButtonB3D96 = DeveloperToolsSupport.ImageResource(name: "gi_buttonB_3d96", bundle: resourceBundle)

    /// The "gi_buttonB_7ff4" asset catalog image resource.
    static let giButtonB7Ff4 = DeveloperToolsSupport.ImageResource(name: "gi_buttonB_7ff4", bundle: resourceBundle)

    /// The "gi_buttonB_a8a9" asset catalog image resource.
    static let giButtonBA8A9 = DeveloperToolsSupport.ImageResource(name: "gi_buttonB_a8a9", bundle: resourceBundle)

    /// The "gi_buttonL" asset catalog image resource.
    static let giButtonL = DeveloperToolsSupport.ImageResource(name: "gi_buttonL", bundle: resourceBundle)

    /// The "gi_buttonL1" asset catalog image resource.
    static let giButtonL1 = DeveloperToolsSupport.ImageResource(name: "gi_buttonL1", bundle: resourceBundle)

    /// The "gi_buttonL1_1241" asset catalog image resource.
    static let giButtonL11241 = DeveloperToolsSupport.ImageResource(name: "gi_buttonL1_1241", bundle: resourceBundle)

    /// The "gi_buttonL1_171f" asset catalog image resource.
    static let giButtonL1171F = DeveloperToolsSupport.ImageResource(name: "gi_buttonL1_171f", bundle: resourceBundle)

    /// The "gi_buttonL1_34bf" asset catalog image resource.
    static let giButtonL134Bf = DeveloperToolsSupport.ImageResource(name: "gi_buttonL1_34bf", bundle: resourceBundle)

    /// The "gi_buttonL2" asset catalog image resource.
    static let giButtonL2 = DeveloperToolsSupport.ImageResource(name: "gi_buttonL2", bundle: resourceBundle)

    /// The "gi_buttonL2_0c96" asset catalog image resource.
    static let giButtonL20C96 = DeveloperToolsSupport.ImageResource(name: "gi_buttonL2_0c96", bundle: resourceBundle)

    /// The "gi_buttonL2_1711" asset catalog image resource.
    static let giButtonL21711 = DeveloperToolsSupport.ImageResource(name: "gi_buttonL2_1711", bundle: resourceBundle)

    /// The "gi_buttonL2_2798" asset catalog image resource.
    static let giButtonL22798 = DeveloperToolsSupport.ImageResource(name: "gi_buttonL2_2798", bundle: resourceBundle)

    /// The "gi_buttonL_10b7" asset catalog image resource.
    static let giButtonL10B7 = DeveloperToolsSupport.ImageResource(name: "gi_buttonL_10b7", bundle: resourceBundle)

    /// The "gi_buttonL_240f" asset catalog image resource.
    static let giButtonL240F = DeveloperToolsSupport.ImageResource(name: "gi_buttonL_240f", bundle: resourceBundle)

    /// The "gi_buttonL_e66d" asset catalog image resource.
    static let giButtonLE66D = DeveloperToolsSupport.ImageResource(name: "gi_buttonL_e66d", bundle: resourceBundle)

    /// The "gi_buttonR" asset catalog image resource.
    static let giButtonR = DeveloperToolsSupport.ImageResource(name: "gi_buttonR", bundle: resourceBundle)

    /// The "gi_buttonR1" asset catalog image resource.
    static let giButtonR1 = DeveloperToolsSupport.ImageResource(name: "gi_buttonR1", bundle: resourceBundle)

    /// The "gi_buttonR1_8365" asset catalog image resource.
    static let giButtonR18365 = DeveloperToolsSupport.ImageResource(name: "gi_buttonR1_8365", bundle: resourceBundle)

    /// The "gi_buttonR1_b39d" asset catalog image resource.
    static let giButtonR1B39D = DeveloperToolsSupport.ImageResource(name: "gi_buttonR1_b39d", bundle: resourceBundle)

    /// The "gi_buttonR2" asset catalog image resource.
    static let giButtonR2 = DeveloperToolsSupport.ImageResource(name: "gi_buttonR2", bundle: resourceBundle)

    /// The "gi_buttonR2_3a5c" asset catalog image resource.
    static let giButtonR23A5C = DeveloperToolsSupport.ImageResource(name: "gi_buttonR2_3a5c", bundle: resourceBundle)

    /// The "gi_buttonR2_854a" asset catalog image resource.
    static let giButtonR2854A = DeveloperToolsSupport.ImageResource(name: "gi_buttonR2_854a", bundle: resourceBundle)

    /// The "gi_buttonR2_9c02" asset catalog image resource.
    static let giButtonR29C02 = DeveloperToolsSupport.ImageResource(name: "gi_buttonR2_9c02", bundle: resourceBundle)

    /// The "gi_buttonR_211d" asset catalog image resource.
    static let giButtonR211D = DeveloperToolsSupport.ImageResource(name: "gi_buttonR_211d", bundle: resourceBundle)

    /// The "gi_buttonR_3524" asset catalog image resource.
    static let giButtonR3524 = DeveloperToolsSupport.ImageResource(name: "gi_buttonR_3524", bundle: resourceBundle)

    /// The "gi_buttonR_7a83" asset catalog image resource.
    static let giButtonR7A83 = DeveloperToolsSupport.ImageResource(name: "gi_buttonR_7a83", bundle: resourceBundle)

    /// The "gi_buttonSelect" asset catalog image resource.
    static let giButtonSelect = DeveloperToolsSupport.ImageResource(name: "gi_buttonSelect", bundle: resourceBundle)

    /// The "gi_buttonSelect_0db4" asset catalog image resource.
    static let giButtonSelect0Db4 = DeveloperToolsSupport.ImageResource(name: "gi_buttonSelect_0db4", bundle: resourceBundle)

    /// The "gi_buttonSelect_6c32" asset catalog image resource.
    static let giButtonSelect6C32 = DeveloperToolsSupport.ImageResource(name: "gi_buttonSelect_6c32", bundle: resourceBundle)

    /// The "gi_buttonSelect_cf40" asset catalog image resource.
    static let giButtonSelectCf40 = DeveloperToolsSupport.ImageResource(name: "gi_buttonSelect_cf40", bundle: resourceBundle)

    /// The "gi_buttonStart" asset catalog image resource.
    static let giButtonStart = DeveloperToolsSupport.ImageResource(name: "gi_buttonStart", bundle: resourceBundle)

    /// The "gi_buttonStart_8e2c" asset catalog image resource.
    static let giButtonStart8E2C = DeveloperToolsSupport.ImageResource(name: "gi_buttonStart_8e2c", bundle: resourceBundle)

    /// The "gi_buttonStart_ce3a" asset catalog image resource.
    static let giButtonStartCe3A = DeveloperToolsSupport.ImageResource(name: "gi_buttonStart_ce3a", bundle: resourceBundle)

    /// The "gi_buttonX" asset catalog image resource.
    static let giButtonX = DeveloperToolsSupport.ImageResource(name: "gi_buttonX", bundle: resourceBundle)

    /// The "gi_buttonX_07fc" asset catalog image resource.
    static let giButtonX07Fc = DeveloperToolsSupport.ImageResource(name: "gi_buttonX_07fc", bundle: resourceBundle)

    /// The "gi_buttonX_086a" asset catalog image resource.
    static let giButtonX086A = DeveloperToolsSupport.ImageResource(name: "gi_buttonX_086a", bundle: resourceBundle)

    /// The "gi_buttonX_8e99" asset catalog image resource.
    static let giButtonX8E99 = DeveloperToolsSupport.ImageResource(name: "gi_buttonX_8e99", bundle: resourceBundle)

    /// The "gi_buttonY" asset catalog image resource.
    static let giButtonY = DeveloperToolsSupport.ImageResource(name: "gi_buttonY", bundle: resourceBundle)

    /// The "gi_buttonY_0afe" asset catalog image resource.
    static let giButtonY0Afe = DeveloperToolsSupport.ImageResource(name: "gi_buttonY_0afe", bundle: resourceBundle)

    /// The "gi_buttonY_294a" asset catalog image resource.
    static let giButtonY294A = DeveloperToolsSupport.ImageResource(name: "gi_buttonY_294a", bundle: resourceBundle)

    /// The "gi_buttonY_4926" asset catalog image resource.
    static let giButtonY4926 = DeveloperToolsSupport.ImageResource(name: "gi_buttonY_4926", bundle: resourceBundle)

    /// The "gi_cart" asset catalog image resource.
    static let giCart = DeveloperToolsSupport.ImageResource(name: "gi_cart", bundle: resourceBundle)

    /// The "gi_cart_e4b3" asset catalog image resource.
    static let giCartE4B3 = DeveloperToolsSupport.ImageResource(name: "gi_cart_e4b3", bundle: resourceBundle)

    /// The "gi_checkmark" asset catalog image resource.
    static let giCheckmark = DeveloperToolsSupport.ImageResource(name: "gi_checkmark", bundle: resourceBundle)

    /// The "gi_checkmark_6cc7" asset catalog image resource.
    static let giCheckmark6Cc7 = DeveloperToolsSupport.ImageResource(name: "gi_checkmark_6cc7", bundle: resourceBundle)

    /// The "gi_checkmark_9a53" asset catalog image resource.
    static let giCheckmark9A53 = DeveloperToolsSupport.ImageResource(name: "gi_checkmark_9a53", bundle: resourceBundle)

    /// The "gi_checkmark_b016" asset catalog image resource.
    static let giCheckmarkB016 = DeveloperToolsSupport.ImageResource(name: "gi_checkmark_b016", bundle: resourceBundle)

    /// The "gi_contrast" asset catalog image resource.
    static let giContrast = DeveloperToolsSupport.ImageResource(name: "gi_contrast", bundle: resourceBundle)

    /// The "gi_contrast_3f82" asset catalog image resource.
    static let giContrast3F82 = DeveloperToolsSupport.ImageResource(name: "gi_contrast_3f82", bundle: resourceBundle)

    /// The "gi_contrast_8319" asset catalog image resource.
    static let giContrast8319 = DeveloperToolsSupport.ImageResource(name: "gi_contrast_8319", bundle: resourceBundle)

    /// The "gi_contrast_e303" asset catalog image resource.
    static let giContrastE303 = DeveloperToolsSupport.ImageResource(name: "gi_contrast_e303", bundle: resourceBundle)

    /// The "gi_cross" asset catalog image resource.
    static let giCross = DeveloperToolsSupport.ImageResource(name: "gi_cross", bundle: resourceBundle)

    /// The "gi_cross_046c" asset catalog image resource.
    static let giCross046C = DeveloperToolsSupport.ImageResource(name: "gi_cross_046c", bundle: resourceBundle)

    /// The "gi_cross_46f2" asset catalog image resource.
    static let giCross46F2 = DeveloperToolsSupport.ImageResource(name: "gi_cross_46f2", bundle: resourceBundle)

    /// The "gi_cross_bc72" asset catalog image resource.
    static let giCrossBc72 = DeveloperToolsSupport.ImageResource(name: "gi_cross_bc72", bundle: resourceBundle)

    /// The "gi_door" asset catalog image resource.
    static let giDoor = DeveloperToolsSupport.ImageResource(name: "gi_door", bundle: resourceBundle)

    /// The "gi_door_e22e" asset catalog image resource.
    static let giDoorE22E = DeveloperToolsSupport.ImageResource(name: "gi_door_e22e", bundle: resourceBundle)

    /// The "gi_down" asset catalog image resource.
    static let giDown = DeveloperToolsSupport.ImageResource(name: "gi_down", bundle: resourceBundle)

    /// The "gi_downLeft" asset catalog image resource.
    static let giDownLeft = DeveloperToolsSupport.ImageResource(name: "gi_downLeft", bundle: resourceBundle)

    /// The "gi_downLeft_2346" asset catalog image resource.
    static let giDownLeft2346 = DeveloperToolsSupport.ImageResource(name: "gi_downLeft_2346", bundle: resourceBundle)

    /// The "gi_downLeft_72eb" asset catalog image resource.
    static let giDownLeft72Eb = DeveloperToolsSupport.ImageResource(name: "gi_downLeft_72eb", bundle: resourceBundle)

    /// The "gi_downLeft_dfac" asset catalog image resource.
    static let giDownLeftDfac = DeveloperToolsSupport.ImageResource(name: "gi_downLeft_dfac", bundle: resourceBundle)

    /// The "gi_downRight" asset catalog image resource.
    static let giDownRight = DeveloperToolsSupport.ImageResource(name: "gi_downRight", bundle: resourceBundle)

    /// The "gi_downRight_6ad6" asset catalog image resource.
    static let giDownRight6Ad6 = DeveloperToolsSupport.ImageResource(name: "gi_downRight_6ad6", bundle: resourceBundle)

    /// The "gi_downRight_cc53" asset catalog image resource.
    static let giDownRightCc53 = DeveloperToolsSupport.ImageResource(name: "gi_downRight_cc53", bundle: resourceBundle)

    /// The "gi_downRight_ccae" asset catalog image resource.
    static let giDownRightCcae = DeveloperToolsSupport.ImageResource(name: "gi_downRight_ccae", bundle: resourceBundle)

    /// The "gi_down_2ebc" asset catalog image resource.
    static let giDown2Ebc = DeveloperToolsSupport.ImageResource(name: "gi_down_2ebc", bundle: resourceBundle)

    /// The "gi_down_669d" asset catalog image resource.
    static let giDown669D = DeveloperToolsSupport.ImageResource(name: "gi_down_669d", bundle: resourceBundle)

    /// The "gi_down_d64d" asset catalog image resource.
    static let giDownD64D = DeveloperToolsSupport.ImageResource(name: "gi_down_d64d", bundle: resourceBundle)

    /// The "gi_exclamation" asset catalog image resource.
    static let giExclamation = DeveloperToolsSupport.ImageResource(name: "gi_exclamation", bundle: resourceBundle)

    /// The "gi_exclamation_812a" asset catalog image resource.
    static let giExclamation812A = DeveloperToolsSupport.ImageResource(name: "gi_exclamation_812a", bundle: resourceBundle)

    /// The "gi_exclamation_a3dd" asset catalog image resource.
    static let giExclamationA3Dd = DeveloperToolsSupport.ImageResource(name: "gi_exclamation_a3dd", bundle: resourceBundle)

    /// The "gi_exclamation_e014" asset catalog image resource.
    static let giExclamationE014 = DeveloperToolsSupport.ImageResource(name: "gi_exclamation_e014", bundle: resourceBundle)

    /// The "gi_exit" asset catalog image resource.
    static let giExit = DeveloperToolsSupport.ImageResource(name: "gi_exit", bundle: resourceBundle)

    /// The "gi_exitLeft" asset catalog image resource.
    static let giExitLeft = DeveloperToolsSupport.ImageResource(name: "gi_exitLeft", bundle: resourceBundle)

    /// The "gi_exitLeft_1a02" asset catalog image resource.
    static let giExitLeft1A02 = DeveloperToolsSupport.ImageResource(name: "gi_exitLeft_1a02", bundle: resourceBundle)

    /// The "gi_exitLeft_65e8" asset catalog image resource.
    static let giExitLeft65E8 = DeveloperToolsSupport.ImageResource(name: "gi_exitLeft_65e8", bundle: resourceBundle)

    /// The "gi_exitLeft_7b69" asset catalog image resource.
    static let giExitLeft7B69 = DeveloperToolsSupport.ImageResource(name: "gi_exitLeft_7b69", bundle: resourceBundle)

    /// The "gi_exitRight" asset catalog image resource.
    static let giExitRight = DeveloperToolsSupport.ImageResource(name: "gi_exitRight", bundle: resourceBundle)

    /// The "gi_exitRight_68f9" asset catalog image resource.
    static let giExitRight68F9 = DeveloperToolsSupport.ImageResource(name: "gi_exitRight_68f9", bundle: resourceBundle)

    /// The "gi_exitRight_823f" asset catalog image resource.
    static let giExitRight823F = DeveloperToolsSupport.ImageResource(name: "gi_exitRight_823f", bundle: resourceBundle)

    /// The "gi_exitRight_f73f" asset catalog image resource.
    static let giExitRightF73F = DeveloperToolsSupport.ImageResource(name: "gi_exitRight_f73f", bundle: resourceBundle)

    /// The "gi_exit_5816" asset catalog image resource.
    static let giExit5816 = DeveloperToolsSupport.ImageResource(name: "gi_exit_5816", bundle: resourceBundle)

    /// The "gi_export" asset catalog image resource.
    static let giExport = DeveloperToolsSupport.ImageResource(name: "gi_export", bundle: resourceBundle)

    /// The "gi_export_c4a3" asset catalog image resource.
    static let giExportC4A3 = DeveloperToolsSupport.ImageResource(name: "gi_export_c4a3", bundle: resourceBundle)

    /// The "gi_export_c640" asset catalog image resource.
    static let giExportC640 = DeveloperToolsSupport.ImageResource(name: "gi_export_c640", bundle: resourceBundle)

    /// The "gi_export_fd40" asset catalog image resource.
    static let giExportFd40 = DeveloperToolsSupport.ImageResource(name: "gi_export_fd40", bundle: resourceBundle)

    /// The "gi_fastForward" asset catalog image resource.
    static let giFastForward = DeveloperToolsSupport.ImageResource(name: "gi_fastForward", bundle: resourceBundle)

    /// The "gi_fastForward_05b1" asset catalog image resource.
    static let giFastForward05B1 = DeveloperToolsSupport.ImageResource(name: "gi_fastForward_05b1", bundle: resourceBundle)

    /// The "gi_fastForward_58aa" asset catalog image resource.
    static let giFastForward58Aa = DeveloperToolsSupport.ImageResource(name: "gi_fastForward_58aa", bundle: resourceBundle)

    /// The "gi_fastForward_c7be" asset catalog image resource.
    static let giFastForwardC7Be = DeveloperToolsSupport.ImageResource(name: "gi_fastForward_c7be", bundle: resourceBundle)

    /// The "gi_film" asset catalog image resource.
    static let giFilm = DeveloperToolsSupport.ImageResource(name: "gi_film", bundle: resourceBundle)

    /// The "gi_film_1db9" asset catalog image resource.
    static let giFilm1Db9 = DeveloperToolsSupport.ImageResource(name: "gi_film_1db9", bundle: resourceBundle)

    /// The "gi_forward" asset catalog image resource.
    static let giForward = DeveloperToolsSupport.ImageResource(name: "gi_forward", bundle: resourceBundle)

    /// The "gi_forward_b637" asset catalog image resource.
    static let giForwardB637 = DeveloperToolsSupport.ImageResource(name: "gi_forward_b637", bundle: resourceBundle)

    /// The "gi_gamepad" asset catalog image resource.
    static let giGamepad = DeveloperToolsSupport.ImageResource(name: "gi_gamepad", bundle: resourceBundle)

    /// The "gi_gamepad1" asset catalog image resource.
    static let giGamepad1 = DeveloperToolsSupport.ImageResource(name: "gi_gamepad1", bundle: resourceBundle)

    /// The "gi_gamepad1_2c9a" asset catalog image resource.
    static let giGamepad12C9A = DeveloperToolsSupport.ImageResource(name: "gi_gamepad1_2c9a", bundle: resourceBundle)

    /// The "gi_gamepad1_51b8" asset catalog image resource.
    static let giGamepad151B8 = DeveloperToolsSupport.ImageResource(name: "gi_gamepad1_51b8", bundle: resourceBundle)

    /// The "gi_gamepad1_5346" asset catalog image resource.
    static let giGamepad15346 = DeveloperToolsSupport.ImageResource(name: "gi_gamepad1_5346", bundle: resourceBundle)

    /// The "gi_gamepad2" asset catalog image resource.
    static let giGamepad2 = DeveloperToolsSupport.ImageResource(name: "gi_gamepad2", bundle: resourceBundle)

    /// The "gi_gamepad2_61ed" asset catalog image resource.
    static let giGamepad261Ed = DeveloperToolsSupport.ImageResource(name: "gi_gamepad2_61ed", bundle: resourceBundle)

    /// The "gi_gamepad2_7b12" asset catalog image resource.
    static let giGamepad27B12 = DeveloperToolsSupport.ImageResource(name: "gi_gamepad2_7b12", bundle: resourceBundle)

    /// The "gi_gamepad2_b87d" asset catalog image resource.
    static let giGamepad2B87D = DeveloperToolsSupport.ImageResource(name: "gi_gamepad2_b87d", bundle: resourceBundle)

    /// The "gi_gamepad3" asset catalog image resource.
    static let giGamepad3 = DeveloperToolsSupport.ImageResource(name: "gi_gamepad3", bundle: resourceBundle)

    /// The "gi_gamepad3_6bdc" asset catalog image resource.
    static let giGamepad36Bdc = DeveloperToolsSupport.ImageResource(name: "gi_gamepad3_6bdc", bundle: resourceBundle)

    /// The "gi_gamepad3_99e9" asset catalog image resource.
    static let giGamepad399E9 = DeveloperToolsSupport.ImageResource(name: "gi_gamepad3_99e9", bundle: resourceBundle)

    /// The "gi_gamepad3_cc20" asset catalog image resource.
    static let giGamepad3Cc20 = DeveloperToolsSupport.ImageResource(name: "gi_gamepad3_cc20", bundle: resourceBundle)

    /// The "gi_gamepad4" asset catalog image resource.
    static let giGamepad4 = DeveloperToolsSupport.ImageResource(name: "gi_gamepad4", bundle: resourceBundle)

    /// The "gi_gamepad4_1831" asset catalog image resource.
    static let giGamepad41831 = DeveloperToolsSupport.ImageResource(name: "gi_gamepad4_1831", bundle: resourceBundle)

    /// The "gi_gamepad4_7c24" asset catalog image resource.
    static let giGamepad47C24 = DeveloperToolsSupport.ImageResource(name: "gi_gamepad4_7c24", bundle: resourceBundle)

    /// The "gi_gamepad4_b7c7" asset catalog image resource.
    static let giGamepad4B7C7 = DeveloperToolsSupport.ImageResource(name: "gi_gamepad4_b7c7", bundle: resourceBundle)

    /// The "gi_gamepad_6fec" asset catalog image resource.
    static let giGamepad6Fec = DeveloperToolsSupport.ImageResource(name: "gi_gamepad_6fec", bundle: resourceBundle)

    /// The "gi_gamepad_9fee" asset catalog image resource.
    static let giGamepad9Fee = DeveloperToolsSupport.ImageResource(name: "gi_gamepad_9fee", bundle: resourceBundle)

    /// The "gi_gamepad_bbde" asset catalog image resource.
    static let giGamepadBbde = DeveloperToolsSupport.ImageResource(name: "gi_gamepad_bbde", bundle: resourceBundle)

    /// The "gi_gear" asset catalog image resource.
    static let giGear = DeveloperToolsSupport.ImageResource(name: "gi_gear", bundle: resourceBundle)

    /// The "gi_gear_7c15" asset catalog image resource.
    static let giGear7C15 = DeveloperToolsSupport.ImageResource(name: "gi_gear_7c15", bundle: resourceBundle)

    /// The "gi_gear_86af" asset catalog image resource.
    static let giGear86Af = DeveloperToolsSupport.ImageResource(name: "gi_gear_86af", bundle: resourceBundle)

    /// The "gi_gear_ca71" asset catalog image resource.
    static let giGearCa71 = DeveloperToolsSupport.ImageResource(name: "gi_gear_ca71", bundle: resourceBundle)

    /// The "gi_home" asset catalog image resource.
    static let giHome = DeveloperToolsSupport.ImageResource(name: "gi_home", bundle: resourceBundle)

    /// The "gi_home_2610" asset catalog image resource.
    static let giHome2610 = DeveloperToolsSupport.ImageResource(name: "gi_home_2610", bundle: resourceBundle)

    /// The "gi_home_4ad2" asset catalog image resource.
    static let giHome4Ad2 = DeveloperToolsSupport.ImageResource(name: "gi_home_4ad2", bundle: resourceBundle)

    /// The "gi_home_b14e" asset catalog image resource.
    static let giHomeB14E = DeveloperToolsSupport.ImageResource(name: "gi_home_b14e", bundle: resourceBundle)

    /// The "gi_import" asset catalog image resource.
    static let giImport = DeveloperToolsSupport.ImageResource(name: "gi_import", bundle: resourceBundle)

    /// The "gi_import_4e6c" asset catalog image resource.
    static let giImport4E6C = DeveloperToolsSupport.ImageResource(name: "gi_import_4e6c", bundle: resourceBundle)

    /// The "gi_import_9e14" asset catalog image resource.
    static let giImport9E14 = DeveloperToolsSupport.ImageResource(name: "gi_import_9e14", bundle: resourceBundle)

    /// The "gi_import_e464" asset catalog image resource.
    static let giImportE464 = DeveloperToolsSupport.ImageResource(name: "gi_import_e464", bundle: resourceBundle)

    /// The "gi_information" asset catalog image resource.
    static let giInformation = DeveloperToolsSupport.ImageResource(name: "gi_information", bundle: resourceBundle)

    /// The "gi_information_4847" asset catalog image resource.
    static let giInformation4847 = DeveloperToolsSupport.ImageResource(name: "gi_information_4847", bundle: resourceBundle)

    /// The "gi_information_6292" asset catalog image resource.
    static let giInformation6292 = DeveloperToolsSupport.ImageResource(name: "gi_information_6292", bundle: resourceBundle)

    /// The "gi_information_cc87" asset catalog image resource.
    static let giInformationCc87 = DeveloperToolsSupport.ImageResource(name: "gi_information_cc87", bundle: resourceBundle)

    /// The "gi_joystick" asset catalog image resource.
    static let giJoystick = DeveloperToolsSupport.ImageResource(name: "gi_joystick", bundle: resourceBundle)

    /// The "gi_joystickLeft" asset catalog image resource.
    static let giJoystickLeft = DeveloperToolsSupport.ImageResource(name: "gi_joystickLeft", bundle: resourceBundle)

    /// The "gi_joystickLeft_3acb" asset catalog image resource.
    static let giJoystickLeft3Acb = DeveloperToolsSupport.ImageResource(name: "gi_joystickLeft_3acb", bundle: resourceBundle)

    /// The "gi_joystickLeft_b912" asset catalog image resource.
    static let giJoystickLeftB912 = DeveloperToolsSupport.ImageResource(name: "gi_joystickLeft_b912", bundle: resourceBundle)

    /// The "gi_joystickLeft_f3be" asset catalog image resource.
    static let giJoystickLeftF3Be = DeveloperToolsSupport.ImageResource(name: "gi_joystickLeft_f3be", bundle: resourceBundle)

    /// The "gi_joystickRight" asset catalog image resource.
    static let giJoystickRight = DeveloperToolsSupport.ImageResource(name: "gi_joystickRight", bundle: resourceBundle)

    /// The "gi_joystickRight_0fd6" asset catalog image resource.
    static let giJoystickRight0Fd6 = DeveloperToolsSupport.ImageResource(name: "gi_joystickRight_0fd6", bundle: resourceBundle)

    /// The "gi_joystickRight_a4c7" asset catalog image resource.
    static let giJoystickRightA4C7 = DeveloperToolsSupport.ImageResource(name: "gi_joystickRight_a4c7", bundle: resourceBundle)

    /// The "gi_joystickRight_a5c2" asset catalog image resource.
    static let giJoystickRightA5C2 = DeveloperToolsSupport.ImageResource(name: "gi_joystickRight_a5c2", bundle: resourceBundle)

    /// The "gi_joystickUp" asset catalog image resource.
    static let giJoystickUp = DeveloperToolsSupport.ImageResource(name: "gi_joystickUp", bundle: resourceBundle)

    /// The "gi_joystickUp_1f6f" asset catalog image resource.
    static let giJoystickUp1F6F = DeveloperToolsSupport.ImageResource(name: "gi_joystickUp_1f6f", bundle: resourceBundle)

    /// The "gi_joystickUp_c31c" asset catalog image resource.
    static let giJoystickUpC31C = DeveloperToolsSupport.ImageResource(name: "gi_joystickUp_c31c", bundle: resourceBundle)

    /// The "gi_joystick_3353" asset catalog image resource.
    static let giJoystick3353 = DeveloperToolsSupport.ImageResource(name: "gi_joystick_3353", bundle: resourceBundle)

    /// The "gi_joystick_53a1" asset catalog image resource.
    static let giJoystick53A1 = DeveloperToolsSupport.ImageResource(name: "gi_joystick_53a1", bundle: resourceBundle)

    /// The "gi_joystick_eca0" asset catalog image resource.
    static let giJoystickEca0 = DeveloperToolsSupport.ImageResource(name: "gi_joystick_eca0", bundle: resourceBundle)

    /// The "gi_larger" asset catalog image resource.
    static let giLarger = DeveloperToolsSupport.ImageResource(name: "gi_larger", bundle: resourceBundle)

    /// The "gi_larger_28a7" asset catalog image resource.
    static let giLarger28A7 = DeveloperToolsSupport.ImageResource(name: "gi_larger_28a7", bundle: resourceBundle)

    /// The "gi_larger_df8f" asset catalog image resource.
    static let giLargerDf8F = DeveloperToolsSupport.ImageResource(name: "gi_larger_df8f", bundle: resourceBundle)

    /// The "gi_larger_f62c" asset catalog image resource.
    static let giLargerF62C = DeveloperToolsSupport.ImageResource(name: "gi_larger_f62c", bundle: resourceBundle)

    /// The "gi_leaderboardsComplex" asset catalog image resource.
    static let giLeaderboardsComplex = DeveloperToolsSupport.ImageResource(name: "gi_leaderboardsComplex", bundle: resourceBundle)

    /// The "gi_leaderboardsComplex_412d" asset catalog image resource.
    static let giLeaderboardsComplex412D = DeveloperToolsSupport.ImageResource(name: "gi_leaderboardsComplex_412d", bundle: resourceBundle)

    /// The "gi_leaderboardsComplex_fd36" asset catalog image resource.
    static let giLeaderboardsComplexFd36 = DeveloperToolsSupport.ImageResource(name: "gi_leaderboardsComplex_fd36", bundle: resourceBundle)

    /// The "gi_leaderboardsSimple" asset catalog image resource.
    static let giLeaderboardsSimple = DeveloperToolsSupport.ImageResource(name: "gi_leaderboardsSimple", bundle: resourceBundle)

    /// The "gi_leaderboardsSimple_751f" asset catalog image resource.
    static let giLeaderboardsSimple751F = DeveloperToolsSupport.ImageResource(name: "gi_leaderboardsSimple_751f", bundle: resourceBundle)

    /// The "gi_leaderboardsSimple_8919" asset catalog image resource.
    static let giLeaderboardsSimple8919 = DeveloperToolsSupport.ImageResource(name: "gi_leaderboardsSimple_8919", bundle: resourceBundle)

    /// The "gi_left" asset catalog image resource.
    static let giLeft = DeveloperToolsSupport.ImageResource(name: "gi_left", bundle: resourceBundle)

    /// The "gi_left_6887" asset catalog image resource.
    static let giLeft6887 = DeveloperToolsSupport.ImageResource(name: "gi_left_6887", bundle: resourceBundle)

    /// The "gi_locked" asset catalog image resource.
    static let giLocked = DeveloperToolsSupport.ImageResource(name: "gi_locked", bundle: resourceBundle)

    /// The "gi_locked_5fa6" asset catalog image resource.
    static let giLocked5Fa6 = DeveloperToolsSupport.ImageResource(name: "gi_locked_5fa6", bundle: resourceBundle)

    /// The "gi_locked_7493" asset catalog image resource.
    static let giLocked7493 = DeveloperToolsSupport.ImageResource(name: "gi_locked_7493", bundle: resourceBundle)

    /// The "gi_locked_d427" asset catalog image resource.
    static let giLockedD427 = DeveloperToolsSupport.ImageResource(name: "gi_locked_d427", bundle: resourceBundle)

    /// The "gi_massiveMultiplayer" asset catalog image resource.
    static let giMassiveMultiplayer = DeveloperToolsSupport.ImageResource(name: "gi_massiveMultiplayer", bundle: resourceBundle)

    /// The "gi_massiveMultiplayer_6588" asset catalog image resource.
    static let giMassiveMultiplayer6588 = DeveloperToolsSupport.ImageResource(name: "gi_massiveMultiplayer_6588", bundle: resourceBundle)

    /// The "gi_massiveMultiplayer_913b" asset catalog image resource.
    static let giMassiveMultiplayer913B = DeveloperToolsSupport.ImageResource(name: "gi_massiveMultiplayer_913b", bundle: resourceBundle)

    /// The "gi_massiveMultiplayer_f3a6" asset catalog image resource.
    static let giMassiveMultiplayerF3A6 = DeveloperToolsSupport.ImageResource(name: "gi_massiveMultiplayer_f3a6", bundle: resourceBundle)

    /// The "gi_medal1" asset catalog image resource.
    static let giMedal1 = DeveloperToolsSupport.ImageResource(name: "gi_medal1", bundle: resourceBundle)

    /// The "gi_medal1_5a3c" asset catalog image resource.
    static let giMedal15A3C = DeveloperToolsSupport.ImageResource(name: "gi_medal1_5a3c", bundle: resourceBundle)

    /// The "gi_medal1_aefb" asset catalog image resource.
    static let giMedal1Aefb = DeveloperToolsSupport.ImageResource(name: "gi_medal1_aefb", bundle: resourceBundle)

    /// The "gi_medal1_cf60" asset catalog image resource.
    static let giMedal1Cf60 = DeveloperToolsSupport.ImageResource(name: "gi_medal1_cf60", bundle: resourceBundle)

    /// The "gi_medal2" asset catalog image resource.
    static let giMedal2 = DeveloperToolsSupport.ImageResource(name: "gi_medal2", bundle: resourceBundle)

    /// The "gi_medal2_54f7" asset catalog image resource.
    static let giMedal254F7 = DeveloperToolsSupport.ImageResource(name: "gi_medal2_54f7", bundle: resourceBundle)

    /// The "gi_medal2_9cee" asset catalog image resource.
    static let giMedal29Cee = DeveloperToolsSupport.ImageResource(name: "gi_medal2_9cee", bundle: resourceBundle)

    /// The "gi_medal2_d232" asset catalog image resource.
    static let giMedal2D232 = DeveloperToolsSupport.ImageResource(name: "gi_medal2_d232", bundle: resourceBundle)

    /// The "gi_menuGrid" asset catalog image resource.
    static let giMenuGrid = DeveloperToolsSupport.ImageResource(name: "gi_menuGrid", bundle: resourceBundle)

    /// The "gi_menuGrid_70b1" asset catalog image resource.
    static let giMenuGrid70B1 = DeveloperToolsSupport.ImageResource(name: "gi_menuGrid_70b1", bundle: resourceBundle)

    /// The "gi_menuGrid_7147" asset catalog image resource.
    static let giMenuGrid7147 = DeveloperToolsSupport.ImageResource(name: "gi_menuGrid_7147", bundle: resourceBundle)

    /// The "gi_menuGrid_7a93" asset catalog image resource.
    static let giMenuGrid7A93 = DeveloperToolsSupport.ImageResource(name: "gi_menuGrid_7a93", bundle: resourceBundle)

    /// The "gi_menuList" asset catalog image resource.
    static let giMenuList = DeveloperToolsSupport.ImageResource(name: "gi_menuList", bundle: resourceBundle)

    /// The "gi_menuList_08f1" asset catalog image resource.
    static let giMenuList08F1 = DeveloperToolsSupport.ImageResource(name: "gi_menuList_08f1", bundle: resourceBundle)

    /// The "gi_menuList_aa25" asset catalog image resource.
    static let giMenuListAa25 = DeveloperToolsSupport.ImageResource(name: "gi_menuList_aa25", bundle: resourceBundle)

    /// The "gi_menuList_c966" asset catalog image resource.
    static let giMenuListC966 = DeveloperToolsSupport.ImageResource(name: "gi_menuList_c966", bundle: resourceBundle)

    /// The "gi_minus" asset catalog image resource.
    static let giMinus = DeveloperToolsSupport.ImageResource(name: "gi_minus", bundle: resourceBundle)

    /// The "gi_minus_2339" asset catalog image resource.
    static let giMinus2339 = DeveloperToolsSupport.ImageResource(name: "gi_minus_2339", bundle: resourceBundle)

    /// The "gi_minus_bf1a" asset catalog image resource.
    static let giMinusBf1A = DeveloperToolsSupport.ImageResource(name: "gi_minus_bf1a", bundle: resourceBundle)

    /// The "gi_minus_f294" asset catalog image resource.
    static let giMinusF294 = DeveloperToolsSupport.ImageResource(name: "gi_minus_f294", bundle: resourceBundle)

    /// The "gi_mouse" asset catalog image resource.
    static let giMouse = DeveloperToolsSupport.ImageResource(name: "gi_mouse", bundle: resourceBundle)

    /// The "gi_mouse_04ec" asset catalog image resource.
    static let giMouse04Ec = DeveloperToolsSupport.ImageResource(name: "gi_mouse_04ec", bundle: resourceBundle)

    /// The "gi_mouse_315e" asset catalog image resource.
    static let giMouse315E = DeveloperToolsSupport.ImageResource(name: "gi_mouse_315e", bundle: resourceBundle)

    /// The "gi_mouse_45ee" asset catalog image resource.
    static let giMouse45Ee = DeveloperToolsSupport.ImageResource(name: "gi_mouse_45ee", bundle: resourceBundle)

    /// The "gi_movie" asset catalog image resource.
    static let giMovie = DeveloperToolsSupport.ImageResource(name: "gi_movie", bundle: resourceBundle)

    /// The "gi_movie_f532" asset catalog image resource.
    static let giMovieF532 = DeveloperToolsSupport.ImageResource(name: "gi_movie_f532", bundle: resourceBundle)

    /// The "gi_multiplayer" asset catalog image resource.
    static let giMultiplayer = DeveloperToolsSupport.ImageResource(name: "gi_multiplayer", bundle: resourceBundle)

    /// The "gi_multiplayer_5dae" asset catalog image resource.
    static let giMultiplayer5Dae = DeveloperToolsSupport.ImageResource(name: "gi_multiplayer_5dae", bundle: resourceBundle)

    /// The "gi_multiplayer_9e82" asset catalog image resource.
    static let giMultiplayer9E82 = DeveloperToolsSupport.ImageResource(name: "gi_multiplayer_9e82", bundle: resourceBundle)

    /// The "gi_musicOff" asset catalog image resource.
    static let giMusicOff = DeveloperToolsSupport.ImageResource(name: "gi_musicOff", bundle: resourceBundle)

    /// The "gi_musicOff_14f5" asset catalog image resource.
    static let giMusicOff14F5 = DeveloperToolsSupport.ImageResource(name: "gi_musicOff_14f5", bundle: resourceBundle)

    /// The "gi_musicOff_3cd4" asset catalog image resource.
    static let giMusicOff3Cd4 = DeveloperToolsSupport.ImageResource(name: "gi_musicOff_3cd4", bundle: resourceBundle)

    /// The "gi_musicOff_a0c9" asset catalog image resource.
    static let giMusicOffA0C9 = DeveloperToolsSupport.ImageResource(name: "gi_musicOff_a0c9", bundle: resourceBundle)

    /// The "gi_musicOn" asset catalog image resource.
    static let giMusicOn = DeveloperToolsSupport.ImageResource(name: "gi_musicOn", bundle: resourceBundle)

    /// The "gi_musicOn_48f0" asset catalog image resource.
    static let giMusicOn48F0 = DeveloperToolsSupport.ImageResource(name: "gi_musicOn_48f0", bundle: resourceBundle)

    /// The "gi_musicOn_9f15" asset catalog image resource.
    static let giMusicOn9F15 = DeveloperToolsSupport.ImageResource(name: "gi_musicOn_9f15", bundle: resourceBundle)

    /// The "gi_musicOn_cff6" asset catalog image resource.
    static let giMusicOnCff6 = DeveloperToolsSupport.ImageResource(name: "gi_musicOn_cff6", bundle: resourceBundle)

    /// The "gi_next" asset catalog image resource.
    static let giNext = DeveloperToolsSupport.ImageResource(name: "gi_next", bundle: resourceBundle)

    /// The "gi_next_02cb" asset catalog image resource.
    static let giNext02Cb = DeveloperToolsSupport.ImageResource(name: "gi_next_02cb", bundle: resourceBundle)

    /// The "gi_next_219d" asset catalog image resource.
    static let giNext219D = DeveloperToolsSupport.ImageResource(name: "gi_next_219d", bundle: resourceBundle)

    /// The "gi_open" asset catalog image resource.
    static let giOpen = DeveloperToolsSupport.ImageResource(name: "gi_open", bundle: resourceBundle)

    /// The "gi_open_3777" asset catalog image resource.
    static let giOpen3777 = DeveloperToolsSupport.ImageResource(name: "gi_open_3777", bundle: resourceBundle)

    /// The "gi_open_4040" asset catalog image resource.
    static let giOpen4040 = DeveloperToolsSupport.ImageResource(name: "gi_open_4040", bundle: resourceBundle)

    /// The "gi_pause" asset catalog image resource.
    static let giPause = DeveloperToolsSupport.ImageResource(name: "gi_pause", bundle: resourceBundle)

    /// The "gi_pause_2fa7" asset catalog image resource.
    static let giPause2Fa7 = DeveloperToolsSupport.ImageResource(name: "gi_pause_2fa7", bundle: resourceBundle)

    /// The "gi_pause_5778" asset catalog image resource.
    static let giPause5778 = DeveloperToolsSupport.ImageResource(name: "gi_pause_5778", bundle: resourceBundle)

    /// The "gi_pause_e1f9" asset catalog image resource.
    static let giPauseE1F9 = DeveloperToolsSupport.ImageResource(name: "gi_pause_e1f9", bundle: resourceBundle)

    /// The "gi_phone" asset catalog image resource.
    static let giPhone = DeveloperToolsSupport.ImageResource(name: "gi_phone", bundle: resourceBundle)

    /// The "gi_phone_0478" asset catalog image resource.
    static let giPhone0478 = DeveloperToolsSupport.ImageResource(name: "gi_phone_0478", bundle: resourceBundle)

    /// The "gi_phone_31a7" asset catalog image resource.
    static let giPhone31A7 = DeveloperToolsSupport.ImageResource(name: "gi_phone_31a7", bundle: resourceBundle)

    /// The "gi_phone_7ae1" asset catalog image resource.
    static let giPhone7Ae1 = DeveloperToolsSupport.ImageResource(name: "gi_phone_7ae1", bundle: resourceBundle)

    /// The "gi_plus" asset catalog image resource.
    static let giPlus = DeveloperToolsSupport.ImageResource(name: "gi_plus", bundle: resourceBundle)

    /// The "gi_plus_1842" asset catalog image resource.
    static let giPlus1842 = DeveloperToolsSupport.ImageResource(name: "gi_plus_1842", bundle: resourceBundle)

    /// The "gi_plus_5087" asset catalog image resource.
    static let giPlus5087 = DeveloperToolsSupport.ImageResource(name: "gi_plus_5087", bundle: resourceBundle)

    /// The "gi_plus_8cd7" asset catalog image resource.
    static let giPlus8Cd7 = DeveloperToolsSupport.ImageResource(name: "gi_plus_8cd7", bundle: resourceBundle)

    /// The "gi_power" asset catalog image resource.
    static let giPower = DeveloperToolsSupport.ImageResource(name: "gi_power", bundle: resourceBundle)

    /// The "gi_power_6bae" asset catalog image resource.
    static let giPower6Bae = DeveloperToolsSupport.ImageResource(name: "gi_power_6bae", bundle: resourceBundle)

    /// The "gi_power_a695" asset catalog image resource.
    static let giPowerA695 = DeveloperToolsSupport.ImageResource(name: "gi_power_a695", bundle: resourceBundle)

    /// The "gi_power_eed1" asset catalog image resource.
    static let giPowerEed1 = DeveloperToolsSupport.ImageResource(name: "gi_power_eed1", bundle: resourceBundle)

    /// The "gi_previous" asset catalog image resource.
    static let giPrevious = DeveloperToolsSupport.ImageResource(name: "gi_previous", bundle: resourceBundle)

    /// The "gi_previous_a9c7" asset catalog image resource.
    static let giPreviousA9C7 = DeveloperToolsSupport.ImageResource(name: "gi_previous_a9c7", bundle: resourceBundle)

    /// The "gi_previous_adcf" asset catalog image resource.
    static let giPreviousAdcf = DeveloperToolsSupport.ImageResource(name: "gi_previous_adcf", bundle: resourceBundle)

    /// The "gi_question" asset catalog image resource.
    static let giQuestion = DeveloperToolsSupport.ImageResource(name: "gi_question", bundle: resourceBundle)

    /// The "gi_question_a45d" asset catalog image resource.
    static let giQuestionA45D = DeveloperToolsSupport.ImageResource(name: "gi_question_a45d", bundle: resourceBundle)

    /// The "gi_question_a6dd" asset catalog image resource.
    static let giQuestionA6Dd = DeveloperToolsSupport.ImageResource(name: "gi_question_a6dd", bundle: resourceBundle)

    /// The "gi_question_e5f8" asset catalog image resource.
    static let giQuestionE5F8 = DeveloperToolsSupport.ImageResource(name: "gi_question_e5f8", bundle: resourceBundle)

    /// The "gi_return" asset catalog image resource.
    static let giReturn = DeveloperToolsSupport.ImageResource(name: "gi_return", bundle: resourceBundle)

    /// The "gi_return_1d41" asset catalog image resource.
    static let giReturn1D41 = DeveloperToolsSupport.ImageResource(name: "gi_return_1d41", bundle: resourceBundle)

    /// The "gi_return_4b0a" asset catalog image resource.
    static let giReturn4B0A = DeveloperToolsSupport.ImageResource(name: "gi_return_4b0a", bundle: resourceBundle)

    /// The "gi_return_bb0b" asset catalog image resource.
    static let giReturnBb0B = DeveloperToolsSupport.ImageResource(name: "gi_return_bb0b", bundle: resourceBundle)

    /// The "gi_rewind" asset catalog image resource.
    static let giRewind = DeveloperToolsSupport.ImageResource(name: "gi_rewind", bundle: resourceBundle)

    /// The "gi_rewind_9495" asset catalog image resource.
    static let giRewind9495 = DeveloperToolsSupport.ImageResource(name: "gi_rewind_9495", bundle: resourceBundle)

    /// The "gi_rewind_a80e" asset catalog image resource.
    static let giRewindA80E = DeveloperToolsSupport.ImageResource(name: "gi_rewind_a80e", bundle: resourceBundle)

    /// The "gi_rewind_e1af" asset catalog image resource.
    static let giRewindE1Af = DeveloperToolsSupport.ImageResource(name: "gi_rewind_e1af", bundle: resourceBundle)

    /// The "gi_right" asset catalog image resource.
    static let giRight = DeveloperToolsSupport.ImageResource(name: "gi_right", bundle: resourceBundle)

    /// The "gi_right_7e05" asset catalog image resource.
    static let giRight7E05 = DeveloperToolsSupport.ImageResource(name: "gi_right_7e05", bundle: resourceBundle)

    /// The "gi_save" asset catalog image resource.
    static let giSave = DeveloperToolsSupport.ImageResource(name: "gi_save", bundle: resourceBundle)

    /// The "gi_save_7caa" asset catalog image resource.
    static let giSave7Caa = DeveloperToolsSupport.ImageResource(name: "gi_save_7caa", bundle: resourceBundle)

    /// The "gi_save_9f1b" asset catalog image resource.
    static let giSave9F1B = DeveloperToolsSupport.ImageResource(name: "gi_save_9f1b", bundle: resourceBundle)

    /// The "gi_scrollHorizontal" asset catalog image resource.
    static let giScrollHorizontal = DeveloperToolsSupport.ImageResource(name: "gi_scrollHorizontal", bundle: resourceBundle)

    /// The "gi_scrollHorizontal_607f" asset catalog image resource.
    static let giScrollHorizontal607F = DeveloperToolsSupport.ImageResource(name: "gi_scrollHorizontal_607f", bundle: resourceBundle)

    /// The "gi_scrollHorizontal_e3e1" asset catalog image resource.
    static let giScrollHorizontalE3E1 = DeveloperToolsSupport.ImageResource(name: "gi_scrollHorizontal_e3e1", bundle: resourceBundle)

    /// The "gi_scrollVertical" asset catalog image resource.
    static let giScrollVertical = DeveloperToolsSupport.ImageResource(name: "gi_scrollVertical", bundle: resourceBundle)

    /// The "gi_scrollVertical_a3a5" asset catalog image resource.
    static let giScrollVerticalA3A5 = DeveloperToolsSupport.ImageResource(name: "gi_scrollVertical_a3a5", bundle: resourceBundle)

    /// The "gi_scrollVertical_ea0f" asset catalog image resource.
    static let giScrollVerticalEa0F = DeveloperToolsSupport.ImageResource(name: "gi_scrollVertical_ea0f", bundle: resourceBundle)

    /// The "gi_scrollVertical_f3d3" asset catalog image resource.
    static let giScrollVerticalF3D3 = DeveloperToolsSupport.ImageResource(name: "gi_scrollVertical_f3d3", bundle: resourceBundle)

    /// The "gi_share1" asset catalog image resource.
    static let giShare1 = DeveloperToolsSupport.ImageResource(name: "gi_share1", bundle: resourceBundle)

    /// The "gi_share1_26b3" asset catalog image resource.
    static let giShare126B3 = DeveloperToolsSupport.ImageResource(name: "gi_share1_26b3", bundle: resourceBundle)

    /// The "gi_share1_3c27" asset catalog image resource.
    static let giShare13C27 = DeveloperToolsSupport.ImageResource(name: "gi_share1_3c27", bundle: resourceBundle)

    /// The "gi_share1_e863" asset catalog image resource.
    static let giShare1E863 = DeveloperToolsSupport.ImageResource(name: "gi_share1_e863", bundle: resourceBundle)

    /// The "gi_share2" asset catalog image resource.
    static let giShare2 = DeveloperToolsSupport.ImageResource(name: "gi_share2", bundle: resourceBundle)

    /// The "gi_share2_03d8" asset catalog image resource.
    static let giShare203D8 = DeveloperToolsSupport.ImageResource(name: "gi_share2_03d8", bundle: resourceBundle)

    /// The "gi_share2_4f2f" asset catalog image resource.
    static let giShare24F2F = DeveloperToolsSupport.ImageResource(name: "gi_share2_4f2f", bundle: resourceBundle)

    /// The "gi_share2_bbc9" asset catalog image resource.
    static let giShare2Bbc9 = DeveloperToolsSupport.ImageResource(name: "gi_share2_bbc9", bundle: resourceBundle)

    /// The "gi_shoppingBasket" asset catalog image resource.
    static let giShoppingBasket = DeveloperToolsSupport.ImageResource(name: "gi_shoppingBasket", bundle: resourceBundle)

    /// The "gi_shoppingBasket_46c2" asset catalog image resource.
    static let giShoppingBasket46C2 = DeveloperToolsSupport.ImageResource(name: "gi_shoppingBasket_46c2", bundle: resourceBundle)

    /// The "gi_shoppingCart" asset catalog image resource.
    static let giShoppingCart = DeveloperToolsSupport.ImageResource(name: "gi_shoppingCart", bundle: resourceBundle)

    /// The "gi_shoppingCart_0e5b" asset catalog image resource.
    static let giShoppingCart0E5B = DeveloperToolsSupport.ImageResource(name: "gi_shoppingCart_0e5b", bundle: resourceBundle)

    /// The "gi_siganl1" asset catalog image resource.
    static let giSiganl1 = DeveloperToolsSupport.ImageResource(name: "gi_siganl1", bundle: resourceBundle)

    /// The "gi_siganl1_5c59" asset catalog image resource.
    static let giSiganl15C59 = DeveloperToolsSupport.ImageResource(name: "gi_siganl1_5c59", bundle: resourceBundle)

    /// The "gi_signal1" asset catalog image resource.
    static let giSignal1 = DeveloperToolsSupport.ImageResource(name: "gi_signal1", bundle: resourceBundle)

    /// The "gi_signal1_ae03" asset catalog image resource.
    static let giSignal1Ae03 = DeveloperToolsSupport.ImageResource(name: "gi_signal1_ae03", bundle: resourceBundle)

    /// The "gi_signal2" asset catalog image resource.
    static let giSignal2 = DeveloperToolsSupport.ImageResource(name: "gi_signal2", bundle: resourceBundle)

    /// The "gi_signal2_2125" asset catalog image resource.
    static let giSignal22125 = DeveloperToolsSupport.ImageResource(name: "gi_signal2_2125", bundle: resourceBundle)

    /// The "gi_signal2_2546" asset catalog image resource.
    static let giSignal22546 = DeveloperToolsSupport.ImageResource(name: "gi_signal2_2546", bundle: resourceBundle)

    /// The "gi_signal2_8ec7" asset catalog image resource.
    static let giSignal28Ec7 = DeveloperToolsSupport.ImageResource(name: "gi_signal2_8ec7", bundle: resourceBundle)

    /// The "gi_signal3" asset catalog image resource.
    static let giSignal3 = DeveloperToolsSupport.ImageResource(name: "gi_signal3", bundle: resourceBundle)

    /// The "gi_signal3_12e7" asset catalog image resource.
    static let giSignal312E7 = DeveloperToolsSupport.ImageResource(name: "gi_signal3_12e7", bundle: resourceBundle)

    /// The "gi_signal3_45e0" asset catalog image resource.
    static let giSignal345E0 = DeveloperToolsSupport.ImageResource(name: "gi_signal3_45e0", bundle: resourceBundle)

    /// The "gi_signal3_9171" asset catalog image resource.
    static let giSignal39171 = DeveloperToolsSupport.ImageResource(name: "gi_signal3_9171", bundle: resourceBundle)

    /// The "gi_singleplayer" asset catalog image resource.
    static let giSingleplayer = DeveloperToolsSupport.ImageResource(name: "gi_singleplayer", bundle: resourceBundle)

    /// The "gi_singleplayer_1d4f" asset catalog image resource.
    static let giSingleplayer1D4F = DeveloperToolsSupport.ImageResource(name: "gi_singleplayer_1d4f", bundle: resourceBundle)

    /// The "gi_singleplayer_92c2" asset catalog image resource.
    static let giSingleplayer92C2 = DeveloperToolsSupport.ImageResource(name: "gi_singleplayer_92c2", bundle: resourceBundle)

    /// The "gi_smaller" asset catalog image resource.
    static let giSmaller = DeveloperToolsSupport.ImageResource(name: "gi_smaller", bundle: resourceBundle)

    /// The "gi_smaller_6eb1" asset catalog image resource.
    static let giSmaller6Eb1 = DeveloperToolsSupport.ImageResource(name: "gi_smaller_6eb1", bundle: resourceBundle)

    /// The "gi_smaller_bf46" asset catalog image resource.
    static let giSmallerBf46 = DeveloperToolsSupport.ImageResource(name: "gi_smaller_bf46", bundle: resourceBundle)

    /// The "gi_smaller_cf9b" asset catalog image resource.
    static let giSmallerCf9B = DeveloperToolsSupport.ImageResource(name: "gi_smaller_cf9b", bundle: resourceBundle)

    /// The "gi_star" asset catalog image resource.
    static let giStar = DeveloperToolsSupport.ImageResource(name: "gi_star", bundle: resourceBundle)

    /// The "gi_star_008b" asset catalog image resource.
    static let giStar008B = DeveloperToolsSupport.ImageResource(name: "gi_star_008b", bundle: resourceBundle)

    /// The "gi_star_5d77" asset catalog image resource.
    static let giStar5D77 = DeveloperToolsSupport.ImageResource(name: "gi_star_5d77", bundle: resourceBundle)

    /// The "gi_stop" asset catalog image resource.
    static let giStop = DeveloperToolsSupport.ImageResource(name: "gi_stop", bundle: resourceBundle)

    /// The "gi_stop_ded1" asset catalog image resource.
    static let giStopDed1 = DeveloperToolsSupport.ImageResource(name: "gi_stop_ded1", bundle: resourceBundle)

    /// The "gi_stop_df21" asset catalog image resource.
    static let giStopDf21 = DeveloperToolsSupport.ImageResource(name: "gi_stop_df21", bundle: resourceBundle)

    /// The "gi_stop_fd18" asset catalog image resource.
    static let giStopFd18 = DeveloperToolsSupport.ImageResource(name: "gi_stop_fd18", bundle: resourceBundle)

    /// The "gi_tablet" asset catalog image resource.
    static let giTablet = DeveloperToolsSupport.ImageResource(name: "gi_tablet", bundle: resourceBundle)

    /// The "gi_tablet_7966" asset catalog image resource.
    static let giTablet7966 = DeveloperToolsSupport.ImageResource(name: "gi_tablet_7966", bundle: resourceBundle)

    /// The "gi_tablet_9f07" asset catalog image resource.
    static let giTablet9F07 = DeveloperToolsSupport.ImageResource(name: "gi_tablet_9f07", bundle: resourceBundle)

    /// The "gi_tablet_c5d9" asset catalog image resource.
    static let giTabletC5D9 = DeveloperToolsSupport.ImageResource(name: "gi_tablet_c5d9", bundle: resourceBundle)

    /// The "gi_target" asset catalog image resource.
    static let giTarget = DeveloperToolsSupport.ImageResource(name: "gi_target", bundle: resourceBundle)

    /// The "gi_target_3c87" asset catalog image resource.
    static let giTarget3C87 = DeveloperToolsSupport.ImageResource(name: "gi_target_3c87", bundle: resourceBundle)

    /// The "gi_target_6434" asset catalog image resource.
    static let giTarget6434 = DeveloperToolsSupport.ImageResource(name: "gi_target_6434", bundle: resourceBundle)

    /// The "gi_target_d0a3" asset catalog image resource.
    static let giTargetD0A3 = DeveloperToolsSupport.ImageResource(name: "gi_target_d0a3", bundle: resourceBundle)

    /// The "gi_trashcan" asset catalog image resource.
    static let giTrashcan = DeveloperToolsSupport.ImageResource(name: "gi_trashcan", bundle: resourceBundle)

    /// The "gi_trashcanOpen" asset catalog image resource.
    static let giTrashcanOpen = DeveloperToolsSupport.ImageResource(name: "gi_trashcanOpen", bundle: resourceBundle)

    /// The "gi_trashcanOpen_13b4" asset catalog image resource.
    static let giTrashcanOpen13B4 = DeveloperToolsSupport.ImageResource(name: "gi_trashcanOpen_13b4", bundle: resourceBundle)

    /// The "gi_trashcanOpen_1426" asset catalog image resource.
    static let giTrashcanOpen1426 = DeveloperToolsSupport.ImageResource(name: "gi_trashcanOpen_1426", bundle: resourceBundle)

    /// The "gi_trashcanOpen_18d9" asset catalog image resource.
    static let giTrashcanOpen18D9 = DeveloperToolsSupport.ImageResource(name: "gi_trashcanOpen_18d9", bundle: resourceBundle)

    /// The "gi_trashcan_1c67" asset catalog image resource.
    static let giTrashcan1C67 = DeveloperToolsSupport.ImageResource(name: "gi_trashcan_1c67", bundle: resourceBundle)

    /// The "gi_trashcan_22a8" asset catalog image resource.
    static let giTrashcan22A8 = DeveloperToolsSupport.ImageResource(name: "gi_trashcan_22a8", bundle: resourceBundle)

    /// The "gi_trophy" asset catalog image resource.
    static let giTrophy = DeveloperToolsSupport.ImageResource(name: "gi_trophy", bundle: resourceBundle)

    /// The "gi_trophy_1d60" asset catalog image resource.
    static let giTrophy1D60 = DeveloperToolsSupport.ImageResource(name: "gi_trophy_1d60", bundle: resourceBundle)

    /// The "gi_trophy_24dc" asset catalog image resource.
    static let giTrophy24Dc = DeveloperToolsSupport.ImageResource(name: "gi_trophy_24dc", bundle: resourceBundle)

    /// The "gi_trophy_a8ff" asset catalog image resource.
    static let giTrophyA8Ff = DeveloperToolsSupport.ImageResource(name: "gi_trophy_a8ff", bundle: resourceBundle)

    /// The "gi_unlocked" asset catalog image resource.
    static let giUnlocked = DeveloperToolsSupport.ImageResource(name: "gi_unlocked", bundle: resourceBundle)

    /// The "gi_unlocked_a61a" asset catalog image resource.
    static let giUnlockedA61A = DeveloperToolsSupport.ImageResource(name: "gi_unlocked_a61a", bundle: resourceBundle)

    /// The "gi_unlocked_c82a" asset catalog image resource.
    static let giUnlockedC82A = DeveloperToolsSupport.ImageResource(name: "gi_unlocked_c82a", bundle: resourceBundle)

    /// The "gi_up" asset catalog image resource.
    static let giUp = DeveloperToolsSupport.ImageResource(name: "gi_up", bundle: resourceBundle)

    /// The "gi_upLeft" asset catalog image resource.
    static let giUpLeft = DeveloperToolsSupport.ImageResource(name: "gi_upLeft", bundle: resourceBundle)

    /// The "gi_upLeft_0264" asset catalog image resource.
    static let giUpLeft0264 = DeveloperToolsSupport.ImageResource(name: "gi_upLeft_0264", bundle: resourceBundle)

    /// The "gi_upLeft_3c30" asset catalog image resource.
    static let giUpLeft3C30 = DeveloperToolsSupport.ImageResource(name: "gi_upLeft_3c30", bundle: resourceBundle)

    /// The "gi_upLeft_90ba" asset catalog image resource.
    static let giUpLeft90Ba = DeveloperToolsSupport.ImageResource(name: "gi_upLeft_90ba", bundle: resourceBundle)

    /// The "gi_upRight" asset catalog image resource.
    static let giUpRight = DeveloperToolsSupport.ImageResource(name: "gi_upRight", bundle: resourceBundle)

    /// The "gi_upRight_8aee" asset catalog image resource.
    static let giUpRight8Aee = DeveloperToolsSupport.ImageResource(name: "gi_upRight_8aee", bundle: resourceBundle)

    /// The "gi_upRight_9408" asset catalog image resource.
    static let giUpRight9408 = DeveloperToolsSupport.ImageResource(name: "gi_upRight_9408", bundle: resourceBundle)

    /// The "gi_upRight_cce6" asset catalog image resource.
    static let giUpRightCce6 = DeveloperToolsSupport.ImageResource(name: "gi_upRight_cce6", bundle: resourceBundle)

    /// The "gi_up_408f" asset catalog image resource.
    static let giUp408F = DeveloperToolsSupport.ImageResource(name: "gi_up_408f", bundle: resourceBundle)

    /// The "gi_up_696a" asset catalog image resource.
    static let giUp696A = DeveloperToolsSupport.ImageResource(name: "gi_up_696a", bundle: resourceBundle)

    /// The "gi_up_e383" asset catalog image resource.
    static let giUpE383 = DeveloperToolsSupport.ImageResource(name: "gi_up_e383", bundle: resourceBundle)

    /// The "gi_video" asset catalog image resource.
    static let giVideo = DeveloperToolsSupport.ImageResource(name: "gi_video", bundle: resourceBundle)

    /// The "gi_video_b032" asset catalog image resource.
    static let giVideoB032 = DeveloperToolsSupport.ImageResource(name: "gi_video_b032", bundle: resourceBundle)

    /// The "gi_video_b34b" asset catalog image resource.
    static let giVideoB34B = DeveloperToolsSupport.ImageResource(name: "gi_video_b34b", bundle: resourceBundle)

    /// The "gi_video_bb82" asset catalog image resource.
    static let giVideoBb82 = DeveloperToolsSupport.ImageResource(name: "gi_video_bb82", bundle: resourceBundle)

    /// The "gi_warning" asset catalog image resource.
    static let giWarning = DeveloperToolsSupport.ImageResource(name: "gi_warning", bundle: resourceBundle)

    /// The "gi_warning_42e9" asset catalog image resource.
    static let giWarning42E9 = DeveloperToolsSupport.ImageResource(name: "gi_warning_42e9", bundle: resourceBundle)

    /// The "gi_warning_8383" asset catalog image resource.
    static let giWarning8383 = DeveloperToolsSupport.ImageResource(name: "gi_warning_8383", bundle: resourceBundle)

    /// The "gi_warning_a2a7" asset catalog image resource.
    static let giWarningA2A7 = DeveloperToolsSupport.ImageResource(name: "gi_warning_a2a7", bundle: resourceBundle)

    /// The "gi_wrench" asset catalog image resource.
    static let giWrench = DeveloperToolsSupport.ImageResource(name: "gi_wrench", bundle: resourceBundle)

    /// The "gi_wrench_05d0" asset catalog image resource.
    static let giWrench05D0 = DeveloperToolsSupport.ImageResource(name: "gi_wrench_05d0", bundle: resourceBundle)

    /// The "gi_wrench_9998" asset catalog image resource.
    static let giWrench9998 = DeveloperToolsSupport.ImageResource(name: "gi_wrench_9998", bundle: resourceBundle)

    /// The "gi_zoom" asset catalog image resource.
    static let giZoom = DeveloperToolsSupport.ImageResource(name: "gi_zoom", bundle: resourceBundle)

    /// The "gi_zoomDefault" asset catalog image resource.
    static let giZoomDefault = DeveloperToolsSupport.ImageResource(name: "gi_zoomDefault", bundle: resourceBundle)

    /// The "gi_zoomDefault_7f87" asset catalog image resource.
    static let giZoomDefault7F87 = DeveloperToolsSupport.ImageResource(name: "gi_zoomDefault_7f87", bundle: resourceBundle)

    /// The "gi_zoomDefault_923f" asset catalog image resource.
    static let giZoomDefault923F = DeveloperToolsSupport.ImageResource(name: "gi_zoomDefault_923f", bundle: resourceBundle)

    /// The "gi_zoomIn" asset catalog image resource.
    static let giZoomIn = DeveloperToolsSupport.ImageResource(name: "gi_zoomIn", bundle: resourceBundle)

    /// The "gi_zoomIn_e711" asset catalog image resource.
    static let giZoomInE711 = DeveloperToolsSupport.ImageResource(name: "gi_zoomIn_e711", bundle: resourceBundle)

    /// The "gi_zoomIn_f8a6" asset catalog image resource.
    static let giZoomInF8A6 = DeveloperToolsSupport.ImageResource(name: "gi_zoomIn_f8a6", bundle: resourceBundle)

    /// The "gi_zoomOut" asset catalog image resource.
    static let giZoomOut = DeveloperToolsSupport.ImageResource(name: "gi_zoomOut", bundle: resourceBundle)

    /// The "gi_zoomOut_327d" asset catalog image resource.
    static let giZoomOut327D = DeveloperToolsSupport.ImageResource(name: "gi_zoomOut_327d", bundle: resourceBundle)

    /// The "gi_zoomOut_62df" asset catalog image resource.
    static let giZoomOut62Df = DeveloperToolsSupport.ImageResource(name: "gi_zoomOut_62df", bundle: resourceBundle)

    /// The "gi_zoomOut_dbb3" asset catalog image resource.
    static let giZoomOutDbb3 = DeveloperToolsSupport.ImageResource(name: "gi_zoomOut_dbb3", bundle: resourceBundle)

    /// The "gi_zoom_2018" asset catalog image resource.
    static let giZoom2018 = DeveloperToolsSupport.ImageResource(name: "gi_zoom_2018", bundle: resourceBundle)

    /// The "gi_zoom_2062" asset catalog image resource.
    static let giZoom2062 = DeveloperToolsSupport.ImageResource(name: "gi_zoom_2062", bundle: resourceBundle)

    /// The "gi_zoom_2fa1" asset catalog image resource.
    static let giZoom2Fa1 = DeveloperToolsSupport.ImageResource(name: "gi_zoom_2fa1", bundle: resourceBundle)

    /// The "gie_DPAD" asset catalog image resource.
    static let gieDPAD = DeveloperToolsSupport.ImageResource(name: "gie_DPAD", bundle: resourceBundle)

    /// The "gie_DPAD_2323" asset catalog image resource.
    static let gieDPAD2323 = DeveloperToolsSupport.ImageResource(name: "gie_DPAD_2323", bundle: resourceBundle)

    /// The "gie_DPAD_2b95" asset catalog image resource.
    static let gieDPAD2B95 = DeveloperToolsSupport.ImageResource(name: "gie_DPAD_2b95", bundle: resourceBundle)

    /// The "gie_DPAD_4909" asset catalog image resource.
    static let gieDPAD4909 = DeveloperToolsSupport.ImageResource(name: "gie_DPAD_4909", bundle: resourceBundle)

    /// The "gie_DPAD_all" asset catalog image resource.
    static let gieDPADAll = DeveloperToolsSupport.ImageResource(name: "gie_DPAD_all", bundle: resourceBundle)

    /// The "gie_DPAD_all_58b5" asset catalog image resource.
    static let gieDPADAll58B5 = DeveloperToolsSupport.ImageResource(name: "gie_DPAD_all_58b5", bundle: resourceBundle)

    /// The "gie_DPAD_all_7ef0" asset catalog image resource.
    static let gieDPADAll7Ef0 = DeveloperToolsSupport.ImageResource(name: "gie_DPAD_all_7ef0", bundle: resourceBundle)

    /// The "gie_DPAD_all_c19b" asset catalog image resource.
    static let gieDPADAllC19B = DeveloperToolsSupport.ImageResource(name: "gie_DPAD_all_c19b", bundle: resourceBundle)

    /// The "gie_DPAD_down" asset catalog image resource.
    static let gieDPADDown = DeveloperToolsSupport.ImageResource(name: "gie_DPAD_down", bundle: resourceBundle)

    /// The "gie_DPAD_down_9ec4" asset catalog image resource.
    static let gieDPADDown9Ec4 = DeveloperToolsSupport.ImageResource(name: "gie_DPAD_down_9ec4", bundle: resourceBundle)

    /// The "gie_DPAD_down_d3ec" asset catalog image resource.
    static let gieDPADDownD3Ec = DeveloperToolsSupport.ImageResource(name: "gie_DPAD_down_d3ec", bundle: resourceBundle)

    /// The "gie_DPAD_down_ede5" asset catalog image resource.
    static let gieDPADDownEde5 = DeveloperToolsSupport.ImageResource(name: "gie_DPAD_down_ede5", bundle: resourceBundle)

    /// The "gie_DPAD_left" asset catalog image resource.
    static let gieDPADLeft = DeveloperToolsSupport.ImageResource(name: "gie_DPAD_left", bundle: resourceBundle)

    /// The "gie_DPAD_left_d8f1" asset catalog image resource.
    static let gieDPADLeftD8F1 = DeveloperToolsSupport.ImageResource(name: "gie_DPAD_left_d8f1", bundle: resourceBundle)

    /// The "gie_arrowDown" asset catalog image resource.
    static let gieArrowDown = DeveloperToolsSupport.ImageResource(name: "gie_arrowDown", bundle: resourceBundle)

    /// The "gie_arrowDown_0c9f" asset catalog image resource.
    static let gieArrowDown0C9F = DeveloperToolsSupport.ImageResource(name: "gie_arrowDown_0c9f", bundle: resourceBundle)

    /// The "gie_arrowRight" asset catalog image resource.
    static let gieArrowRight = DeveloperToolsSupport.ImageResource(name: "gie_arrowRight", bundle: resourceBundle)

    /// The "gie_arrowRight_9a1b" asset catalog image resource.
    static let gieArrowRight9A1B = DeveloperToolsSupport.ImageResource(name: "gie_arrowRight_9a1b", bundle: resourceBundle)

    /// The "gie_audioOff" asset catalog image resource.
    static let gieAudioOff = DeveloperToolsSupport.ImageResource(name: "gie_audioOff", bundle: resourceBundle)

    /// The "gie_audioOn" asset catalog image resource.
    static let gieAudioOn = DeveloperToolsSupport.ImageResource(name: "gie_audioOn", bundle: resourceBundle)

    /// The "gie_backward" asset catalog image resource.
    static let gieBackward = DeveloperToolsSupport.ImageResource(name: "gie_backward", bundle: resourceBundle)

    /// The "gie_barsHorizontal" asset catalog image resource.
    static let gieBarsHorizontal = DeveloperToolsSupport.ImageResource(name: "gie_barsHorizontal", bundle: resourceBundle)

    /// The "gie_barsVertical" asset catalog image resource.
    static let gieBarsVertical = DeveloperToolsSupport.ImageResource(name: "gie_barsVertical", bundle: resourceBundle)

    /// The "gie_basket" asset catalog image resource.
    static let gieBasket = DeveloperToolsSupport.ImageResource(name: "gie_basket", bundle: resourceBundle)

    /// The "gie_button2" asset catalog image resource.
    static let gieButton2 = DeveloperToolsSupport.ImageResource(name: "gie_button2", bundle: resourceBundle)

    /// The "gie_button3" asset catalog image resource.
    static let gieButton3 = DeveloperToolsSupport.ImageResource(name: "gie_button3", bundle: resourceBundle)

    /// The "gie_button3_0be6" asset catalog image resource.
    static let gieButton30Be6 = DeveloperToolsSupport.ImageResource(name: "gie_button3_0be6", bundle: resourceBundle)

    /// The "gie_buttonA" asset catalog image resource.
    static let gieButtonA = DeveloperToolsSupport.ImageResource(name: "gie_buttonA", bundle: resourceBundle)

    /// The "gie_buttonB" asset catalog image resource.
    static let gieButtonB = DeveloperToolsSupport.ImageResource(name: "gie_buttonB", bundle: resourceBundle)

    /// The "gie_buttonB_e17a" asset catalog image resource.
    static let gieButtonBE17A = DeveloperToolsSupport.ImageResource(name: "gie_buttonB_e17a", bundle: resourceBundle)

    /// The "gie_buttonL" asset catalog image resource.
    static let gieButtonL = DeveloperToolsSupport.ImageResource(name: "gie_buttonL", bundle: resourceBundle)

    /// The "gie_buttonL1" asset catalog image resource.
    static let gieButtonL1 = DeveloperToolsSupport.ImageResource(name: "gie_buttonL1", bundle: resourceBundle)

    /// The "gie_buttonL1_fa49" asset catalog image resource.
    static let gieButtonL1Fa49 = DeveloperToolsSupport.ImageResource(name: "gie_buttonL1_fa49", bundle: resourceBundle)

    /// The "gie_buttonL_6a6a" asset catalog image resource.
    static let gieButtonL6A6A = DeveloperToolsSupport.ImageResource(name: "gie_buttonL_6a6a", bundle: resourceBundle)

    /// The "gie_buttonR1" asset catalog image resource.
    static let gieButtonR1 = DeveloperToolsSupport.ImageResource(name: "gie_buttonR1", bundle: resourceBundle)

    /// The "gie_buttonR2" asset catalog image resource.
    static let gieButtonR2 = DeveloperToolsSupport.ImageResource(name: "gie_buttonR2", bundle: resourceBundle)

    /// The "gie_buttonSelect" asset catalog image resource.
    static let gieButtonSelect = DeveloperToolsSupport.ImageResource(name: "gie_buttonSelect", bundle: resourceBundle)

    /// The "gie_buttonStart" asset catalog image resource.
    static let gieButtonStart = DeveloperToolsSupport.ImageResource(name: "gie_buttonStart", bundle: resourceBundle)

    /// The "gie_buttonX" asset catalog image resource.
    static let gieButtonX = DeveloperToolsSupport.ImageResource(name: "gie_buttonX", bundle: resourceBundle)

    /// The "gie_buttonY" asset catalog image resource.
    static let gieButtonY = DeveloperToolsSupport.ImageResource(name: "gie_buttonY", bundle: resourceBundle)

    /// The "gie_cloudUpload" asset catalog image resource.
    static let gieCloudUpload = DeveloperToolsSupport.ImageResource(name: "gie_cloudUpload", bundle: resourceBundle)

    /// The "gie_cloudUpload_037a" asset catalog image resource.
    static let gieCloudUpload037A = DeveloperToolsSupport.ImageResource(name: "gie_cloudUpload_037a", bundle: resourceBundle)

    /// The "gie_contrast" asset catalog image resource.
    static let gieContrast = DeveloperToolsSupport.ImageResource(name: "gie_contrast", bundle: resourceBundle)

    /// The "gie_controllerTilt" asset catalog image resource.
    static let gieControllerTilt = DeveloperToolsSupport.ImageResource(name: "gie_controllerTilt", bundle: resourceBundle)

    /// The "gie_controllerTilt_2847" asset catalog image resource.
    static let gieControllerTilt2847 = DeveloperToolsSupport.ImageResource(name: "gie_controllerTilt_2847", bundle: resourceBundle)

    /// The "gie_controllerTilt_70f1" asset catalog image resource.
    static let gieControllerTilt70F1 = DeveloperToolsSupport.ImageResource(name: "gie_controllerTilt_70f1", bundle: resourceBundle)

    /// The "gie_controllerTilt_a414" asset catalog image resource.
    static let gieControllerTiltA414 = DeveloperToolsSupport.ImageResource(name: "gie_controllerTilt_a414", bundle: resourceBundle)

    /// The "gie_controllerTilt_left" asset catalog image resource.
    static let gieControllerTiltLeft = DeveloperToolsSupport.ImageResource(name: "gie_controllerTilt_left", bundle: resourceBundle)

    /// The "gie_controllerTilt_left_0e83" asset catalog image resource.
    static let gieControllerTiltLeft0E83 = DeveloperToolsSupport.ImageResource(name: "gie_controllerTilt_left_0e83", bundle: resourceBundle)

    /// The "gie_controllerTilt_left_40c7" asset catalog image resource.
    static let gieControllerTiltLeft40C7 = DeveloperToolsSupport.ImageResource(name: "gie_controllerTilt_left_40c7", bundle: resourceBundle)

    /// The "gie_controllerTilt_left_f13d" asset catalog image resource.
    static let gieControllerTiltLeftF13D = DeveloperToolsSupport.ImageResource(name: "gie_controllerTilt_left_f13d", bundle: resourceBundle)

    /// The "gie_cpu" asset catalog image resource.
    static let gieCpu = DeveloperToolsSupport.ImageResource(name: "gie_cpu", bundle: resourceBundle)

    /// The "gie_cpu_2250" asset catalog image resource.
    static let gieCpu2250 = DeveloperToolsSupport.ImageResource(name: "gie_cpu_2250", bundle: resourceBundle)

    /// The "gie_cross" asset catalog image resource.
    static let gieCross = DeveloperToolsSupport.ImageResource(name: "gie_cross", bundle: resourceBundle)

    /// The "gie_cross_21da" asset catalog image resource.
    static let gieCross21Da = DeveloperToolsSupport.ImageResource(name: "gie_cross_21da", bundle: resourceBundle)

    /// The "gie_cursor" asset catalog image resource.
    static let gieCursor = DeveloperToolsSupport.ImageResource(name: "gie_cursor", bundle: resourceBundle)

    /// The "gie_cursor_ead6" asset catalog image resource.
    static let gieCursorEad6 = DeveloperToolsSupport.ImageResource(name: "gie_cursor_ead6", bundle: resourceBundle)

    /// The "gie_deviceTilt" asset catalog image resource.
    static let gieDeviceTilt = DeveloperToolsSupport.ImageResource(name: "gie_deviceTilt", bundle: resourceBundle)

    /// The "gie_deviceTilt_adee" asset catalog image resource.
    static let gieDeviceTiltAdee = DeveloperToolsSupport.ImageResource(name: "gie_deviceTilt_adee", bundle: resourceBundle)

    /// The "gie_deviceTilt_left" asset catalog image resource.
    static let gieDeviceTiltLeft = DeveloperToolsSupport.ImageResource(name: "gie_deviceTilt_left", bundle: resourceBundle)

    /// The "gie_deviceTilt_left_102f" asset catalog image resource.
    static let gieDeviceTiltLeft102F = DeveloperToolsSupport.ImageResource(name: "gie_deviceTilt_left_102f", bundle: resourceBundle)

    /// The "gie_deviceTilt_left_4ada" asset catalog image resource.
    static let gieDeviceTiltLeft4Ada = DeveloperToolsSupport.ImageResource(name: "gie_deviceTilt_left_4ada", bundle: resourceBundle)

    /// The "gie_deviceTilt_left_6387" asset catalog image resource.
    static let gieDeviceTiltLeft6387 = DeveloperToolsSupport.ImageResource(name: "gie_deviceTilt_left_6387", bundle: resourceBundle)

    /// The "gie_deviceTilt_right" asset catalog image resource.
    static let gieDeviceTiltRight = DeveloperToolsSupport.ImageResource(name: "gie_deviceTilt_right", bundle: resourceBundle)

    /// The "gie_deviceTilt_right_4e67" asset catalog image resource.
    static let gieDeviceTiltRight4E67 = DeveloperToolsSupport.ImageResource(name: "gie_deviceTilt_right_4e67", bundle: resourceBundle)

    /// The "gie_door" asset catalog image resource.
    static let gieDoor = DeveloperToolsSupport.ImageResource(name: "gie_door", bundle: resourceBundle)

    /// The "gie_down" asset catalog image resource.
    static let gieDown = DeveloperToolsSupport.ImageResource(name: "gie_down", bundle: resourceBundle)

    /// The "gie_downLeft" asset catalog image resource.
    static let gieDownLeft = DeveloperToolsSupport.ImageResource(name: "gie_downLeft", bundle: resourceBundle)

    /// The "gie_downRight" asset catalog image resource.
    static let gieDownRight = DeveloperToolsSupport.ImageResource(name: "gie_downRight", bundle: resourceBundle)

    /// The "gie_download" asset catalog image resource.
    static let gieDownload = DeveloperToolsSupport.ImageResource(name: "gie_download", bundle: resourceBundle)

    /// The "gie_download_aa46" asset catalog image resource.
    static let gieDownloadAa46 = DeveloperToolsSupport.ImageResource(name: "gie_download_aa46", bundle: resourceBundle)

    /// The "gie_exclamation" asset catalog image resource.
    static let gieExclamation = DeveloperToolsSupport.ImageResource(name: "gie_exclamation", bundle: resourceBundle)

    /// The "gie_exclamation_1e88" asset catalog image resource.
    static let gieExclamation1E88 = DeveloperToolsSupport.ImageResource(name: "gie_exclamation_1e88", bundle: resourceBundle)

    /// The "gie_exitLeft" asset catalog image resource.
    static let gieExitLeft = DeveloperToolsSupport.ImageResource(name: "gie_exitLeft", bundle: resourceBundle)

    /// The "gie_exitLeft_bea8" asset catalog image resource.
    static let gieExitLeftBea8 = DeveloperToolsSupport.ImageResource(name: "gie_exitLeft_bea8", bundle: resourceBundle)

    /// The "gie_export" asset catalog image resource.
    static let gieExport = DeveloperToolsSupport.ImageResource(name: "gie_export", bundle: resourceBundle)

    /// The "gie_fastForward" asset catalog image resource.
    static let gieFastForward = DeveloperToolsSupport.ImageResource(name: "gie_fastForward", bundle: resourceBundle)

    /// The "gie_fightFist" asset catalog image resource.
    static let gieFightFist = DeveloperToolsSupport.ImageResource(name: "gie_fightFist", bundle: resourceBundle)

    /// The "gie_fightFist_27f6" asset catalog image resource.
    static let gieFightFist27F6 = DeveloperToolsSupport.ImageResource(name: "gie_fightFist_27f6", bundle: resourceBundle)

    /// The "gie_fightFist_8da4" asset catalog image resource.
    static let gieFightFist8Da4 = DeveloperToolsSupport.ImageResource(name: "gie_fightFist_8da4", bundle: resourceBundle)

    /// The "gie_fightFist_circle" asset catalog image resource.
    static let gieFightFistCircle = DeveloperToolsSupport.ImageResource(name: "gie_fightFist_circle", bundle: resourceBundle)

    /// The "gie_fightFist_circle_9b4a" asset catalog image resource.
    static let gieFightFistCircle9B4A = DeveloperToolsSupport.ImageResource(name: "gie_fightFist_circle_9b4a", bundle: resourceBundle)

    /// The "gie_fightFist_dca9" asset catalog image resource.
    static let gieFightFistDca9 = DeveloperToolsSupport.ImageResource(name: "gie_fightFist_dca9", bundle: resourceBundle)

    /// The "gie_fightJoy_00" asset catalog image resource.
    static let gieFightJoy00 = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_00", bundle: resourceBundle)

    /// The "gie_fightJoy_00_2277" asset catalog image resource.
    static let gieFightJoy002277 = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_00_2277", bundle: resourceBundle)

    /// The "gie_fightJoy_00_26f2" asset catalog image resource.
    static let gieFightJoy0026F2 = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_00_26f2", bundle: resourceBundle)

    /// The "gie_fightJoy_00_5d9b" asset catalog image resource.
    static let gieFightJoy005D9B = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_00_5d9b", bundle: resourceBundle)

    /// The "gie_fightJoy_00_9b0b" asset catalog image resource.
    static let gieFightJoy009B0B = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_00_9b0b", bundle: resourceBundle)

    /// The "gie_fightJoy_01" asset catalog image resource.
    static let gieFightJoy01 = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_01", bundle: resourceBundle)

    /// The "gie_fightJoy_01_203a" asset catalog image resource.
    static let gieFightJoy01203A = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_01_203a", bundle: resourceBundle)

    /// The "gie_fightJoy_01_7246" asset catalog image resource.
    static let gieFightJoy017246 = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_01_7246", bundle: resourceBundle)

    /// The "gie_fightJoy_01_9fb3" asset catalog image resource.
    static let gieFightJoy019Fb3 = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_01_9fb3", bundle: resourceBundle)

    /// The "gie_fightJoy_01_d20d" asset catalog image resource.
    static let gieFightJoy01D20D = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_01_d20d", bundle: resourceBundle)

    /// The "gie_fightJoy_02" asset catalog image resource.
    static let gieFightJoy02 = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_02", bundle: resourceBundle)

    /// The "gie_fightJoy_03" asset catalog image resource.
    static let gieFightJoy03 = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_03", bundle: resourceBundle)

    /// The "gie_fightJoy_03_2342" asset catalog image resource.
    static let gieFightJoy032342 = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_03_2342", bundle: resourceBundle)

    /// The "gie_fightJoy_03_2c87" asset catalog image resource.
    static let gieFightJoy032C87 = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_03_2c87", bundle: resourceBundle)

    /// The "gie_fightJoy_03_5177" asset catalog image resource.
    static let gieFightJoy035177 = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_03_5177", bundle: resourceBundle)

    /// The "gie_fightJoy_03_8694" asset catalog image resource.
    static let gieFightJoy038694 = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_03_8694", bundle: resourceBundle)

    /// The "gie_fightJoy_04" asset catalog image resource.
    static let gieFightJoy04 = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_04", bundle: resourceBundle)

    /// The "gie_fightJoy_04_3961" asset catalog image resource.
    static let gieFightJoy043961 = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_04_3961", bundle: resourceBundle)

    /// The "gie_fightJoy_04_6458" asset catalog image resource.
    static let gieFightJoy046458 = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_04_6458", bundle: resourceBundle)

    /// The "gie_fightJoy_04_72ff" asset catalog image resource.
    static let gieFightJoy0472Ff = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_04_72ff", bundle: resourceBundle)

    /// The "gie_fightJoy_04_88b2" asset catalog image resource.
    static let gieFightJoy0488B2 = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_04_88b2", bundle: resourceBundle)

    /// The "gie_fightJoy_05" asset catalog image resource.
    static let gieFightJoy05 = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_05", bundle: resourceBundle)

    /// The "gie_fightJoy_05_158c" asset catalog image resource.
    static let gieFightJoy05158C = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_05_158c", bundle: resourceBundle)

    /// The "gie_fightJoy_05_5d1c" asset catalog image resource.
    static let gieFightJoy055D1C = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_05_5d1c", bundle: resourceBundle)

    /// The "gie_fightJoy_05_85c8" asset catalog image resource.
    static let gieFightJoy0585C8 = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_05_85c8", bundle: resourceBundle)

    /// The "gie_fightJoy_05_caa3" asset catalog image resource.
    static let gieFightJoy05Caa3 = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_05_caa3", bundle: resourceBundle)

    /// The "gie_fightJoy_06" asset catalog image resource.
    static let gieFightJoy06 = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_06", bundle: resourceBundle)

    /// The "gie_fightJoy_07" asset catalog image resource.
    static let gieFightJoy07 = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_07", bundle: resourceBundle)

    /// The "gie_fightJoy_08" asset catalog image resource.
    static let gieFightJoy08 = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_08", bundle: resourceBundle)

    /// The "gie_fightJoy_09" asset catalog image resource.
    static let gieFightJoy09 = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_09", bundle: resourceBundle)

    /// The "gie_fightJoy_10" asset catalog image resource.
    static let gieFightJoy10 = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_10", bundle: resourceBundle)

    /// The "gie_fightJoy_11" asset catalog image resource.
    static let gieFightJoy11 = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_11", bundle: resourceBundle)

    /// The "gie_fightJoy_12" asset catalog image resource.
    static let gieFightJoy12 = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_12", bundle: resourceBundle)

    /// The "gie_fightJoy_12_01c1" asset catalog image resource.
    static let gieFightJoy1201C1 = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_12_01c1", bundle: resourceBundle)

    /// The "gie_fightJoy_12_1be5" asset catalog image resource.
    static let gieFightJoy121Be5 = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_12_1be5", bundle: resourceBundle)

    /// The "gie_fightJoy_12_aca8" asset catalog image resource.
    static let gieFightJoy12Aca8 = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_12_aca8", bundle: resourceBundle)

    /// The "gie_fightJoy_12_ad36" asset catalog image resource.
    static let gieFightJoy12Ad36 = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_12_ad36", bundle: resourceBundle)

    /// The "gie_fightJoy_13" asset catalog image resource.
    static let gieFightJoy13 = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_13", bundle: resourceBundle)

    /// The "gie_fightJoy_13_725f" asset catalog image resource.
    static let gieFightJoy13725F = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_13_725f", bundle: resourceBundle)

    /// The "gie_fightJoy_13_7939" asset catalog image resource.
    static let gieFightJoy137939 = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_13_7939", bundle: resourceBundle)

    /// The "gie_fightJoy_13_8fbf" asset catalog image resource.
    static let gieFightJoy138Fbf = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_13_8fbf", bundle: resourceBundle)

    /// The "gie_fightJoy_13_f7d9" asset catalog image resource.
    static let gieFightJoy13F7D9 = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_13_f7d9", bundle: resourceBundle)

    /// The "gie_fightJoy_14" asset catalog image resource.
    static let gieFightJoy14 = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_14", bundle: resourceBundle)

    /// The "gie_fightJoy_15" asset catalog image resource.
    static let gieFightJoy15 = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_15", bundle: resourceBundle)

    /// The "gie_fightJoy_16" asset catalog image resource.
    static let gieFightJoy16 = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_16", bundle: resourceBundle)

    /// The "gie_fightJoy_16_36fd" asset catalog image resource.
    static let gieFightJoy1636Fd = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_16_36fd", bundle: resourceBundle)

    /// The "gie_fightJoy_16_ba23" asset catalog image resource.
    static let gieFightJoy16Ba23 = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_16_ba23", bundle: resourceBundle)

    /// The "gie_fightJoy_16_e1ec" asset catalog image resource.
    static let gieFightJoy16E1Ec = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_16_e1ec", bundle: resourceBundle)

    /// The "gie_fightJoy_16_f67c" asset catalog image resource.
    static let gieFightJoy16F67C = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_16_f67c", bundle: resourceBundle)

    /// The "gie_fightJoy_18" asset catalog image resource.
    static let gieFightJoy18 = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_18", bundle: resourceBundle)

    /// The "gie_fightJoy_18_61c1" asset catalog image resource.
    static let gieFightJoy1861C1 = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_18_61c1", bundle: resourceBundle)

    /// The "gie_fightJoy_18_d913" asset catalog image resource.
    static let gieFightJoy18D913 = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_18_d913", bundle: resourceBundle)

    /// The "gie_fightJoy_18_fc08" asset catalog image resource.
    static let gieFightJoy18Fc08 = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_18_fc08", bundle: resourceBundle)

    /// The "gie_fightJoy_19" asset catalog image resource.
    static let gieFightJoy19 = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_19", bundle: resourceBundle)

    /// The "gie_fightJoy_19_1bd5" asset catalog image resource.
    static let gieFightJoy191Bd5 = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_19_1bd5", bundle: resourceBundle)

    /// The "gie_fightJoy_19_60f3" asset catalog image resource.
    static let gieFightJoy1960F3 = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_19_60f3", bundle: resourceBundle)

    /// The "gie_fightJoy_19_873f" asset catalog image resource.
    static let gieFightJoy19873F = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_19_873f", bundle: resourceBundle)

    /// The "gie_fightJoy_20" asset catalog image resource.
    static let gieFightJoy20 = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_20", bundle: resourceBundle)

    /// The "gie_fightJoy_20_8a59" asset catalog image resource.
    static let gieFightJoy208A59 = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_20_8a59", bundle: resourceBundle)

    /// The "gie_fightJoy_20_db36" asset catalog image resource.
    static let gieFightJoy20Db36 = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_20_db36", bundle: resourceBundle)

    /// The "gie_fightJoy_20_e08b" asset catalog image resource.
    static let gieFightJoy20E08B = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_20_e08b", bundle: resourceBundle)

    /// The "gie_fightJoy_21" asset catalog image resource.
    static let gieFightJoy21 = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_21", bundle: resourceBundle)

    /// The "gie_fightJoy_21_0286" asset catalog image resource.
    static let gieFightJoy210286 = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_21_0286", bundle: resourceBundle)

    /// The "gie_fightJoy_21_281a" asset catalog image resource.
    static let gieFightJoy21281A = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_21_281a", bundle: resourceBundle)

    /// The "gie_fightJoy_21_e733" asset catalog image resource.
    static let gieFightJoy21E733 = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_21_e733", bundle: resourceBundle)

    /// The "gie_fightJoy_22" asset catalog image resource.
    static let gieFightJoy22 = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_22", bundle: resourceBundle)

    /// The "gie_fightJoy_22_1562" asset catalog image resource.
    static let gieFightJoy221562 = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_22_1562", bundle: resourceBundle)

    /// The "gie_fightJoy_22_8dff" asset catalog image resource.
    static let gieFightJoy228Dff = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_22_8dff", bundle: resourceBundle)

    /// The "gie_fightJoy_22_8f55" asset catalog image resource.
    static let gieFightJoy228F55 = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_22_8f55", bundle: resourceBundle)

    /// The "gie_fightJoy_23" asset catalog image resource.
    static let gieFightJoy23 = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_23", bundle: resourceBundle)

    /// The "gie_fightJoy_23_097e" asset catalog image resource.
    static let gieFightJoy23097E = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_23_097e", bundle: resourceBundle)

    /// The "gie_fightJoy_23_0a39" asset catalog image resource.
    static let gieFightJoy230A39 = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_23_0a39", bundle: resourceBundle)

    /// The "gie_fightJoy_23_8d97" asset catalog image resource.
    static let gieFightJoy238D97 = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_23_8d97", bundle: resourceBundle)

    /// The "gie_fightJoy_24" asset catalog image resource.
    static let gieFightJoy24 = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_24", bundle: resourceBundle)

    /// The "gie_fightJoy_24_4469" asset catalog image resource.
    static let gieFightJoy244469 = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_24_4469", bundle: resourceBundle)

    /// The "gie_fightJoy_24_90ac" asset catalog image resource.
    static let gieFightJoy2490Ac = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_24_90ac", bundle: resourceBundle)

    /// The "gie_fightJoy_24_a20e" asset catalog image resource.
    static let gieFightJoy24A20E = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_24_a20e", bundle: resourceBundle)

    /// The "gie_fightJoy_25" asset catalog image resource.
    static let gieFightJoy25 = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_25", bundle: resourceBundle)

    /// The "gie_fightJoy_25_1ff3" asset catalog image resource.
    static let gieFightJoy251Ff3 = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_25_1ff3", bundle: resourceBundle)

    /// The "gie_fightJoy_25_9982" asset catalog image resource.
    static let gieFightJoy259982 = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_25_9982", bundle: resourceBundle)

    /// The "gie_fightJoy_25_b78e" asset catalog image resource.
    static let gieFightJoy25B78E = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_25_b78e", bundle: resourceBundle)

    /// The "gie_fightJoy_27" asset catalog image resource.
    static let gieFightJoy27 = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_27", bundle: resourceBundle)

    /// The "gie_fightJoy_27_9a95" asset catalog image resource.
    static let gieFightJoy279A95 = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_27_9a95", bundle: resourceBundle)

    /// The "gie_fightJoy_27_b2e5" asset catalog image resource.
    static let gieFightJoy27B2E5 = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_27_b2e5", bundle: resourceBundle)

    /// The "gie_fightJoy_27_f2c2" asset catalog image resource.
    static let gieFightJoy27F2C2 = DeveloperToolsSupport.ImageResource(name: "gie_fightJoy_27_f2c2", bundle: resourceBundle)

    /// The "gie_fightPlus" asset catalog image resource.
    static let gieFightPlus = DeveloperToolsSupport.ImageResource(name: "gie_fightPlus", bundle: resourceBundle)

    /// The "gie_fightPlus_c338" asset catalog image resource.
    static let gieFightPlusC338 = DeveloperToolsSupport.ImageResource(name: "gie_fightPlus_c338", bundle: resourceBundle)

    /// The "gie_figurine" asset catalog image resource.
    static let gieFigurine = DeveloperToolsSupport.ImageResource(name: "gie_figurine", bundle: resourceBundle)

    /// The "gie_figurine_045b" asset catalog image resource.
    static let gieFigurine045B = DeveloperToolsSupport.ImageResource(name: "gie_figurine_045b", bundle: resourceBundle)

    /// The "gie_figurine_4fd9" asset catalog image resource.
    static let gieFigurine4Fd9 = DeveloperToolsSupport.ImageResource(name: "gie_figurine_4fd9", bundle: resourceBundle)

    /// The "gie_figurine_ffb1" asset catalog image resource.
    static let gieFigurineFfb1 = DeveloperToolsSupport.ImageResource(name: "gie_figurine_ffb1", bundle: resourceBundle)

    /// The "gie_flag" asset catalog image resource.
    static let gieFlag = DeveloperToolsSupport.ImageResource(name: "gie_flag", bundle: resourceBundle)

    /// The "gie_flag_8f37" asset catalog image resource.
    static let gieFlag8F37 = DeveloperToolsSupport.ImageResource(name: "gie_flag_8f37", bundle: resourceBundle)

    /// The "gie_forward" asset catalog image resource.
    static let gieForward = DeveloperToolsSupport.ImageResource(name: "gie_forward", bundle: resourceBundle)

    /// The "gie_gamepad1" asset catalog image resource.
    static let gieGamepad1 = DeveloperToolsSupport.ImageResource(name: "gie_gamepad1", bundle: resourceBundle)

    /// The "gie_gamepad3" asset catalog image resource.
    static let gieGamepad3 = DeveloperToolsSupport.ImageResource(name: "gie_gamepad3", bundle: resourceBundle)

    /// The "gie_gamepad3_86ef" asset catalog image resource.
    static let gieGamepad386Ef = DeveloperToolsSupport.ImageResource(name: "gie_gamepad3_86ef", bundle: resourceBundle)

    /// The "gie_gamepad4" asset catalog image resource.
    static let gieGamepad4 = DeveloperToolsSupport.ImageResource(name: "gie_gamepad4", bundle: resourceBundle)

    /// The "gie_home" asset catalog image resource.
    static let gieHome = DeveloperToolsSupport.ImageResource(name: "gie_home", bundle: resourceBundle)

    /// The "gie_import" asset catalog image resource.
    static let gieImport = DeveloperToolsSupport.ImageResource(name: "gie_import", bundle: resourceBundle)

    /// The "gie_joystick" asset catalog image resource.
    static let gieJoystick = DeveloperToolsSupport.ImageResource(name: "gie_joystick", bundle: resourceBundle)

    /// The "gie_joystickL_top" asset catalog image resource.
    static let gieJoystickLTop = DeveloperToolsSupport.ImageResource(name: "gie_joystickL_top", bundle: resourceBundle)

    /// The "gie_joystickL_top_17de" asset catalog image resource.
    static let gieJoystickLTop17De = DeveloperToolsSupport.ImageResource(name: "gie_joystickL_top_17de", bundle: resourceBundle)

    /// The "gie_joystickL_top_441d" asset catalog image resource.
    static let gieJoystickLTop441D = DeveloperToolsSupport.ImageResource(name: "gie_joystickL_top_441d", bundle: resourceBundle)

    /// The "gie_joystickL_top_5453" asset catalog image resource.
    static let gieJoystickLTop5453 = DeveloperToolsSupport.ImageResource(name: "gie_joystickL_top_5453", bundle: resourceBundle)

    /// The "gie_joystickLeft" asset catalog image resource.
    static let gieJoystickLeft = DeveloperToolsSupport.ImageResource(name: "gie_joystickLeft", bundle: resourceBundle)

    /// The "gie_joystickLeft_0a0b" asset catalog image resource.
    static let gieJoystickLeft0A0B = DeveloperToolsSupport.ImageResource(name: "gie_joystickLeft_0a0b", bundle: resourceBundle)

    /// The "gie_joystickLeft_b90a" asset catalog image resource.
    static let gieJoystickLeftB90A = DeveloperToolsSupport.ImageResource(name: "gie_joystickLeft_b90a", bundle: resourceBundle)

    /// The "gie_joystickLeft_bbb6" asset catalog image resource.
    static let gieJoystickLeftBbb6 = DeveloperToolsSupport.ImageResource(name: "gie_joystickLeft_bbb6", bundle: resourceBundle)

    /// The "gie_joystickLeft_e1cd" asset catalog image resource.
    static let gieJoystickLeftE1Cd = DeveloperToolsSupport.ImageResource(name: "gie_joystickLeft_e1cd", bundle: resourceBundle)

    /// The "gie_joystickR_side" asset catalog image resource.
    static let gieJoystickRSide = DeveloperToolsSupport.ImageResource(name: "gie_joystickR_side", bundle: resourceBundle)

    /// The "gie_joystickR_side_2cba" asset catalog image resource.
    static let gieJoystickRSide2Cba = DeveloperToolsSupport.ImageResource(name: "gie_joystickR_side_2cba", bundle: resourceBundle)

    /// The "gie_joystickR_side_43d1" asset catalog image resource.
    static let gieJoystickRSide43D1 = DeveloperToolsSupport.ImageResource(name: "gie_joystickR_side_43d1", bundle: resourceBundle)

    /// The "gie_joystickR_side_e4d1" asset catalog image resource.
    static let gieJoystickRSideE4D1 = DeveloperToolsSupport.ImageResource(name: "gie_joystickR_side_e4d1", bundle: resourceBundle)

    /// The "gie_joystickRight" asset catalog image resource.
    static let gieJoystickRight = DeveloperToolsSupport.ImageResource(name: "gie_joystickRight", bundle: resourceBundle)

    /// The "gie_joystickRight_2ebc" asset catalog image resource.
    static let gieJoystickRight2Ebc = DeveloperToolsSupport.ImageResource(name: "gie_joystickRight_2ebc", bundle: resourceBundle)

    /// The "gie_joystickRight_c013" asset catalog image resource.
    static let gieJoystickRightC013 = DeveloperToolsSupport.ImageResource(name: "gie_joystickRight_c013", bundle: resourceBundle)

    /// The "gie_joystickRight_d3b2" asset catalog image resource.
    static let gieJoystickRightD3B2 = DeveloperToolsSupport.ImageResource(name: "gie_joystickRight_d3b2", bundle: resourceBundle)

    /// The "gie_joystickRight_d781" asset catalog image resource.
    static let gieJoystickRightD781 = DeveloperToolsSupport.ImageResource(name: "gie_joystickRight_d781", bundle: resourceBundle)

    /// The "gie_joystick_061a" asset catalog image resource.
    static let gieJoystick061A = DeveloperToolsSupport.ImageResource(name: "gie_joystick_061a", bundle: resourceBundle)

    /// The "gie_key" asset catalog image resource.
    static let gieKey = DeveloperToolsSupport.ImageResource(name: "gie_key", bundle: resourceBundle)

    /// The "gie_keyLarge_3d" asset catalog image resource.
    static let gieKeyLarge3D = DeveloperToolsSupport.ImageResource(name: "gie_keyLarge_3d", bundle: resourceBundle)

    /// The "gie_keyLarge_3d_0116" asset catalog image resource.
    static let gieKeyLarge3D0116 = DeveloperToolsSupport.ImageResource(name: "gie_keyLarge_3d_0116", bundle: resourceBundle)

    /// The "gie_keyLarge_3d_c78c" asset catalog image resource.
    static let gieKeyLarge3DC78C = DeveloperToolsSupport.ImageResource(name: "gie_keyLarge_3d_c78c", bundle: resourceBundle)

    /// The "gie_keyLarge_3d_e9cb" asset catalog image resource.
    static let gieKeyLarge3DE9Cb = DeveloperToolsSupport.ImageResource(name: "gie_keyLarge_3d_e9cb", bundle: resourceBundle)

    /// The "gie_keySmall" asset catalog image resource.
    static let gieKeySmall = DeveloperToolsSupport.ImageResource(name: "gie_keySmall", bundle: resourceBundle)

    /// The "gie_keySmall_2d83" asset catalog image resource.
    static let gieKeySmall2D83 = DeveloperToolsSupport.ImageResource(name: "gie_keySmall_2d83", bundle: resourceBundle)

    /// The "gie_keySmall_6706" asset catalog image resource.
    static let gieKeySmall6706 = DeveloperToolsSupport.ImageResource(name: "gie_keySmall_6706", bundle: resourceBundle)

    /// The "gie_keySmall_89e6" asset catalog image resource.
    static let gieKeySmall89E6 = DeveloperToolsSupport.ImageResource(name: "gie_keySmall_89e6", bundle: resourceBundle)

    /// The "gie_key_08be" asset catalog image resource.
    static let gieKey08Be = DeveloperToolsSupport.ImageResource(name: "gie_key_08be", bundle: resourceBundle)

    /// The "gie_key_1205" asset catalog image resource.
    static let gieKey1205 = DeveloperToolsSupport.ImageResource(name: "gie_key_1205", bundle: resourceBundle)

    /// The "gie_key_e44f" asset catalog image resource.
    static let gieKeyE44F = DeveloperToolsSupport.ImageResource(name: "gie_key_e44f", bundle: resourceBundle)

    /// The "gie_leaderboardsComplex" asset catalog image resource.
    static let gieLeaderboardsComplex = DeveloperToolsSupport.ImageResource(name: "gie_leaderboardsComplex", bundle: resourceBundle)

    /// The "gie_leaderboardsSimple" asset catalog image resource.
    static let gieLeaderboardsSimple = DeveloperToolsSupport.ImageResource(name: "gie_leaderboardsSimple", bundle: resourceBundle)

    /// The "gie_left" asset catalog image resource.
    static let gieLeft = DeveloperToolsSupport.ImageResource(name: "gie_left", bundle: resourceBundle)

    /// The "gie_locked" asset catalog image resource.
    static let gieLocked = DeveloperToolsSupport.ImageResource(name: "gie_locked", bundle: resourceBundle)

    /// The "gie_massiveMultiplayer" asset catalog image resource.
    static let gieMassiveMultiplayer = DeveloperToolsSupport.ImageResource(name: "gie_massiveMultiplayer", bundle: resourceBundle)

    /// The "gie_medal1" asset catalog image resource.
    static let gieMedal1 = DeveloperToolsSupport.ImageResource(name: "gie_medal1", bundle: resourceBundle)

    /// The "gie_medal1_20e1" asset catalog image resource.
    static let gieMedal120E1 = DeveloperToolsSupport.ImageResource(name: "gie_medal1_20e1", bundle: resourceBundle)

    /// The "gie_medal2" asset catalog image resource.
    static let gieMedal2 = DeveloperToolsSupport.ImageResource(name: "gie_medal2", bundle: resourceBundle)

    /// The "gie_menuGrid" asset catalog image resource.
    static let gieMenuGrid = DeveloperToolsSupport.ImageResource(name: "gie_menuGrid", bundle: resourceBundle)

    /// The "gie_menuList" asset catalog image resource.
    static let gieMenuList = DeveloperToolsSupport.ImageResource(name: "gie_menuList", bundle: resourceBundle)

    /// The "gie_minus" asset catalog image resource.
    static let gieMinus = DeveloperToolsSupport.ImageResource(name: "gie_minus", bundle: resourceBundle)

    /// The "gie_minus_a6e6" asset catalog image resource.
    static let gieMinusA6E6 = DeveloperToolsSupport.ImageResource(name: "gie_minus_a6e6", bundle: resourceBundle)

    /// The "gie_mouse" asset catalog image resource.
    static let gieMouse = DeveloperToolsSupport.ImageResource(name: "gie_mouse", bundle: resourceBundle)

    /// The "gie_mouseLeft" asset catalog image resource.
    static let gieMouseLeft = DeveloperToolsSupport.ImageResource(name: "gie_mouseLeft", bundle: resourceBundle)

    /// The "gie_mouseLeft_c0f1" asset catalog image resource.
    static let gieMouseLeftC0F1 = DeveloperToolsSupport.ImageResource(name: "gie_mouseLeft_c0f1", bundle: resourceBundle)

    /// The "gie_mouseMiddle" asset catalog image resource.
    static let gieMouseMiddle = DeveloperToolsSupport.ImageResource(name: "gie_mouseMiddle", bundle: resourceBundle)

    /// The "gie_mouseMiddle_15d3" asset catalog image resource.
    static let gieMouseMiddle15D3 = DeveloperToolsSupport.ImageResource(name: "gie_mouseMiddle_15d3", bundle: resourceBundle)

    /// The "gie_mouseMiddle_3172" asset catalog image resource.
    static let gieMouseMiddle3172 = DeveloperToolsSupport.ImageResource(name: "gie_mouseMiddle_3172", bundle: resourceBundle)

    /// The "gie_mouseMiddle_9019" asset catalog image resource.
    static let gieMouseMiddle9019 = DeveloperToolsSupport.ImageResource(name: "gie_mouseMiddle_9019", bundle: resourceBundle)

    /// The "gie_mouseRight" asset catalog image resource.
    static let gieMouseRight = DeveloperToolsSupport.ImageResource(name: "gie_mouseRight", bundle: resourceBundle)

    /// The "gie_mouseRight_af97" asset catalog image resource.
    static let gieMouseRightAf97 = DeveloperToolsSupport.ImageResource(name: "gie_mouseRight_af97", bundle: resourceBundle)

    /// The "gie_movie" asset catalog image resource.
    static let gieMovie = DeveloperToolsSupport.ImageResource(name: "gie_movie", bundle: resourceBundle)

    /// The "gie_movie_875a" asset catalog image resource.
    static let gieMovie875A = DeveloperToolsSupport.ImageResource(name: "gie_movie_875a", bundle: resourceBundle)

    /// The "gie_multiplayer" asset catalog image resource.
    static let gieMultiplayer = DeveloperToolsSupport.ImageResource(name: "gie_multiplayer", bundle: resourceBundle)

    /// The "gie_musicOn" asset catalog image resource.
    static let gieMusicOn = DeveloperToolsSupport.ImageResource(name: "gie_musicOn", bundle: resourceBundle)

    /// The "gie_next" asset catalog image resource.
    static let gieNext = DeveloperToolsSupport.ImageResource(name: "gie_next", bundle: resourceBundle)

    /// The "gie_open" asset catalog image resource.
    static let gieOpen = DeveloperToolsSupport.ImageResource(name: "gie_open", bundle: resourceBundle)

    /// The "gie_pause" asset catalog image resource.
    static let giePause = DeveloperToolsSupport.ImageResource(name: "gie_pause", bundle: resourceBundle)

    /// The "gie_pause_bdb2" asset catalog image resource.
    static let giePauseBdb2 = DeveloperToolsSupport.ImageResource(name: "gie_pause_bdb2", bundle: resourceBundle)

    /// The "gie_phone" asset catalog image resource.
    static let giePhone = DeveloperToolsSupport.ImageResource(name: "gie_phone", bundle: resourceBundle)

    /// The "gie_phone_76a1" asset catalog image resource.
    static let giePhone76A1 = DeveloperToolsSupport.ImageResource(name: "gie_phone_76a1", bundle: resourceBundle)

    /// The "gie_plus" asset catalog image resource.
    static let giePlus = DeveloperToolsSupport.ImageResource(name: "gie_plus", bundle: resourceBundle)

    /// The "gie_plus_aa73" asset catalog image resource.
    static let giePlusAa73 = DeveloperToolsSupport.ImageResource(name: "gie_plus_aa73", bundle: resourceBundle)

    /// The "gie_plus_b733" asset catalog image resource.
    static let giePlusB733 = DeveloperToolsSupport.ImageResource(name: "gie_plus_b733", bundle: resourceBundle)

    /// The "gie_power" asset catalog image resource.
    static let giePower = DeveloperToolsSupport.ImageResource(name: "gie_power", bundle: resourceBundle)

    /// The "gie_previous" asset catalog image resource.
    static let giePrevious = DeveloperToolsSupport.ImageResource(name: "gie_previous", bundle: resourceBundle)

    /// The "gie_previous_016d" asset catalog image resource.
    static let giePrevious016D = DeveloperToolsSupport.ImageResource(name: "gie_previous_016d", bundle: resourceBundle)

    /// The "gie_question" asset catalog image resource.
    static let gieQuestion = DeveloperToolsSupport.ImageResource(name: "gie_question", bundle: resourceBundle)

    /// The "gie_question_b421" asset catalog image resource.
    static let gieQuestionB421 = DeveloperToolsSupport.ImageResource(name: "gie_question_b421", bundle: resourceBundle)

    /// The "gie_return" asset catalog image resource.
    static let gieReturn = DeveloperToolsSupport.ImageResource(name: "gie_return", bundle: resourceBundle)

    /// The "gie_rewind" asset catalog image resource.
    static let gieRewind = DeveloperToolsSupport.ImageResource(name: "gie_rewind", bundle: resourceBundle)

    /// The "gie_rewind_329e" asset catalog image resource.
    static let gieRewind329E = DeveloperToolsSupport.ImageResource(name: "gie_rewind_329e", bundle: resourceBundle)

    /// The "gie_save" asset catalog image resource.
    static let gieSave = DeveloperToolsSupport.ImageResource(name: "gie_save", bundle: resourceBundle)

    /// The "gie_scrollHorizontal" asset catalog image resource.
    static let gieScrollHorizontal = DeveloperToolsSupport.ImageResource(name: "gie_scrollHorizontal", bundle: resourceBundle)

    /// The "gie_scrollVertical" asset catalog image resource.
    static let gieScrollVertical = DeveloperToolsSupport.ImageResource(name: "gie_scrollVertical", bundle: resourceBundle)

    /// The "gie_scrollVertical_f276" asset catalog image resource.
    static let gieScrollVerticalF276 = DeveloperToolsSupport.ImageResource(name: "gie_scrollVertical_f276", bundle: resourceBundle)

    /// The "gie_share1" asset catalog image resource.
    static let gieShare1 = DeveloperToolsSupport.ImageResource(name: "gie_share1", bundle: resourceBundle)

    /// The "gie_share1_9326" asset catalog image resource.
    static let gieShare19326 = DeveloperToolsSupport.ImageResource(name: "gie_share1_9326", bundle: resourceBundle)

    /// The "gie_share1_b5af" asset catalog image resource.
    static let gieShare1B5Af = DeveloperToolsSupport.ImageResource(name: "gie_share1_b5af", bundle: resourceBundle)

    /// The "gie_share2" asset catalog image resource.
    static let gieShare2 = DeveloperToolsSupport.ImageResource(name: "gie_share2", bundle: resourceBundle)

    /// The "gie_share2_e0b8" asset catalog image resource.
    static let gieShare2E0B8 = DeveloperToolsSupport.ImageResource(name: "gie_share2_e0b8", bundle: resourceBundle)

    /// The "gie_signal1" asset catalog image resource.
    static let gieSignal1 = DeveloperToolsSupport.ImageResource(name: "gie_signal1", bundle: resourceBundle)

    /// The "gie_signal3" asset catalog image resource.
    static let gieSignal3 = DeveloperToolsSupport.ImageResource(name: "gie_signal3", bundle: resourceBundle)

    /// The "gie_singleplayer" asset catalog image resource.
    static let gieSingleplayer = DeveloperToolsSupport.ImageResource(name: "gie_singleplayer", bundle: resourceBundle)

    /// The "gie_smaller" asset catalog image resource.
    static let gieSmaller = DeveloperToolsSupport.ImageResource(name: "gie_smaller", bundle: resourceBundle)

    /// The "gie_smaller_1937" asset catalog image resource.
    static let gieSmaller1937 = DeveloperToolsSupport.ImageResource(name: "gie_smaller_1937", bundle: resourceBundle)

    /// The "gie_star" asset catalog image resource.
    static let gieStar = DeveloperToolsSupport.ImageResource(name: "gie_star", bundle: resourceBundle)

    /// The "gie_target" asset catalog image resource.
    static let gieTarget = DeveloperToolsSupport.ImageResource(name: "gie_target", bundle: resourceBundle)

    /// The "gie_target_a7b0" asset catalog image resource.
    static let gieTargetA7B0 = DeveloperToolsSupport.ImageResource(name: "gie_target_a7b0", bundle: resourceBundle)

    /// The "gie_toolPencil" asset catalog image resource.
    static let gieToolPencil = DeveloperToolsSupport.ImageResource(name: "gie_toolPencil", bundle: resourceBundle)

    /// The "gie_toolPencil_73f9" asset catalog image resource.
    static let gieToolPencil73F9 = DeveloperToolsSupport.ImageResource(name: "gie_toolPencil_73f9", bundle: resourceBundle)

    /// The "gie_toolPencil_74b4" asset catalog image resource.
    static let gieToolPencil74B4 = DeveloperToolsSupport.ImageResource(name: "gie_toolPencil_74b4", bundle: resourceBundle)

    /// The "gie_toolPencil_dc4f" asset catalog image resource.
    static let gieToolPencilDc4F = DeveloperToolsSupport.ImageResource(name: "gie_toolPencil_dc4f", bundle: resourceBundle)

    /// The "gie_trashcan" asset catalog image resource.
    static let gieTrashcan = DeveloperToolsSupport.ImageResource(name: "gie_trashcan", bundle: resourceBundle)

    /// The "gie_trophy" asset catalog image resource.
    static let gieTrophy = DeveloperToolsSupport.ImageResource(name: "gie_trophy", bundle: resourceBundle)

    /// The "gie_trophy_3c0c" asset catalog image resource.
    static let gieTrophy3C0C = DeveloperToolsSupport.ImageResource(name: "gie_trophy_3c0c", bundle: resourceBundle)

    /// The "gie_trophy_6570" asset catalog image resource.
    static let gieTrophy6570 = DeveloperToolsSupport.ImageResource(name: "gie_trophy_6570", bundle: resourceBundle)

    /// The "gie_unlocked" asset catalog image resource.
    static let gieUnlocked = DeveloperToolsSupport.ImageResource(name: "gie_unlocked", bundle: resourceBundle)

    /// The "gie_up" asset catalog image resource.
    static let gieUp = DeveloperToolsSupport.ImageResource(name: "gie_up", bundle: resourceBundle)

    /// The "gie_upLeft" asset catalog image resource.
    static let gieUpLeft = DeveloperToolsSupport.ImageResource(name: "gie_upLeft", bundle: resourceBundle)

    /// The "gie_upLeft_1b9d" asset catalog image resource.
    static let gieUpLeft1B9D = DeveloperToolsSupport.ImageResource(name: "gie_upLeft_1b9d", bundle: resourceBundle)

    /// The "gie_upLeft_fa32" asset catalog image resource.
    static let gieUpLeftFa32 = DeveloperToolsSupport.ImageResource(name: "gie_upLeft_fa32", bundle: resourceBundle)

    /// The "gie_upRight" asset catalog image resource.
    static let gieUpRight = DeveloperToolsSupport.ImageResource(name: "gie_upRight", bundle: resourceBundle)

    /// The "gie_upRight_1a1d" asset catalog image resource.
    static let gieUpRight1A1D = DeveloperToolsSupport.ImageResource(name: "gie_upRight_1a1d", bundle: resourceBundle)

    /// The "gie_upload" asset catalog image resource.
    static let gieUpload = DeveloperToolsSupport.ImageResource(name: "gie_upload", bundle: resourceBundle)

    /// The "gie_upload_1118" asset catalog image resource.
    static let gieUpload1118 = DeveloperToolsSupport.ImageResource(name: "gie_upload_1118", bundle: resourceBundle)

    /// The "gie_upload_610a" asset catalog image resource.
    static let gieUpload610A = DeveloperToolsSupport.ImageResource(name: "gie_upload_610a", bundle: resourceBundle)

    /// The "gie_upload_a9bc" asset catalog image resource.
    static let gieUploadA9Bc = DeveloperToolsSupport.ImageResource(name: "gie_upload_a9bc", bundle: resourceBundle)

    /// The "gie_video" asset catalog image resource.
    static let gieVideo = DeveloperToolsSupport.ImageResource(name: "gie_video", bundle: resourceBundle)

    /// The "gie_video_9565" asset catalog image resource.
    static let gieVideo9565 = DeveloperToolsSupport.ImageResource(name: "gie_video_9565", bundle: resourceBundle)

    /// The "gie_wrench" asset catalog image resource.
    static let gieWrench = DeveloperToolsSupport.ImageResource(name: "gie_wrench", bundle: resourceBundle)

    /// The "gie_zoom" asset catalog image resource.
    static let gieZoom = DeveloperToolsSupport.ImageResource(name: "gie_zoom", bundle: resourceBundle)

    /// The "gie_zoomDefault" asset catalog image resource.
    static let gieZoomDefault = DeveloperToolsSupport.ImageResource(name: "gie_zoomDefault", bundle: resourceBundle)

    /// The "gie_zoomIn" asset catalog image resource.
    static let gieZoomIn = DeveloperToolsSupport.ImageResource(name: "gie_zoomIn", bundle: resourceBundle)

    /// The "gie_zoomOut" asset catalog image resource.
    static let gieZoomOut = DeveloperToolsSupport.ImageResource(name: "gie_zoomOut", bundle: resourceBundle)

    /// The "goblin" asset catalog image resource.
    static let goblin = DeveloperToolsSupport.ImageResource(name: "goblin", bundle: resourceBundle)

    /// The "gold_bag" asset catalog image resource.
    static let goldBag = DeveloperToolsSupport.ImageResource(name: "gold_bag", bundle: resourceBundle)

    /// The "gold_coin" asset catalog image resource.
    static let goldCoin = DeveloperToolsSupport.ImageResource(name: "gold_coin", bundle: resourceBundle)

    /// The "golden_key" asset catalog image resource.
    static let goldenKey = DeveloperToolsSupport.ImageResource(name: "golden_key", bundle: resourceBundle)

    /// The "golem" asset catalog image resource.
    static let golem = DeveloperToolsSupport.ImageResource(name: "golem", bundle: resourceBundle)

    /// The "health_potion" asset catalog image resource.
    static let healthPotion = DeveloperToolsSupport.ImageResource(name: "health_potion", bundle: resourceBundle)

    /// The "heart" asset catalog image resource.
    static let heart = DeveloperToolsSupport.ImageResource(name: "heart", bundle: resourceBundle)

    /// The "hero_archer" asset catalog image resource.
    static let heroArcher = DeveloperToolsSupport.ImageResource(name: "hero_archer", bundle: resourceBundle)

    /// The "hero_dwarf" asset catalog image resource.
    static let heroDwarf = DeveloperToolsSupport.ImageResource(name: "hero_dwarf", bundle: resourceBundle)

    /// The "hero_knight" asset catalog image resource.
    static let heroKnight = DeveloperToolsSupport.ImageResource(name: "hero_knight", bundle: resourceBundle)

    /// The "hero_wizard" asset catalog image resource.
    static let heroWizard = DeveloperToolsSupport.ImageResource(name: "hero_wizard", bundle: resourceBundle)

    /// The "keg_stool" asset catalog image resource.
    static let kegStool = DeveloperToolsSupport.ImageResource(name: "keg_stool", bundle: resourceBundle)

    /// The "lantern" asset catalog image resource.
    static let lantern = DeveloperToolsSupport.ImageResource(name: "lantern", bundle: resourceBundle)

    /// The "mace" asset catalog image resource.
    static let mace = DeveloperToolsSupport.ImageResource(name: "mace", bundle: resourceBundle)

    /// The "magic_staff" asset catalog image resource.
    static let magicStaff = DeveloperToolsSupport.ImageResource(name: "magic_staff", bundle: resourceBundle)

    /// The "mana_potion" asset catalog image resource.
    static let manaPotion = DeveloperToolsSupport.ImageResource(name: "mana_potion", bundle: resourceBundle)

    /// The "mushrooms" asset catalog image resource.
    static let mushrooms = DeveloperToolsSupport.ImageResource(name: "mushrooms", bundle: resourceBundle)

    /// The "np_block_blue" asset catalog image resource.
    static let npBlockBlue = DeveloperToolsSupport.ImageResource(name: "np_block_blue", bundle: resourceBundle)

    /// The "np_block_coin_active" asset catalog image resource.
    static let npBlockCoinActive = DeveloperToolsSupport.ImageResource(name: "np_block_coin_active", bundle: resourceBundle)

    /// The "np_block_coin_active_8981" asset catalog image resource.
    static let npBlockCoinActive8981 = DeveloperToolsSupport.ImageResource(name: "np_block_coin_active_8981", bundle: resourceBundle)

    /// The "np_block_exclamation" asset catalog image resource.
    static let npBlockExclamation = DeveloperToolsSupport.ImageResource(name: "np_block_exclamation", bundle: resourceBundle)

    /// The "np_block_exclamation_active" asset catalog image resource.
    static let npBlockExclamationActive = DeveloperToolsSupport.ImageResource(name: "np_block_exclamation_active", bundle: resourceBundle)

    /// The "np_block_exclamation_active_6365" asset catalog image resource.
    static let npBlockExclamationActive6365 = DeveloperToolsSupport.ImageResource(name: "np_block_exclamation_active_6365", bundle: resourceBundle)

    /// The "np_block_exclamation_cc5a" asset catalog image resource.
    static let npBlockExclamationCc5A = DeveloperToolsSupport.ImageResource(name: "np_block_exclamation_cc5a", bundle: resourceBundle)

    /// The "np_block_red" asset catalog image resource.
    static let npBlockRed = DeveloperToolsSupport.ImageResource(name: "np_block_red", bundle: resourceBundle)

    /// The "np_block_strong_coin_active" asset catalog image resource.
    static let npBlockStrongCoinActive = DeveloperToolsSupport.ImageResource(name: "np_block_strong_coin_active", bundle: resourceBundle)

    /// The "np_block_strong_coin_active_6c30" asset catalog image resource.
    static let npBlockStrongCoinActive6C30 = DeveloperToolsSupport.ImageResource(name: "np_block_strong_coin_active_6c30", bundle: resourceBundle)

    /// The "np_block_strong_danger_active" asset catalog image resource.
    static let npBlockStrongDangerActive = DeveloperToolsSupport.ImageResource(name: "np_block_strong_danger_active", bundle: resourceBundle)

    /// The "np_block_strong_empty" asset catalog image resource.
    static let npBlockStrongEmpty = DeveloperToolsSupport.ImageResource(name: "np_block_strong_empty", bundle: resourceBundle)

    /// The "np_block_strong_empty_6f37" asset catalog image resource.
    static let npBlockStrongEmpty6F37 = DeveloperToolsSupport.ImageResource(name: "np_block_strong_empty_6f37", bundle: resourceBundle)

    /// The "np_block_strong_exclamation" asset catalog image resource.
    static let npBlockStrongExclamation = DeveloperToolsSupport.ImageResource(name: "np_block_strong_exclamation", bundle: resourceBundle)

    /// The "np_block_strong_exclamation_7bb0" asset catalog image resource.
    static let npBlockStrongExclamation7Bb0 = DeveloperToolsSupport.ImageResource(name: "np_block_strong_exclamation_7bb0", bundle: resourceBundle)

    /// The "np_block_strong_exclamation_active" asset catalog image resource.
    static let npBlockStrongExclamationActive = DeveloperToolsSupport.ImageResource(name: "np_block_strong_exclamation_active", bundle: resourceBundle)

    /// The "np_block_yellow" asset catalog image resource.
    static let npBlockYellow = DeveloperToolsSupport.ImageResource(name: "np_block_yellow", bundle: resourceBundle)

    /// The "np_block_yellow_e5f1" asset catalog image resource.
    static let npBlockYellowE5F1 = DeveloperToolsSupport.ImageResource(name: "np_block_yellow_e5f1", bundle: resourceBundle)

    /// The "np_bomb" asset catalog image resource.
    static let npBomb = DeveloperToolsSupport.ImageResource(name: "np_bomb", bundle: resourceBundle)

    /// The "np_bomb_7ab1" asset catalog image resource.
    static let npBomb7Ab1 = DeveloperToolsSupport.ImageResource(name: "np_bomb_7ab1", bundle: resourceBundle)

    /// The "np_bomb_active" asset catalog image resource.
    static let npBombActive = DeveloperToolsSupport.ImageResource(name: "np_bomb_active", bundle: resourceBundle)

    /// The "np_bomb_active_e97e" asset catalog image resource.
    static let npBombActiveE97E = DeveloperToolsSupport.ImageResource(name: "np_bomb_active_e97e", bundle: resourceBundle)

    /// The "np_brick_brown" asset catalog image resource.
    static let npBrickBrown = DeveloperToolsSupport.ImageResource(name: "np_brick_brown", bundle: resourceBundle)

    /// The "np_brick_brown_7abb" asset catalog image resource.
    static let npBrickBrown7Abb = DeveloperToolsSupport.ImageResource(name: "np_brick_brown_7abb", bundle: resourceBundle)

    /// The "np_brick_brown_diagonal" asset catalog image resource.
    static let npBrickBrownDiagonal = DeveloperToolsSupport.ImageResource(name: "np_brick_brown_diagonal", bundle: resourceBundle)

    /// The "np_brick_brown_diagonal_ebb3" asset catalog image resource.
    static let npBrickBrownDiagonalEbb3 = DeveloperToolsSupport.ImageResource(name: "np_brick_brown_diagonal_ebb3", bundle: resourceBundle)

    /// The "np_brick_grey" asset catalog image resource.
    static let npBrickGrey = DeveloperToolsSupport.ImageResource(name: "np_brick_grey", bundle: resourceBundle)

    /// The "np_brick_grey_61a2" asset catalog image resource.
    static let npBrickGrey61A2 = DeveloperToolsSupport.ImageResource(name: "np_brick_grey_61a2", bundle: resourceBundle)

    /// The "np_brick_grey_diagonal" asset catalog image resource.
    static let npBrickGreyDiagonal = DeveloperToolsSupport.ImageResource(name: "np_brick_grey_diagonal", bundle: resourceBundle)

    /// The "np_brick_grey_diagonal_5c60" asset catalog image resource.
    static let npBrickGreyDiagonal5C60 = DeveloperToolsSupport.ImageResource(name: "np_brick_grey_diagonal_5c60", bundle: resourceBundle)

    /// The "np_bricks_brown" asset catalog image resource.
    static let npBricksBrown = DeveloperToolsSupport.ImageResource(name: "np_bricks_brown", bundle: resourceBundle)

    /// The "np_bricks_grey" asset catalog image resource.
    static let npBricksGrey = DeveloperToolsSupport.ImageResource(name: "np_bricks_grey", bundle: resourceBundle)

    /// The "np_bridge" asset catalog image resource.
    static let npBridge = DeveloperToolsSupport.ImageResource(name: "np_bridge", bundle: resourceBundle)

    /// The "np_bridge_dc20" asset catalog image resource.
    static let npBridgeDc20 = DeveloperToolsSupport.ImageResource(name: "np_bridge_dc20", bundle: resourceBundle)

    /// The "np_bush" asset catalog image resource.
    static let npBush = DeveloperToolsSupport.ImageResource(name: "np_bush", bundle: resourceBundle)

    /// The "np_cactus" asset catalog image resource.
    static let npCactus = DeveloperToolsSupport.ImageResource(name: "np_cactus", bundle: resourceBundle)

    /// The "np_cactus_d304" asset catalog image resource.
    static let npCactusD304 = DeveloperToolsSupport.ImageResource(name: "np_cactus_d304", bundle: resourceBundle)

    /// The "np_coin_bronze" asset catalog image resource.
    static let npCoinBronze = DeveloperToolsSupport.ImageResource(name: "np_coin_bronze", bundle: resourceBundle)

    /// The "np_coin_bronze_197a" asset catalog image resource.
    static let npCoinBronze197A = DeveloperToolsSupport.ImageResource(name: "np_coin_bronze_197a", bundle: resourceBundle)

    /// The "np_coin_bronze_side" asset catalog image resource.
    static let npCoinBronzeSide = DeveloperToolsSupport.ImageResource(name: "np_coin_bronze_side", bundle: resourceBundle)

    /// The "np_coin_bronze_side_31ad" asset catalog image resource.
    static let npCoinBronzeSide31Ad = DeveloperToolsSupport.ImageResource(name: "np_coin_bronze_side_31ad", bundle: resourceBundle)

    /// The "np_coin_silver_side" asset catalog image resource.
    static let npCoinSilverSide = DeveloperToolsSupport.ImageResource(name: "np_coin_silver_side", bundle: resourceBundle)

    /// The "np_coin_silver_side_7ce6" asset catalog image resource.
    static let npCoinSilverSide7Ce6 = DeveloperToolsSupport.ImageResource(name: "np_coin_silver_side_7ce6", bundle: resourceBundle)

    /// The "np_conveyor" asset catalog image resource.
    static let npConveyor = DeveloperToolsSupport.ImageResource(name: "np_conveyor", bundle: resourceBundle)

    /// The "np_conveyor_48a5" asset catalog image resource.
    static let npConveyor48A5 = DeveloperToolsSupport.ImageResource(name: "np_conveyor_48a5", bundle: resourceBundle)

    /// The "np_door_open" asset catalog image resource.
    static let npDoorOpen = DeveloperToolsSupport.ImageResource(name: "np_door_open", bundle: resourceBundle)

    /// The "np_door_open_top" asset catalog image resource.
    static let npDoorOpenTop = DeveloperToolsSupport.ImageResource(name: "np_door_open_top", bundle: resourceBundle)

    /// The "np_fence_broken" asset catalog image resource.
    static let npFenceBroken = DeveloperToolsSupport.ImageResource(name: "np_fence_broken", bundle: resourceBundle)

    /// The "np_flag_blue_b" asset catalog image resource.
    static let npFlagBlueB = DeveloperToolsSupport.ImageResource(name: "np_flag_blue_b", bundle: resourceBundle)

    /// The "np_flag_red_a" asset catalog image resource.
    static let npFlagRedA = DeveloperToolsSupport.ImageResource(name: "np_flag_red_a", bundle: resourceBundle)

    /// The "np_flag_red_b" asset catalog image resource.
    static let npFlagRedB = DeveloperToolsSupport.ImageResource(name: "np_flag_red_b", bundle: resourceBundle)

    /// The "np_gem_green" asset catalog image resource.
    static let npGemGreen = DeveloperToolsSupport.ImageResource(name: "np_gem_green", bundle: resourceBundle)

    /// The "np_gem_green_1a7a" asset catalog image resource.
    static let npGemGreen1A7A = DeveloperToolsSupport.ImageResource(name: "np_gem_green_1a7a", bundle: resourceBundle)

    /// The "np_gem_red" asset catalog image resource.
    static let npGemRed = DeveloperToolsSupport.ImageResource(name: "np_gem_red", bundle: resourceBundle)

    /// The "np_gem_red_b497" asset catalog image resource.
    static let npGemRedB497 = DeveloperToolsSupport.ImageResource(name: "np_gem_red_b497", bundle: resourceBundle)

    /// The "np_grass_purple" asset catalog image resource.
    static let npGrassPurple = DeveloperToolsSupport.ImageResource(name: "np_grass_purple", bundle: resourceBundle)

    /// The "np_hill_top_smile" asset catalog image resource.
    static let npHillTopSmile = DeveloperToolsSupport.ImageResource(name: "np_hill_top_smile", bundle: resourceBundle)

    /// The "np_hud_character_0" asset catalog image resource.
    static let npHudCharacter0 = DeveloperToolsSupport.ImageResource(name: "np_hud_character_0", bundle: resourceBundle)

    /// The "np_hud_character_0_e734" asset catalog image resource.
    static let npHudCharacter0E734 = DeveloperToolsSupport.ImageResource(name: "np_hud_character_0_e734", bundle: resourceBundle)

    /// The "np_hud_character_1" asset catalog image resource.
    static let npHudCharacter1 = DeveloperToolsSupport.ImageResource(name: "np_hud_character_1", bundle: resourceBundle)

    /// The "np_hud_character_1_fff6" asset catalog image resource.
    static let npHudCharacter1Fff6 = DeveloperToolsSupport.ImageResource(name: "np_hud_character_1_fff6", bundle: resourceBundle)

    /// The "np_hud_character_2" asset catalog image resource.
    static let npHudCharacter2 = DeveloperToolsSupport.ImageResource(name: "np_hud_character_2", bundle: resourceBundle)

    /// The "np_hud_character_2_e7e3" asset catalog image resource.
    static let npHudCharacter2E7E3 = DeveloperToolsSupport.ImageResource(name: "np_hud_character_2_e7e3", bundle: resourceBundle)

    /// The "np_hud_character_3" asset catalog image resource.
    static let npHudCharacter3 = DeveloperToolsSupport.ImageResource(name: "np_hud_character_3", bundle: resourceBundle)

    /// The "np_hud_character_3_7ba9" asset catalog image resource.
    static let npHudCharacter37Ba9 = DeveloperToolsSupport.ImageResource(name: "np_hud_character_3_7ba9", bundle: resourceBundle)

    /// The "np_hud_character_5" asset catalog image resource.
    static let npHudCharacter5 = DeveloperToolsSupport.ImageResource(name: "np_hud_character_5", bundle: resourceBundle)

    /// The "np_hud_character_5_c3ff" asset catalog image resource.
    static let npHudCharacter5C3Ff = DeveloperToolsSupport.ImageResource(name: "np_hud_character_5_c3ff", bundle: resourceBundle)

    /// The "np_hud_character_6" asset catalog image resource.
    static let npHudCharacter6 = DeveloperToolsSupport.ImageResource(name: "np_hud_character_6", bundle: resourceBundle)

    /// The "np_hud_character_6_69d6" asset catalog image resource.
    static let npHudCharacter669D6 = DeveloperToolsSupport.ImageResource(name: "np_hud_character_6_69d6", bundle: resourceBundle)

    /// The "np_hud_character_9" asset catalog image resource.
    static let npHudCharacter9 = DeveloperToolsSupport.ImageResource(name: "np_hud_character_9", bundle: resourceBundle)

    /// The "np_hud_character_9_3968" asset catalog image resource.
    static let npHudCharacter93968 = DeveloperToolsSupport.ImageResource(name: "np_hud_character_9_3968", bundle: resourceBundle)

    /// The "np_hud_character_multiply" asset catalog image resource.
    static let npHudCharacterMultiply = DeveloperToolsSupport.ImageResource(name: "np_hud_character_multiply", bundle: resourceBundle)

    /// The "np_hud_character_percent" asset catalog image resource.
    static let npHudCharacterPercent = DeveloperToolsSupport.ImageResource(name: "np_hud_character_percent", bundle: resourceBundle)

    /// The "np_hud_character_percent_66e2" asset catalog image resource.
    static let npHudCharacterPercent66E2 = DeveloperToolsSupport.ImageResource(name: "np_hud_character_percent_66e2", bundle: resourceBundle)

    /// The "np_hud_coin" asset catalog image resource.
    static let npHudCoin = DeveloperToolsSupport.ImageResource(name: "np_hud_coin", bundle: resourceBundle)

    /// The "np_hud_coin_ad63" asset catalog image resource.
    static let npHudCoinAd63 = DeveloperToolsSupport.ImageResource(name: "np_hud_coin_ad63", bundle: resourceBundle)

    /// The "np_hud_heart_half" asset catalog image resource.
    static let npHudHeartHalf = DeveloperToolsSupport.ImageResource(name: "np_hud_heart_half", bundle: resourceBundle)

    /// The "np_hud_heart_half_1c5a" asset catalog image resource.
    static let npHudHeartHalf1C5A = DeveloperToolsSupport.ImageResource(name: "np_hud_heart_half_1c5a", bundle: resourceBundle)

    /// The "np_hud_key_blue" asset catalog image resource.
    static let npHudKeyBlue = DeveloperToolsSupport.ImageResource(name: "np_hud_key_blue", bundle: resourceBundle)

    /// The "np_hud_key_blue_2e54" asset catalog image resource.
    static let npHudKeyBlue2E54 = DeveloperToolsSupport.ImageResource(name: "np_hud_key_blue_2e54", bundle: resourceBundle)

    /// The "np_hud_key_green" asset catalog image resource.
    static let npHudKeyGreen = DeveloperToolsSupport.ImageResource(name: "np_hud_key_green", bundle: resourceBundle)

    /// The "np_hud_key_green_7222" asset catalog image resource.
    static let npHudKeyGreen7222 = DeveloperToolsSupport.ImageResource(name: "np_hud_key_green_7222", bundle: resourceBundle)

    /// The "np_hud_key_red" asset catalog image resource.
    static let npHudKeyRed = DeveloperToolsSupport.ImageResource(name: "np_hud_key_red", bundle: resourceBundle)

    /// The "np_hud_key_red_8db4" asset catalog image resource.
    static let npHudKeyRed8Db4 = DeveloperToolsSupport.ImageResource(name: "np_hud_key_red_8db4", bundle: resourceBundle)

    /// The "np_hud_key_yellow" asset catalog image resource.
    static let npHudKeyYellow = DeveloperToolsSupport.ImageResource(name: "np_hud_key_yellow", bundle: resourceBundle)

    /// The "np_hud_player_green" asset catalog image resource.
    static let npHudPlayerGreen = DeveloperToolsSupport.ImageResource(name: "np_hud_player_green", bundle: resourceBundle)

    /// The "np_hud_player_green_4e9a" asset catalog image resource.
    static let npHudPlayerGreen4E9A = DeveloperToolsSupport.ImageResource(name: "np_hud_player_green_4e9a", bundle: resourceBundle)

    /// The "np_hud_player_helmet_beige" asset catalog image resource.
    static let npHudPlayerHelmetBeige = DeveloperToolsSupport.ImageResource(name: "np_hud_player_helmet_beige", bundle: resourceBundle)

    /// The "np_hud_player_helmet_green" asset catalog image resource.
    static let npHudPlayerHelmetGreen = DeveloperToolsSupport.ImageResource(name: "np_hud_player_helmet_green", bundle: resourceBundle)

    /// The "np_hud_player_helmet_green_f08b" asset catalog image resource.
    static let npHudPlayerHelmetGreenF08B = DeveloperToolsSupport.ImageResource(name: "np_hud_player_helmet_green_f08b", bundle: resourceBundle)

    /// The "np_hud_player_helmet_pink" asset catalog image resource.
    static let npHudPlayerHelmetPink = DeveloperToolsSupport.ImageResource(name: "np_hud_player_helmet_pink", bundle: resourceBundle)

    /// The "np_hud_player_helmet_pink_000a" asset catalog image resource.
    static let npHudPlayerHelmetPink000A = DeveloperToolsSupport.ImageResource(name: "np_hud_player_helmet_pink_000a", bundle: resourceBundle)

    /// The "np_hud_player_helmet_yellow" asset catalog image resource.
    static let npHudPlayerHelmetYellow = DeveloperToolsSupport.ImageResource(name: "np_hud_player_helmet_yellow", bundle: resourceBundle)

    /// The "np_hud_player_helmet_yellow_158c" asset catalog image resource.
    static let npHudPlayerHelmetYellow158C = DeveloperToolsSupport.ImageResource(name: "np_hud_player_helmet_yellow_158c", bundle: resourceBundle)

    /// The "np_hud_player_yellow" asset catalog image resource.
    static let npHudPlayerYellow = DeveloperToolsSupport.ImageResource(name: "np_hud_player_yellow", bundle: resourceBundle)

    /// The "np_key_blue" asset catalog image resource.
    static let npKeyBlue = DeveloperToolsSupport.ImageResource(name: "np_key_blue", bundle: resourceBundle)

    /// The "np_key_green" asset catalog image resource.
    static let npKeyGreen = DeveloperToolsSupport.ImageResource(name: "np_key_green", bundle: resourceBundle)

    /// The "np_key_green_89fc" asset catalog image resource.
    static let npKeyGreen89Fc = DeveloperToolsSupport.ImageResource(name: "np_key_green_89fc", bundle: resourceBundle)

    /// The "np_key_red" asset catalog image resource.
    static let npKeyRed = DeveloperToolsSupport.ImageResource(name: "np_key_red", bundle: resourceBundle)

    /// The "np_key_yellow" asset catalog image resource.
    static let npKeyYellow = DeveloperToolsSupport.ImageResource(name: "np_key_yellow", bundle: resourceBundle)

    /// The "np_ladder_bottom" asset catalog image resource.
    static let npLadderBottom = DeveloperToolsSupport.ImageResource(name: "np_ladder_bottom", bundle: resourceBundle)

    /// The "np_lava_top" asset catalog image resource.
    static let npLavaTop = DeveloperToolsSupport.ImageResource(name: "np_lava_top", bundle: resourceBundle)

    /// The "np_lava_top_fb8e" asset catalog image resource.
    static let npLavaTopFb8E = DeveloperToolsSupport.ImageResource(name: "np_lava_top_fb8e", bundle: resourceBundle)

    /// The "np_lock_yellow" asset catalog image resource.
    static let npLockYellow = DeveloperToolsSupport.ImageResource(name: "np_lock_yellow", bundle: resourceBundle)

    /// The "np_rock" asset catalog image resource.
    static let npRock = DeveloperToolsSupport.ImageResource(name: "np_rock", bundle: resourceBundle)

    /// The "np_rock_6e11" asset catalog image resource.
    static let npRock6E11 = DeveloperToolsSupport.ImageResource(name: "np_rock_6e11", bundle: resourceBundle)

    /// The "np_saw" asset catalog image resource.
    static let npSaw = DeveloperToolsSupport.ImageResource(name: "np_saw", bundle: resourceBundle)

    /// The "np_saw_9d5a" asset catalog image resource.
    static let npSaw9D5A = DeveloperToolsSupport.ImageResource(name: "np_saw_9d5a", bundle: resourceBundle)

    /// The "np_snow" asset catalog image resource.
    static let npSnow = DeveloperToolsSupport.ImageResource(name: "np_snow", bundle: resourceBundle)

    /// The "np_snow_847b" asset catalog image resource.
    static let npSnow847B = DeveloperToolsSupport.ImageResource(name: "np_snow_847b", bundle: resourceBundle)

    /// The "np_spikes" asset catalog image resource.
    static let npSpikes = DeveloperToolsSupport.ImageResource(name: "np_spikes", bundle: resourceBundle)

    /// The "np_spring" asset catalog image resource.
    static let npSpring = DeveloperToolsSupport.ImageResource(name: "np_spring", bundle: resourceBundle)

    /// The "np_spring_1ef2" asset catalog image resource.
    static let npSpring1Ef2 = DeveloperToolsSupport.ImageResource(name: "np_spring_1ef2", bundle: resourceBundle)

    /// The "np_spring_out" asset catalog image resource.
    static let npSpringOut = DeveloperToolsSupport.ImageResource(name: "np_spring_out", bundle: resourceBundle)

    /// The "np_star" asset catalog image resource.
    static let npStar = DeveloperToolsSupport.ImageResource(name: "np_star", bundle: resourceBundle)

    /// The "np_switch_blue" asset catalog image resource.
    static let npSwitchBlue = DeveloperToolsSupport.ImageResource(name: "np_switch_blue", bundle: resourceBundle)

    /// The "np_switch_blue_641a" asset catalog image resource.
    static let npSwitchBlue641A = DeveloperToolsSupport.ImageResource(name: "np_switch_blue_641a", bundle: resourceBundle)

    /// The "np_switch_green_pressed" asset catalog image resource.
    static let npSwitchGreenPressed = DeveloperToolsSupport.ImageResource(name: "np_switch_green_pressed", bundle: resourceBundle)

    /// The "np_switch_yellow" asset catalog image resource.
    static let npSwitchYellow = DeveloperToolsSupport.ImageResource(name: "np_switch_yellow", bundle: resourceBundle)

    /// The "np_switch_yellow_pressed" asset catalog image resource.
    static let npSwitchYellowPressed = DeveloperToolsSupport.ImageResource(name: "np_switch_yellow_pressed", bundle: resourceBundle)

    /// The "np_terrain_dirt_block_bottom_right" asset catalog image resource.
    static let npTerrainDirtBlockBottomRight = DeveloperToolsSupport.ImageResource(name: "np_terrain_dirt_block_bottom_right", bundle: resourceBundle)

    /// The "np_terrain_dirt_block_center" asset catalog image resource.
    static let npTerrainDirtBlockCenter = DeveloperToolsSupport.ImageResource(name: "np_terrain_dirt_block_center", bundle: resourceBundle)

    /// The "np_terrain_dirt_block_top_left" asset catalog image resource.
    static let npTerrainDirtBlockTopLeft = DeveloperToolsSupport.ImageResource(name: "np_terrain_dirt_block_top_left", bundle: resourceBundle)

    /// The "np_terrain_dirt_block_top_left_8868" asset catalog image resource.
    static let npTerrainDirtBlockTopLeft8868 = DeveloperToolsSupport.ImageResource(name: "np_terrain_dirt_block_top_left_8868", bundle: resourceBundle)

    /// The "np_terrain_dirt_block_top_right" asset catalog image resource.
    static let npTerrainDirtBlockTopRight = DeveloperToolsSupport.ImageResource(name: "np_terrain_dirt_block_top_right", bundle: resourceBundle)

    /// The "np_terrain_dirt_block_top_right_7e82" asset catalog image resource.
    static let npTerrainDirtBlockTopRight7E82 = DeveloperToolsSupport.ImageResource(name: "np_terrain_dirt_block_top_right_7e82", bundle: resourceBundle)

    /// The "np_terrain_dirt_cloud" asset catalog image resource.
    static let npTerrainDirtCloud = DeveloperToolsSupport.ImageResource(name: "np_terrain_dirt_cloud", bundle: resourceBundle)

    /// The "np_terrain_dirt_cloud_background" asset catalog image resource.
    static let npTerrainDirtCloudBackground = DeveloperToolsSupport.ImageResource(name: "np_terrain_dirt_cloud_background", bundle: resourceBundle)

    /// The "np_terrain_dirt_cloud_left" asset catalog image resource.
    static let npTerrainDirtCloudLeft = DeveloperToolsSupport.ImageResource(name: "np_terrain_dirt_cloud_left", bundle: resourceBundle)

    /// The "np_terrain_dirt_cloud_left_d5a8" asset catalog image resource.
    static let npTerrainDirtCloudLeftD5A8 = DeveloperToolsSupport.ImageResource(name: "np_terrain_dirt_cloud_left_d5a8", bundle: resourceBundle)

    /// The "np_terrain_dirt_horizontal_right" asset catalog image resource.
    static let npTerrainDirtHorizontalRight = DeveloperToolsSupport.ImageResource(name: "np_terrain_dirt_horizontal_right", bundle: resourceBundle)

    /// The "np_terrain_dirt_horizontal_right_11fa" asset catalog image resource.
    static let npTerrainDirtHorizontalRight11Fa = DeveloperToolsSupport.ImageResource(name: "np_terrain_dirt_horizontal_right_11fa", bundle: resourceBundle)

    /// The "np_terrain_dirt_ramp_long_a" asset catalog image resource.
    static let npTerrainDirtRampLongA = DeveloperToolsSupport.ImageResource(name: "np_terrain_dirt_ramp_long_a", bundle: resourceBundle)

    /// The "np_terrain_dirt_ramp_long_a_df9f" asset catalog image resource.
    static let npTerrainDirtRampLongADf9F = DeveloperToolsSupport.ImageResource(name: "np_terrain_dirt_ramp_long_a_df9f", bundle: resourceBundle)

    /// The "np_terrain_dirt_ramp_short_a" asset catalog image resource.
    static let npTerrainDirtRampShortA = DeveloperToolsSupport.ImageResource(name: "np_terrain_dirt_ramp_short_a", bundle: resourceBundle)

    /// The "np_terrain_dirt_ramp_short_a_ded8" asset catalog image resource.
    static let npTerrainDirtRampShortADed8 = DeveloperToolsSupport.ImageResource(name: "np_terrain_dirt_ramp_short_a_ded8", bundle: resourceBundle)

    /// The "np_terrain_dirt_ramp_short_b" asset catalog image resource.
    static let npTerrainDirtRampShortB = DeveloperToolsSupport.ImageResource(name: "np_terrain_dirt_ramp_short_b", bundle: resourceBundle)

    /// The "np_terrain_dirt_ramp_short_b_f3b0" asset catalog image resource.
    static let npTerrainDirtRampShortBF3B0 = DeveloperToolsSupport.ImageResource(name: "np_terrain_dirt_ramp_short_b_f3b0", bundle: resourceBundle)

    /// The "np_terrain_dirt_vertical_middle" asset catalog image resource.
    static let npTerrainDirtVerticalMiddle = DeveloperToolsSupport.ImageResource(name: "np_terrain_dirt_vertical_middle", bundle: resourceBundle)

    /// The "np_terrain_dirt_vertical_middle_b4d3" asset catalog image resource.
    static let npTerrainDirtVerticalMiddleB4D3 = DeveloperToolsSupport.ImageResource(name: "np_terrain_dirt_vertical_middle_b4d3", bundle: resourceBundle)

    /// The "np_terrain_dirt_vertical_top" asset catalog image resource.
    static let npTerrainDirtVerticalTop = DeveloperToolsSupport.ImageResource(name: "np_terrain_dirt_vertical_top", bundle: resourceBundle)

    /// The "np_terrain_dirt_vertical_top_dbed" asset catalog image resource.
    static let npTerrainDirtVerticalTopDbed = DeveloperToolsSupport.ImageResource(name: "np_terrain_dirt_vertical_top_dbed", bundle: resourceBundle)

    /// The "np_terrain_grass_block" asset catalog image resource.
    static let npTerrainGrassBlock = DeveloperToolsSupport.ImageResource(name: "np_terrain_grass_block", bundle: resourceBundle)

    /// The "np_terrain_grass_block_2ff7" asset catalog image resource.
    static let npTerrainGrassBlock2Ff7 = DeveloperToolsSupport.ImageResource(name: "np_terrain_grass_block_2ff7", bundle: resourceBundle)

    /// The "np_terrain_grass_block_bottom_left" asset catalog image resource.
    static let npTerrainGrassBlockBottomLeft = DeveloperToolsSupport.ImageResource(name: "np_terrain_grass_block_bottom_left", bundle: resourceBundle)

    /// The "np_terrain_grass_block_bottom_left_4d4f" asset catalog image resource.
    static let npTerrainGrassBlockBottomLeft4D4F = DeveloperToolsSupport.ImageResource(name: "np_terrain_grass_block_bottom_left_4d4f", bundle: resourceBundle)

    /// The "np_terrain_grass_block_center" asset catalog image resource.
    static let npTerrainGrassBlockCenter = DeveloperToolsSupport.ImageResource(name: "np_terrain_grass_block_center", bundle: resourceBundle)

    /// The "np_terrain_grass_block_left" asset catalog image resource.
    static let npTerrainGrassBlockLeft = DeveloperToolsSupport.ImageResource(name: "np_terrain_grass_block_left", bundle: resourceBundle)

    /// The "np_terrain_grass_block_left_7eaa" asset catalog image resource.
    static let npTerrainGrassBlockLeft7Eaa = DeveloperToolsSupport.ImageResource(name: "np_terrain_grass_block_left_7eaa", bundle: resourceBundle)

    /// The "np_terrain_grass_block_top" asset catalog image resource.
    static let npTerrainGrassBlockTop = DeveloperToolsSupport.ImageResource(name: "np_terrain_grass_block_top", bundle: resourceBundle)

    /// The "np_terrain_grass_block_top_left" asset catalog image resource.
    static let npTerrainGrassBlockTopLeft = DeveloperToolsSupport.ImageResource(name: "np_terrain_grass_block_top_left", bundle: resourceBundle)

    /// The "np_terrain_grass_block_top_left_f9e9" asset catalog image resource.
    static let npTerrainGrassBlockTopLeftF9E9 = DeveloperToolsSupport.ImageResource(name: "np_terrain_grass_block_top_left_f9e9", bundle: resourceBundle)

    /// The "np_terrain_grass_block_top_right" asset catalog image resource.
    static let npTerrainGrassBlockTopRight = DeveloperToolsSupport.ImageResource(name: "np_terrain_grass_block_top_right", bundle: resourceBundle)

    /// The "np_terrain_grass_block_top_right_c712" asset catalog image resource.
    static let npTerrainGrassBlockTopRightC712 = DeveloperToolsSupport.ImageResource(name: "np_terrain_grass_block_top_right_c712", bundle: resourceBundle)

    /// The "np_terrain_grass_cloud" asset catalog image resource.
    static let npTerrainGrassCloud = DeveloperToolsSupport.ImageResource(name: "np_terrain_grass_cloud", bundle: resourceBundle)

    /// The "np_terrain_grass_cloud_background" asset catalog image resource.
    static let npTerrainGrassCloudBackground = DeveloperToolsSupport.ImageResource(name: "np_terrain_grass_cloud_background", bundle: resourceBundle)

    /// The "np_terrain_grass_cloud_middle" asset catalog image resource.
    static let npTerrainGrassCloudMiddle = DeveloperToolsSupport.ImageResource(name: "np_terrain_grass_cloud_middle", bundle: resourceBundle)

    /// The "np_terrain_grass_cloud_right" asset catalog image resource.
    static let npTerrainGrassCloudRight = DeveloperToolsSupport.ImageResource(name: "np_terrain_grass_cloud_right", bundle: resourceBundle)

    /// The "np_terrain_grass_cloud_right_eeeb" asset catalog image resource.
    static let npTerrainGrassCloudRightEeeb = DeveloperToolsSupport.ImageResource(name: "np_terrain_grass_cloud_right_eeeb", bundle: resourceBundle)

    /// The "np_terrain_grass_horizontal_left" asset catalog image resource.
    static let npTerrainGrassHorizontalLeft = DeveloperToolsSupport.ImageResource(name: "np_terrain_grass_horizontal_left", bundle: resourceBundle)

    /// The "np_terrain_grass_horizontal_left_55aa" asset catalog image resource.
    static let npTerrainGrassHorizontalLeft55Aa = DeveloperToolsSupport.ImageResource(name: "np_terrain_grass_horizontal_left_55aa", bundle: resourceBundle)

    /// The "np_terrain_grass_ramp_long_a" asset catalog image resource.
    static let npTerrainGrassRampLongA = DeveloperToolsSupport.ImageResource(name: "np_terrain_grass_ramp_long_a", bundle: resourceBundle)

    /// The "np_terrain_grass_ramp_long_c" asset catalog image resource.
    static let npTerrainGrassRampLongC = DeveloperToolsSupport.ImageResource(name: "np_terrain_grass_ramp_long_c", bundle: resourceBundle)

    /// The "np_terrain_grass_ramp_short_b" asset catalog image resource.
    static let npTerrainGrassRampShortB = DeveloperToolsSupport.ImageResource(name: "np_terrain_grass_ramp_short_b", bundle: resourceBundle)

    /// The "np_terrain_grass_ramp_short_b_f560" asset catalog image resource.
    static let npTerrainGrassRampShortBF560 = DeveloperToolsSupport.ImageResource(name: "np_terrain_grass_ramp_short_b_f560", bundle: resourceBundle)

    /// The "np_terrain_grass_vertical_bottom" asset catalog image resource.
    static let npTerrainGrassVerticalBottom = DeveloperToolsSupport.ImageResource(name: "np_terrain_grass_vertical_bottom", bundle: resourceBundle)

    /// The "np_terrain_grass_vertical_middle" asset catalog image resource.
    static let npTerrainGrassVerticalMiddle = DeveloperToolsSupport.ImageResource(name: "np_terrain_grass_vertical_middle", bundle: resourceBundle)

    /// The "np_terrain_grass_vertical_middle_a04c" asset catalog image resource.
    static let npTerrainGrassVerticalMiddleA04C = DeveloperToolsSupport.ImageResource(name: "np_terrain_grass_vertical_middle_a04c", bundle: resourceBundle)

    /// The "np_terrain_grass_vertical_top" asset catalog image resource.
    static let npTerrainGrassVerticalTop = DeveloperToolsSupport.ImageResource(name: "np_terrain_grass_vertical_top", bundle: resourceBundle)

    /// The "np_terrain_grass_vertical_top_1c14" asset catalog image resource.
    static let npTerrainGrassVerticalTop1C14 = DeveloperToolsSupport.ImageResource(name: "np_terrain_grass_vertical_top_1c14", bundle: resourceBundle)

    /// The "np_terrain_purple_block" asset catalog image resource.
    static let npTerrainPurpleBlock = DeveloperToolsSupport.ImageResource(name: "np_terrain_purple_block", bundle: resourceBundle)

    /// The "np_terrain_purple_block_bottom_left" asset catalog image resource.
    static let npTerrainPurpleBlockBottomLeft = DeveloperToolsSupport.ImageResource(name: "np_terrain_purple_block_bottom_left", bundle: resourceBundle)

    /// The "np_terrain_purple_block_bottom_left_ca5a" asset catalog image resource.
    static let npTerrainPurpleBlockBottomLeftCa5A = DeveloperToolsSupport.ImageResource(name: "np_terrain_purple_block_bottom_left_ca5a", bundle: resourceBundle)

    /// The "np_terrain_purple_block_left" asset catalog image resource.
    static let npTerrainPurpleBlockLeft = DeveloperToolsSupport.ImageResource(name: "np_terrain_purple_block_left", bundle: resourceBundle)

    /// The "np_terrain_purple_cloud_middle" asset catalog image resource.
    static let npTerrainPurpleCloudMiddle = DeveloperToolsSupport.ImageResource(name: "np_terrain_purple_cloud_middle", bundle: resourceBundle)

    /// The "np_terrain_purple_horizontal_left" asset catalog image resource.
    static let npTerrainPurpleHorizontalLeft = DeveloperToolsSupport.ImageResource(name: "np_terrain_purple_horizontal_left", bundle: resourceBundle)

    /// The "np_terrain_purple_horizontal_left_3574" asset catalog image resource.
    static let npTerrainPurpleHorizontalLeft3574 = DeveloperToolsSupport.ImageResource(name: "np_terrain_purple_horizontal_left_3574", bundle: resourceBundle)

    /// The "np_terrain_purple_horizontal_overhang_left" asset catalog image resource.
    static let npTerrainPurpleHorizontalOverhangLeft = DeveloperToolsSupport.ImageResource(name: "np_terrain_purple_horizontal_overhang_left", bundle: resourceBundle)

    /// The "np_terrain_purple_horizontal_overhang_left_27f9" asset catalog image resource.
    static let npTerrainPurpleHorizontalOverhangLeft27F9 = DeveloperToolsSupport.ImageResource(name: "np_terrain_purple_horizontal_overhang_left_27f9", bundle: resourceBundle)

    /// The "np_terrain_purple_horizontal_overhang_right" asset catalog image resource.
    static let npTerrainPurpleHorizontalOverhangRight = DeveloperToolsSupport.ImageResource(name: "np_terrain_purple_horizontal_overhang_right", bundle: resourceBundle)

    /// The "np_terrain_purple_horizontal_overhang_right_28c5" asset catalog image resource.
    static let npTerrainPurpleHorizontalOverhangRight28C5 = DeveloperToolsSupport.ImageResource(name: "np_terrain_purple_horizontal_overhang_right_28c5", bundle: resourceBundle)

    /// The "np_terrain_purple_horizontal_right" asset catalog image resource.
    static let npTerrainPurpleHorizontalRight = DeveloperToolsSupport.ImageResource(name: "np_terrain_purple_horizontal_right", bundle: resourceBundle)

    /// The "np_terrain_purple_horizontal_right_adc0" asset catalog image resource.
    static let npTerrainPurpleHorizontalRightAdc0 = DeveloperToolsSupport.ImageResource(name: "np_terrain_purple_horizontal_right_adc0", bundle: resourceBundle)

    /// The "np_terrain_purple_ramp_long_b" asset catalog image resource.
    static let npTerrainPurpleRampLongB = DeveloperToolsSupport.ImageResource(name: "np_terrain_purple_ramp_long_b", bundle: resourceBundle)

    /// The "np_terrain_purple_ramp_long_c" asset catalog image resource.
    static let npTerrainPurpleRampLongC = DeveloperToolsSupport.ImageResource(name: "np_terrain_purple_ramp_long_c", bundle: resourceBundle)

    /// The "np_terrain_purple_ramp_short_b" asset catalog image resource.
    static let npTerrainPurpleRampShortB = DeveloperToolsSupport.ImageResource(name: "np_terrain_purple_ramp_short_b", bundle: resourceBundle)

    /// The "np_terrain_purple_ramp_short_b_681d" asset catalog image resource.
    static let npTerrainPurpleRampShortB681D = DeveloperToolsSupport.ImageResource(name: "np_terrain_purple_ramp_short_b_681d", bundle: resourceBundle)

    /// The "np_terrain_purple_vertical_bottom" asset catalog image resource.
    static let npTerrainPurpleVerticalBottom = DeveloperToolsSupport.ImageResource(name: "np_terrain_purple_vertical_bottom", bundle: resourceBundle)

    /// The "np_terrain_purple_vertical_bottom_d37f" asset catalog image resource.
    static let npTerrainPurpleVerticalBottomD37F = DeveloperToolsSupport.ImageResource(name: "np_terrain_purple_vertical_bottom_d37f", bundle: resourceBundle)

    /// The "np_terrain_purple_vertical_top" asset catalog image resource.
    static let npTerrainPurpleVerticalTop = DeveloperToolsSupport.ImageResource(name: "np_terrain_purple_vertical_top", bundle: resourceBundle)

    /// The "np_terrain_purple_vertical_top_0b0f" asset catalog image resource.
    static let npTerrainPurpleVerticalTop0B0F = DeveloperToolsSupport.ImageResource(name: "np_terrain_purple_vertical_top_0b0f", bundle: resourceBundle)

    /// The "np_terrain_sand_block" asset catalog image resource.
    static let npTerrainSandBlock = DeveloperToolsSupport.ImageResource(name: "np_terrain_sand_block", bundle: resourceBundle)

    /// The "np_terrain_sand_block_bottom" asset catalog image resource.
    static let npTerrainSandBlockBottom = DeveloperToolsSupport.ImageResource(name: "np_terrain_sand_block_bottom", bundle: resourceBundle)

    /// The "np_terrain_sand_block_bottom_ff05" asset catalog image resource.
    static let npTerrainSandBlockBottomFf05 = DeveloperToolsSupport.ImageResource(name: "np_terrain_sand_block_bottom_ff05", bundle: resourceBundle)

    /// The "np_terrain_sand_block_bottom_left" asset catalog image resource.
    static let npTerrainSandBlockBottomLeft = DeveloperToolsSupport.ImageResource(name: "np_terrain_sand_block_bottom_left", bundle: resourceBundle)

    /// The "np_terrain_sand_block_bottom_left_fe03" asset catalog image resource.
    static let npTerrainSandBlockBottomLeftFe03 = DeveloperToolsSupport.ImageResource(name: "np_terrain_sand_block_bottom_left_fe03", bundle: resourceBundle)

    /// The "np_terrain_sand_block_center" asset catalog image resource.
    static let npTerrainSandBlockCenter = DeveloperToolsSupport.ImageResource(name: "np_terrain_sand_block_center", bundle: resourceBundle)

    /// The "np_terrain_sand_block_f23f" asset catalog image resource.
    static let npTerrainSandBlockF23F = DeveloperToolsSupport.ImageResource(name: "np_terrain_sand_block_f23f", bundle: resourceBundle)

    /// The "np_terrain_sand_block_left" asset catalog image resource.
    static let npTerrainSandBlockLeft = DeveloperToolsSupport.ImageResource(name: "np_terrain_sand_block_left", bundle: resourceBundle)

    /// The "np_terrain_sand_block_top" asset catalog image resource.
    static let npTerrainSandBlockTop = DeveloperToolsSupport.ImageResource(name: "np_terrain_sand_block_top", bundle: resourceBundle)

    /// The "np_terrain_sand_block_top_1e5c" asset catalog image resource.
    static let npTerrainSandBlockTop1E5C = DeveloperToolsSupport.ImageResource(name: "np_terrain_sand_block_top_1e5c", bundle: resourceBundle)

    /// The "np_terrain_sand_cloud_background" asset catalog image resource.
    static let npTerrainSandCloudBackground = DeveloperToolsSupport.ImageResource(name: "np_terrain_sand_cloud_background", bundle: resourceBundle)

    /// The "np_terrain_sand_cloud_left" asset catalog image resource.
    static let npTerrainSandCloudLeft = DeveloperToolsSupport.ImageResource(name: "np_terrain_sand_cloud_left", bundle: resourceBundle)

    /// The "np_terrain_sand_horizontal_left" asset catalog image resource.
    static let npTerrainSandHorizontalLeft = DeveloperToolsSupport.ImageResource(name: "np_terrain_sand_horizontal_left", bundle: resourceBundle)

    /// The "np_terrain_sand_horizontal_overhang_left" asset catalog image resource.
    static let npTerrainSandHorizontalOverhangLeft = DeveloperToolsSupport.ImageResource(name: "np_terrain_sand_horizontal_overhang_left", bundle: resourceBundle)

    /// The "np_terrain_sand_ramp_long_a" asset catalog image resource.
    static let npTerrainSandRampLongA = DeveloperToolsSupport.ImageResource(name: "np_terrain_sand_ramp_long_a", bundle: resourceBundle)

    /// The "np_terrain_sand_ramp_long_c" asset catalog image resource.
    static let npTerrainSandRampLongC = DeveloperToolsSupport.ImageResource(name: "np_terrain_sand_ramp_long_c", bundle: resourceBundle)

    /// The "np_terrain_sand_vertical_bottom" asset catalog image resource.
    static let npTerrainSandVerticalBottom = DeveloperToolsSupport.ImageResource(name: "np_terrain_sand_vertical_bottom", bundle: resourceBundle)

    /// The "np_terrain_sand_vertical_top" asset catalog image resource.
    static let npTerrainSandVerticalTop = DeveloperToolsSupport.ImageResource(name: "np_terrain_sand_vertical_top", bundle: resourceBundle)

    /// The "np_terrain_sand_vertical_top_916e" asset catalog image resource.
    static let npTerrainSandVerticalTop916E = DeveloperToolsSupport.ImageResource(name: "np_terrain_sand_vertical_top_916e", bundle: resourceBundle)

    /// The "np_terrain_snow_cloud" asset catalog image resource.
    static let npTerrainSnowCloud = DeveloperToolsSupport.ImageResource(name: "np_terrain_snow_cloud", bundle: resourceBundle)

    /// The "np_terrain_snow_cloud_background" asset catalog image resource.
    static let npTerrainSnowCloudBackground = DeveloperToolsSupport.ImageResource(name: "np_terrain_snow_cloud_background", bundle: resourceBundle)

    /// The "np_terrain_snow_cloud_right" asset catalog image resource.
    static let npTerrainSnowCloudRight = DeveloperToolsSupport.ImageResource(name: "np_terrain_snow_cloud_right", bundle: resourceBundle)

    /// The "np_terrain_snow_cloud_right_9279" asset catalog image resource.
    static let npTerrainSnowCloudRight9279 = DeveloperToolsSupport.ImageResource(name: "np_terrain_snow_cloud_right_9279", bundle: resourceBundle)

    /// The "np_terrain_snow_horizontal_left" asset catalog image resource.
    static let npTerrainSnowHorizontalLeft = DeveloperToolsSupport.ImageResource(name: "np_terrain_snow_horizontal_left", bundle: resourceBundle)

    /// The "np_terrain_snow_horizontal_left_0496" asset catalog image resource.
    static let npTerrainSnowHorizontalLeft0496 = DeveloperToolsSupport.ImageResource(name: "np_terrain_snow_horizontal_left_0496", bundle: resourceBundle)

    /// The "np_terrain_snow_horizontal_middle" asset catalog image resource.
    static let npTerrainSnowHorizontalMiddle = DeveloperToolsSupport.ImageResource(name: "np_terrain_snow_horizontal_middle", bundle: resourceBundle)

    /// The "np_terrain_snow_horizontal_middle_cbdc" asset catalog image resource.
    static let npTerrainSnowHorizontalMiddleCbdc = DeveloperToolsSupport.ImageResource(name: "np_terrain_snow_horizontal_middle_cbdc", bundle: resourceBundle)

    /// The "np_terrain_snow_horizontal_overhang_left" asset catalog image resource.
    static let npTerrainSnowHorizontalOverhangLeft = DeveloperToolsSupport.ImageResource(name: "np_terrain_snow_horizontal_overhang_left", bundle: resourceBundle)

    /// The "np_terrain_snow_ramp_long_b" asset catalog image resource.
    static let npTerrainSnowRampLongB = DeveloperToolsSupport.ImageResource(name: "np_terrain_snow_ramp_long_b", bundle: resourceBundle)

    /// The "np_terrain_snow_ramp_long_b_d19b" asset catalog image resource.
    static let npTerrainSnowRampLongBD19B = DeveloperToolsSupport.ImageResource(name: "np_terrain_snow_ramp_long_b_d19b", bundle: resourceBundle)

    /// The "np_terrain_snow_ramp_long_c" asset catalog image resource.
    static let npTerrainSnowRampLongC = DeveloperToolsSupport.ImageResource(name: "np_terrain_snow_ramp_long_c", bundle: resourceBundle)

    /// The "np_terrain_snow_ramp_long_c_4607" asset catalog image resource.
    static let npTerrainSnowRampLongC4607 = DeveloperToolsSupport.ImageResource(name: "np_terrain_snow_ramp_long_c_4607", bundle: resourceBundle)

    /// The "np_terrain_snow_vertical_top" asset catalog image resource.
    static let npTerrainSnowVerticalTop = DeveloperToolsSupport.ImageResource(name: "np_terrain_snow_vertical_top", bundle: resourceBundle)

    /// The "np_terrain_snow_vertical_top_8e90" asset catalog image resource.
    static let npTerrainSnowVerticalTop8E90 = DeveloperToolsSupport.ImageResource(name: "np_terrain_snow_vertical_top_8e90", bundle: resourceBundle)

    /// The "np_terrain_stone_block" asset catalog image resource.
    static let npTerrainStoneBlock = DeveloperToolsSupport.ImageResource(name: "np_terrain_stone_block", bundle: resourceBundle)

    /// The "np_terrain_stone_block_0fbd" asset catalog image resource.
    static let npTerrainStoneBlock0Fbd = DeveloperToolsSupport.ImageResource(name: "np_terrain_stone_block_0fbd", bundle: resourceBundle)

    /// The "np_terrain_stone_block_bottom_right" asset catalog image resource.
    static let npTerrainStoneBlockBottomRight = DeveloperToolsSupport.ImageResource(name: "np_terrain_stone_block_bottom_right", bundle: resourceBundle)

    /// The "np_terrain_stone_block_left" asset catalog image resource.
    static let npTerrainStoneBlockLeft = DeveloperToolsSupport.ImageResource(name: "np_terrain_stone_block_left", bundle: resourceBundle)

    /// The "np_terrain_stone_block_left_12d0" asset catalog image resource.
    static let npTerrainStoneBlockLeft12D0 = DeveloperToolsSupport.ImageResource(name: "np_terrain_stone_block_left_12d0", bundle: resourceBundle)

    /// The "np_terrain_stone_block_right" asset catalog image resource.
    static let npTerrainStoneBlockRight = DeveloperToolsSupport.ImageResource(name: "np_terrain_stone_block_right", bundle: resourceBundle)

    /// The "np_terrain_stone_block_right_8d88" asset catalog image resource.
    static let npTerrainStoneBlockRight8D88 = DeveloperToolsSupport.ImageResource(name: "np_terrain_stone_block_right_8d88", bundle: resourceBundle)

    /// The "np_terrain_stone_block_top" asset catalog image resource.
    static let npTerrainStoneBlockTop = DeveloperToolsSupport.ImageResource(name: "np_terrain_stone_block_top", bundle: resourceBundle)

    /// The "np_terrain_stone_block_top_05d7" asset catalog image resource.
    static let npTerrainStoneBlockTop05D7 = DeveloperToolsSupport.ImageResource(name: "np_terrain_stone_block_top_05d7", bundle: resourceBundle)

    /// The "np_terrain_stone_cloud_left" asset catalog image resource.
    static let npTerrainStoneCloudLeft = DeveloperToolsSupport.ImageResource(name: "np_terrain_stone_cloud_left", bundle: resourceBundle)

    /// The "np_terrain_stone_cloud_right" asset catalog image resource.
    static let npTerrainStoneCloudRight = DeveloperToolsSupport.ImageResource(name: "np_terrain_stone_cloud_right", bundle: resourceBundle)

    /// The "np_terrain_stone_cloud_right_e033" asset catalog image resource.
    static let npTerrainStoneCloudRightE033 = DeveloperToolsSupport.ImageResource(name: "np_terrain_stone_cloud_right_e033", bundle: resourceBundle)

    /// The "np_terrain_stone_horizontal_left" asset catalog image resource.
    static let npTerrainStoneHorizontalLeft = DeveloperToolsSupport.ImageResource(name: "np_terrain_stone_horizontal_left", bundle: resourceBundle)

    /// The "np_terrain_stone_horizontal_middle" asset catalog image resource.
    static let npTerrainStoneHorizontalMiddle = DeveloperToolsSupport.ImageResource(name: "np_terrain_stone_horizontal_middle", bundle: resourceBundle)

    /// The "np_terrain_stone_horizontal_middle_6041" asset catalog image resource.
    static let npTerrainStoneHorizontalMiddle6041 = DeveloperToolsSupport.ImageResource(name: "np_terrain_stone_horizontal_middle_6041", bundle: resourceBundle)

    /// The "np_terrain_stone_horizontal_overhang_left" asset catalog image resource.
    static let npTerrainStoneHorizontalOverhangLeft = DeveloperToolsSupport.ImageResource(name: "np_terrain_stone_horizontal_overhang_left", bundle: resourceBundle)

    /// The "np_terrain_stone_horizontal_overhang_left_9b42" asset catalog image resource.
    static let npTerrainStoneHorizontalOverhangLeft9B42 = DeveloperToolsSupport.ImageResource(name: "np_terrain_stone_horizontal_overhang_left_9b42", bundle: resourceBundle)

    /// The "np_terrain_stone_horizontal_overhang_right" asset catalog image resource.
    static let npTerrainStoneHorizontalOverhangRight = DeveloperToolsSupport.ImageResource(name: "np_terrain_stone_horizontal_overhang_right", bundle: resourceBundle)

    /// The "np_terrain_stone_ramp_long_b" asset catalog image resource.
    static let npTerrainStoneRampLongB = DeveloperToolsSupport.ImageResource(name: "np_terrain_stone_ramp_long_b", bundle: resourceBundle)

    /// The "np_terrain_stone_ramp_long_b_e20a" asset catalog image resource.
    static let npTerrainStoneRampLongBE20A = DeveloperToolsSupport.ImageResource(name: "np_terrain_stone_ramp_long_b_e20a", bundle: resourceBundle)

    /// The "np_terrain_stone_ramp_short_a" asset catalog image resource.
    static let npTerrainStoneRampShortA = DeveloperToolsSupport.ImageResource(name: "np_terrain_stone_ramp_short_a", bundle: resourceBundle)

    /// The "np_terrain_stone_ramp_short_a_bc16" asset catalog image resource.
    static let npTerrainStoneRampShortABc16 = DeveloperToolsSupport.ImageResource(name: "np_terrain_stone_ramp_short_a_bc16", bundle: resourceBundle)

    /// The "np_water" asset catalog image resource.
    static let npWater = DeveloperToolsSupport.ImageResource(name: "np_water", bundle: resourceBundle)

    /// The "np_weight" asset catalog image resource.
    static let npWeight = DeveloperToolsSupport.ImageResource(name: "np_weight", bundle: resourceBundle)

    /// The "np_weight_9023" asset catalog image resource.
    static let npWeight9023 = DeveloperToolsSupport.ImageResource(name: "np_weight_9023", bundle: resourceBundle)

    /// The "orc" asset catalog image resource.
    static let orc = DeveloperToolsSupport.ImageResource(name: "orc", bundle: resourceBundle)

    /// The "pig" asset catalog image resource.
    static let pig = DeveloperToolsSupport.ImageResource(name: "pig", bundle: resourceBundle)

    /// The "portal" asset catalog image resource.
    static let portal = DeveloperToolsSupport.ImageResource(name: "portal", bundle: resourceBundle)

    /// The "pp_tile_0000" asset catalog image resource.
    static let ppTile0000 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0000", bundle: resourceBundle)

    /// The "pp_tile_0000_4c4e" asset catalog image resource.
    static let ppTile00004C4E = DeveloperToolsSupport.ImageResource(name: "pp_tile_0000_4c4e", bundle: resourceBundle)

    /// The "pp_tile_0001" asset catalog image resource.
    static let ppTile0001 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0001", bundle: resourceBundle)

    /// The "pp_tile_0001_068f" asset catalog image resource.
    static let ppTile0001068F = DeveloperToolsSupport.ImageResource(name: "pp_tile_0001_068f", bundle: resourceBundle)

    /// The "pp_tile_0002" asset catalog image resource.
    static let ppTile0002 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0002", bundle: resourceBundle)

    /// The "pp_tile_0002_ac05" asset catalog image resource.
    static let ppTile0002Ac05 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0002_ac05", bundle: resourceBundle)

    /// The "pp_tile_0003" asset catalog image resource.
    static let ppTile0003 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0003", bundle: resourceBundle)

    /// The "pp_tile_0003_acfe" asset catalog image resource.
    static let ppTile0003Acfe = DeveloperToolsSupport.ImageResource(name: "pp_tile_0003_acfe", bundle: resourceBundle)

    /// The "pp_tile_0004" asset catalog image resource.
    static let ppTile0004 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0004", bundle: resourceBundle)

    /// The "pp_tile_0004_35bd" asset catalog image resource.
    static let ppTile000435Bd = DeveloperToolsSupport.ImageResource(name: "pp_tile_0004_35bd", bundle: resourceBundle)

    /// The "pp_tile_0005" asset catalog image resource.
    static let ppTile0005 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0005", bundle: resourceBundle)

    /// The "pp_tile_0005_0082" asset catalog image resource.
    static let ppTile00050082 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0005_0082", bundle: resourceBundle)

    /// The "pp_tile_0006" asset catalog image resource.
    static let ppTile0006 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0006", bundle: resourceBundle)

    /// The "pp_tile_0007" asset catalog image resource.
    static let ppTile0007 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0007", bundle: resourceBundle)

    /// The "pp_tile_0008" asset catalog image resource.
    static let ppTile0008 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0008", bundle: resourceBundle)

    /// The "pp_tile_0008_4494" asset catalog image resource.
    static let ppTile00084494 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0008_4494", bundle: resourceBundle)

    /// The "pp_tile_0009" asset catalog image resource.
    static let ppTile0009 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0009", bundle: resourceBundle)

    /// The "pp_tile_0009_d264" asset catalog image resource.
    static let ppTile0009D264 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0009_d264", bundle: resourceBundle)

    /// The "pp_tile_0010" asset catalog image resource.
    static let ppTile0010 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0010", bundle: resourceBundle)

    /// The "pp_tile_0010_4f90" asset catalog image resource.
    static let ppTile00104F90 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0010_4f90", bundle: resourceBundle)

    /// The "pp_tile_0011" asset catalog image resource.
    static let ppTile0011 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0011", bundle: resourceBundle)

    /// The "pp_tile_0011_c331" asset catalog image resource.
    static let ppTile0011C331 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0011_c331", bundle: resourceBundle)

    /// The "pp_tile_0012" asset catalog image resource.
    static let ppTile0012 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0012", bundle: resourceBundle)

    /// The "pp_tile_0013" asset catalog image resource.
    static let ppTile0013 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0013", bundle: resourceBundle)

    /// The "pp_tile_0014" asset catalog image resource.
    static let ppTile0014 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0014", bundle: resourceBundle)

    /// The "pp_tile_0014_d921" asset catalog image resource.
    static let ppTile0014D921 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0014_d921", bundle: resourceBundle)

    /// The "pp_tile_0015" asset catalog image resource.
    static let ppTile0015 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0015", bundle: resourceBundle)

    /// The "pp_tile_0015_8f77" asset catalog image resource.
    static let ppTile00158F77 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0015_8f77", bundle: resourceBundle)

    /// The "pp_tile_0016" asset catalog image resource.
    static let ppTile0016 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0016", bundle: resourceBundle)

    /// The "pp_tile_0016_30e2" asset catalog image resource.
    static let ppTile001630E2 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0016_30e2", bundle: resourceBundle)

    /// The "pp_tile_0017" asset catalog image resource.
    static let ppTile0017 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0017", bundle: resourceBundle)

    /// The "pp_tile_0017_480e" asset catalog image resource.
    static let ppTile0017480E = DeveloperToolsSupport.ImageResource(name: "pp_tile_0017_480e", bundle: resourceBundle)

    /// The "pp_tile_0018" asset catalog image resource.
    static let ppTile0018 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0018", bundle: resourceBundle)

    /// The "pp_tile_0018_df16" asset catalog image resource.
    static let ppTile0018Df16 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0018_df16", bundle: resourceBundle)

    /// The "pp_tile_0019" asset catalog image resource.
    static let ppTile0019 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0019", bundle: resourceBundle)

    /// The "pp_tile_0019_5b93" asset catalog image resource.
    static let ppTile00195B93 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0019_5b93", bundle: resourceBundle)

    /// The "pp_tile_0020" asset catalog image resource.
    static let ppTile0020 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0020", bundle: resourceBundle)

    /// The "pp_tile_0020_907a" asset catalog image resource.
    static let ppTile0020907A = DeveloperToolsSupport.ImageResource(name: "pp_tile_0020_907a", bundle: resourceBundle)

    /// The "pp_tile_0021" asset catalog image resource.
    static let ppTile0021 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0021", bundle: resourceBundle)

    /// The "pp_tile_0021_7b8b" asset catalog image resource.
    static let ppTile00217B8B = DeveloperToolsSupport.ImageResource(name: "pp_tile_0021_7b8b", bundle: resourceBundle)

    /// The "pp_tile_0022" asset catalog image resource.
    static let ppTile0022 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0022", bundle: resourceBundle)

    /// The "pp_tile_0022_6ed3" asset catalog image resource.
    static let ppTile00226Ed3 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0022_6ed3", bundle: resourceBundle)

    /// The "pp_tile_0023" asset catalog image resource.
    static let ppTile0023 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0023", bundle: resourceBundle)

    /// The "pp_tile_0023_16f0" asset catalog image resource.
    static let ppTile002316F0 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0023_16f0", bundle: resourceBundle)

    /// The "pp_tile_0024" asset catalog image resource.
    static let ppTile0024 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0024", bundle: resourceBundle)

    /// The "pp_tile_0025" asset catalog image resource.
    static let ppTile0025 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0025", bundle: resourceBundle)

    /// The "pp_tile_0026" asset catalog image resource.
    static let ppTile0026 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0026", bundle: resourceBundle)

    /// The "pp_tile_0027" asset catalog image resource.
    static let ppTile0027 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0027", bundle: resourceBundle)

    /// The "pp_tile_0028" asset catalog image resource.
    static let ppTile0028 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0028", bundle: resourceBundle)

    /// The "pp_tile_0029" asset catalog image resource.
    static let ppTile0029 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0029", bundle: resourceBundle)

    /// The "pp_tile_0030" asset catalog image resource.
    static let ppTile0030 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0030", bundle: resourceBundle)

    /// The "pp_tile_0031" asset catalog image resource.
    static let ppTile0031 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0031", bundle: resourceBundle)

    /// The "pp_tile_0032" asset catalog image resource.
    static let ppTile0032 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0032", bundle: resourceBundle)

    /// The "pp_tile_0033" asset catalog image resource.
    static let ppTile0033 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0033", bundle: resourceBundle)

    /// The "pp_tile_0034" asset catalog image resource.
    static let ppTile0034 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0034", bundle: resourceBundle)

    /// The "pp_tile_0035" asset catalog image resource.
    static let ppTile0035 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0035", bundle: resourceBundle)

    /// The "pp_tile_0036" asset catalog image resource.
    static let ppTile0036 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0036", bundle: resourceBundle)

    /// The "pp_tile_0037" asset catalog image resource.
    static let ppTile0037 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0037", bundle: resourceBundle)

    /// The "pp_tile_0038" asset catalog image resource.
    static let ppTile0038 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0038", bundle: resourceBundle)

    /// The "pp_tile_0039" asset catalog image resource.
    static let ppTile0039 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0039", bundle: resourceBundle)

    /// The "pp_tile_0040" asset catalog image resource.
    static let ppTile0040 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0040", bundle: resourceBundle)

    /// The "pp_tile_0041" asset catalog image resource.
    static let ppTile0041 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0041", bundle: resourceBundle)

    /// The "pp_tile_0042" asset catalog image resource.
    static let ppTile0042 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0042", bundle: resourceBundle)

    /// The "pp_tile_0043" asset catalog image resource.
    static let ppTile0043 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0043", bundle: resourceBundle)

    /// The "pp_tile_0044" asset catalog image resource.
    static let ppTile0044 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0044", bundle: resourceBundle)

    /// The "pp_tile_0045" asset catalog image resource.
    static let ppTile0045 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0045", bundle: resourceBundle)

    /// The "pp_tile_0046" asset catalog image resource.
    static let ppTile0046 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0046", bundle: resourceBundle)

    /// The "pp_tile_0047" asset catalog image resource.
    static let ppTile0047 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0047", bundle: resourceBundle)

    /// The "pp_tile_0048" asset catalog image resource.
    static let ppTile0048 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0048", bundle: resourceBundle)

    /// The "pp_tile_0049" asset catalog image resource.
    static let ppTile0049 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0049", bundle: resourceBundle)

    /// The "pp_tile_0050" asset catalog image resource.
    static let ppTile0050 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0050", bundle: resourceBundle)

    /// The "pp_tile_0051" asset catalog image resource.
    static let ppTile0051 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0051", bundle: resourceBundle)

    /// The "pp_tile_0052" asset catalog image resource.
    static let ppTile0052 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0052", bundle: resourceBundle)

    /// The "pp_tile_0053" asset catalog image resource.
    static let ppTile0053 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0053", bundle: resourceBundle)

    /// The "pp_tile_0054" asset catalog image resource.
    static let ppTile0054 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0054", bundle: resourceBundle)

    /// The "pp_tile_0055" asset catalog image resource.
    static let ppTile0055 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0055", bundle: resourceBundle)

    /// The "pp_tile_0056" asset catalog image resource.
    static let ppTile0056 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0056", bundle: resourceBundle)

    /// The "pp_tile_0057" asset catalog image resource.
    static let ppTile0057 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0057", bundle: resourceBundle)

    /// The "pp_tile_0058" asset catalog image resource.
    static let ppTile0058 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0058", bundle: resourceBundle)

    /// The "pp_tile_0059" asset catalog image resource.
    static let ppTile0059 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0059", bundle: resourceBundle)

    /// The "pp_tile_0060" asset catalog image resource.
    static let ppTile0060 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0060", bundle: resourceBundle)

    /// The "pp_tile_0061" asset catalog image resource.
    static let ppTile0061 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0061", bundle: resourceBundle)

    /// The "pp_tile_0062" asset catalog image resource.
    static let ppTile0062 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0062", bundle: resourceBundle)

    /// The "pp_tile_0063" asset catalog image resource.
    static let ppTile0063 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0063", bundle: resourceBundle)

    /// The "pp_tile_0064" asset catalog image resource.
    static let ppTile0064 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0064", bundle: resourceBundle)

    /// The "pp_tile_0065" asset catalog image resource.
    static let ppTile0065 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0065", bundle: resourceBundle)

    /// The "pp_tile_0066" asset catalog image resource.
    static let ppTile0066 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0066", bundle: resourceBundle)

    /// The "pp_tile_0067" asset catalog image resource.
    static let ppTile0067 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0067", bundle: resourceBundle)

    /// The "pp_tile_0068" asset catalog image resource.
    static let ppTile0068 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0068", bundle: resourceBundle)

    /// The "pp_tile_0069" asset catalog image resource.
    static let ppTile0069 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0069", bundle: resourceBundle)

    /// The "pp_tile_0070" asset catalog image resource.
    static let ppTile0070 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0070", bundle: resourceBundle)

    /// The "pp_tile_0071" asset catalog image resource.
    static let ppTile0071 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0071", bundle: resourceBundle)

    /// The "pp_tile_0072" asset catalog image resource.
    static let ppTile0072 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0072", bundle: resourceBundle)

    /// The "pp_tile_0073" asset catalog image resource.
    static let ppTile0073 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0073", bundle: resourceBundle)

    /// The "pp_tile_0074" asset catalog image resource.
    static let ppTile0074 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0074", bundle: resourceBundle)

    /// The "pp_tile_0075" asset catalog image resource.
    static let ppTile0075 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0075", bundle: resourceBundle)

    /// The "pp_tile_0076" asset catalog image resource.
    static let ppTile0076 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0076", bundle: resourceBundle)

    /// The "pp_tile_0077" asset catalog image resource.
    static let ppTile0077 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0077", bundle: resourceBundle)

    /// The "pp_tile_0078" asset catalog image resource.
    static let ppTile0078 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0078", bundle: resourceBundle)

    /// The "pp_tile_0079" asset catalog image resource.
    static let ppTile0079 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0079", bundle: resourceBundle)

    /// The "pp_tile_0080" asset catalog image resource.
    static let ppTile0080 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0080", bundle: resourceBundle)

    /// The "pp_tile_0081" asset catalog image resource.
    static let ppTile0081 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0081", bundle: resourceBundle)

    /// The "pp_tile_0082" asset catalog image resource.
    static let ppTile0082 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0082", bundle: resourceBundle)

    /// The "pp_tile_0083" asset catalog image resource.
    static let ppTile0083 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0083", bundle: resourceBundle)

    /// The "pp_tile_0084" asset catalog image resource.
    static let ppTile0084 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0084", bundle: resourceBundle)

    /// The "pp_tile_0085" asset catalog image resource.
    static let ppTile0085 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0085", bundle: resourceBundle)

    /// The "pp_tile_0086" asset catalog image resource.
    static let ppTile0086 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0086", bundle: resourceBundle)

    /// The "pp_tile_0087" asset catalog image resource.
    static let ppTile0087 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0087", bundle: resourceBundle)

    /// The "pp_tile_0088" asset catalog image resource.
    static let ppTile0088 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0088", bundle: resourceBundle)

    /// The "pp_tile_0089" asset catalog image resource.
    static let ppTile0089 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0089", bundle: resourceBundle)

    /// The "pp_tile_0090" asset catalog image resource.
    static let ppTile0090 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0090", bundle: resourceBundle)

    /// The "pp_tile_0091" asset catalog image resource.
    static let ppTile0091 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0091", bundle: resourceBundle)

    /// The "pp_tile_0092" asset catalog image resource.
    static let ppTile0092 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0092", bundle: resourceBundle)

    /// The "pp_tile_0093" asset catalog image resource.
    static let ppTile0093 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0093", bundle: resourceBundle)

    /// The "pp_tile_0094" asset catalog image resource.
    static let ppTile0094 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0094", bundle: resourceBundle)

    /// The "pp_tile_0095" asset catalog image resource.
    static let ppTile0095 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0095", bundle: resourceBundle)

    /// The "pp_tile_0096" asset catalog image resource.
    static let ppTile0096 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0096", bundle: resourceBundle)

    /// The "pp_tile_0097" asset catalog image resource.
    static let ppTile0097 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0097", bundle: resourceBundle)

    /// The "pp_tile_0098" asset catalog image resource.
    static let ppTile0098 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0098", bundle: resourceBundle)

    /// The "pp_tile_0099" asset catalog image resource.
    static let ppTile0099 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0099", bundle: resourceBundle)

    /// The "pp_tile_0100" asset catalog image resource.
    static let ppTile0100 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0100", bundle: resourceBundle)

    /// The "pp_tile_0101" asset catalog image resource.
    static let ppTile0101 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0101", bundle: resourceBundle)

    /// The "pp_tile_0102" asset catalog image resource.
    static let ppTile0102 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0102", bundle: resourceBundle)

    /// The "pp_tile_0103" asset catalog image resource.
    static let ppTile0103 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0103", bundle: resourceBundle)

    /// The "pp_tile_0104" asset catalog image resource.
    static let ppTile0104 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0104", bundle: resourceBundle)

    /// The "pp_tile_0105" asset catalog image resource.
    static let ppTile0105 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0105", bundle: resourceBundle)

    /// The "pp_tile_0106" asset catalog image resource.
    static let ppTile0106 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0106", bundle: resourceBundle)

    /// The "pp_tile_0107" asset catalog image resource.
    static let ppTile0107 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0107", bundle: resourceBundle)

    /// The "pp_tile_0108" asset catalog image resource.
    static let ppTile0108 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0108", bundle: resourceBundle)

    /// The "pp_tile_0109" asset catalog image resource.
    static let ppTile0109 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0109", bundle: resourceBundle)

    /// The "pp_tile_0110" asset catalog image resource.
    static let ppTile0110 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0110", bundle: resourceBundle)

    /// The "pp_tile_0111" asset catalog image resource.
    static let ppTile0111 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0111", bundle: resourceBundle)

    /// The "pp_tile_0112" asset catalog image resource.
    static let ppTile0112 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0112", bundle: resourceBundle)

    /// The "pp_tile_0113" asset catalog image resource.
    static let ppTile0113 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0113", bundle: resourceBundle)

    /// The "pp_tile_0114" asset catalog image resource.
    static let ppTile0114 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0114", bundle: resourceBundle)

    /// The "pp_tile_0115" asset catalog image resource.
    static let ppTile0115 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0115", bundle: resourceBundle)

    /// The "pp_tile_0116" asset catalog image resource.
    static let ppTile0116 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0116", bundle: resourceBundle)

    /// The "pp_tile_0117" asset catalog image resource.
    static let ppTile0117 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0117", bundle: resourceBundle)

    /// The "pp_tile_0118" asset catalog image resource.
    static let ppTile0118 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0118", bundle: resourceBundle)

    /// The "pp_tile_0119" asset catalog image resource.
    static let ppTile0119 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0119", bundle: resourceBundle)

    /// The "pp_tile_0120" asset catalog image resource.
    static let ppTile0120 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0120", bundle: resourceBundle)

    /// The "pp_tile_0121" asset catalog image resource.
    static let ppTile0121 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0121", bundle: resourceBundle)

    /// The "pp_tile_0122" asset catalog image resource.
    static let ppTile0122 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0122", bundle: resourceBundle)

    /// The "pp_tile_0123" asset catalog image resource.
    static let ppTile0123 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0123", bundle: resourceBundle)

    /// The "pp_tile_0124" asset catalog image resource.
    static let ppTile0124 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0124", bundle: resourceBundle)

    /// The "pp_tile_0125" asset catalog image resource.
    static let ppTile0125 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0125", bundle: resourceBundle)

    /// The "pp_tile_0126" asset catalog image resource.
    static let ppTile0126 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0126", bundle: resourceBundle)

    /// The "pp_tile_0127" asset catalog image resource.
    static let ppTile0127 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0127", bundle: resourceBundle)

    /// The "pp_tile_0128" asset catalog image resource.
    static let ppTile0128 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0128", bundle: resourceBundle)

    /// The "pp_tile_0129" asset catalog image resource.
    static let ppTile0129 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0129", bundle: resourceBundle)

    /// The "pp_tile_0130" asset catalog image resource.
    static let ppTile0130 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0130", bundle: resourceBundle)

    /// The "pp_tile_0131" asset catalog image resource.
    static let ppTile0131 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0131", bundle: resourceBundle)

    /// The "pp_tile_0132" asset catalog image resource.
    static let ppTile0132 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0132", bundle: resourceBundle)

    /// The "pp_tile_0133" asset catalog image resource.
    static let ppTile0133 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0133", bundle: resourceBundle)

    /// The "pp_tile_0134" asset catalog image resource.
    static let ppTile0134 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0134", bundle: resourceBundle)

    /// The "pp_tile_0135" asset catalog image resource.
    static let ppTile0135 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0135", bundle: resourceBundle)

    /// The "pp_tile_0136" asset catalog image resource.
    static let ppTile0136 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0136", bundle: resourceBundle)

    /// The "pp_tile_0137" asset catalog image resource.
    static let ppTile0137 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0137", bundle: resourceBundle)

    /// The "pp_tile_0138" asset catalog image resource.
    static let ppTile0138 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0138", bundle: resourceBundle)

    /// The "pp_tile_0139" asset catalog image resource.
    static let ppTile0139 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0139", bundle: resourceBundle)

    /// The "pp_tile_0140" asset catalog image resource.
    static let ppTile0140 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0140", bundle: resourceBundle)

    /// The "pp_tile_0141" asset catalog image resource.
    static let ppTile0141 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0141", bundle: resourceBundle)

    /// The "pp_tile_0142" asset catalog image resource.
    static let ppTile0142 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0142", bundle: resourceBundle)

    /// The "pp_tile_0143" asset catalog image resource.
    static let ppTile0143 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0143", bundle: resourceBundle)

    /// The "pp_tile_0144" asset catalog image resource.
    static let ppTile0144 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0144", bundle: resourceBundle)

    /// The "pp_tile_0145" asset catalog image resource.
    static let ppTile0145 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0145", bundle: resourceBundle)

    /// The "pp_tile_0146" asset catalog image resource.
    static let ppTile0146 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0146", bundle: resourceBundle)

    /// The "pp_tile_0147" asset catalog image resource.
    static let ppTile0147 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0147", bundle: resourceBundle)

    /// The "pp_tile_0148" asset catalog image resource.
    static let ppTile0148 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0148", bundle: resourceBundle)

    /// The "pp_tile_0149" asset catalog image resource.
    static let ppTile0149 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0149", bundle: resourceBundle)

    /// The "pp_tile_0150" asset catalog image resource.
    static let ppTile0150 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0150", bundle: resourceBundle)

    /// The "pp_tile_0151" asset catalog image resource.
    static let ppTile0151 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0151", bundle: resourceBundle)

    /// The "pp_tile_0152" asset catalog image resource.
    static let ppTile0152 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0152", bundle: resourceBundle)

    /// The "pp_tile_0153" asset catalog image resource.
    static let ppTile0153 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0153", bundle: resourceBundle)

    /// The "pp_tile_0154" asset catalog image resource.
    static let ppTile0154 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0154", bundle: resourceBundle)

    /// The "pp_tile_0155" asset catalog image resource.
    static let ppTile0155 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0155", bundle: resourceBundle)

    /// The "pp_tile_0156" asset catalog image resource.
    static let ppTile0156 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0156", bundle: resourceBundle)

    /// The "pp_tile_0157" asset catalog image resource.
    static let ppTile0157 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0157", bundle: resourceBundle)

    /// The "pp_tile_0158" asset catalog image resource.
    static let ppTile0158 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0158", bundle: resourceBundle)

    /// The "pp_tile_0159" asset catalog image resource.
    static let ppTile0159 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0159", bundle: resourceBundle)

    /// The "pp_tile_0160" asset catalog image resource.
    static let ppTile0160 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0160", bundle: resourceBundle)

    /// The "pp_tile_0161" asset catalog image resource.
    static let ppTile0161 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0161", bundle: resourceBundle)

    /// The "pp_tile_0162" asset catalog image resource.
    static let ppTile0162 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0162", bundle: resourceBundle)

    /// The "pp_tile_0163" asset catalog image resource.
    static let ppTile0163 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0163", bundle: resourceBundle)

    /// The "pp_tile_0164" asset catalog image resource.
    static let ppTile0164 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0164", bundle: resourceBundle)

    /// The "pp_tile_0165" asset catalog image resource.
    static let ppTile0165 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0165", bundle: resourceBundle)

    /// The "pp_tile_0166" asset catalog image resource.
    static let ppTile0166 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0166", bundle: resourceBundle)

    /// The "pp_tile_0167" asset catalog image resource.
    static let ppTile0167 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0167", bundle: resourceBundle)

    /// The "pp_tile_0168" asset catalog image resource.
    static let ppTile0168 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0168", bundle: resourceBundle)

    /// The "pp_tile_0169" asset catalog image resource.
    static let ppTile0169 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0169", bundle: resourceBundle)

    /// The "pp_tile_0170" asset catalog image resource.
    static let ppTile0170 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0170", bundle: resourceBundle)

    /// The "pp_tile_0171" asset catalog image resource.
    static let ppTile0171 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0171", bundle: resourceBundle)

    /// The "pp_tile_0172" asset catalog image resource.
    static let ppTile0172 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0172", bundle: resourceBundle)

    /// The "pp_tile_0173" asset catalog image resource.
    static let ppTile0173 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0173", bundle: resourceBundle)

    /// The "pp_tile_0174" asset catalog image resource.
    static let ppTile0174 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0174", bundle: resourceBundle)

    /// The "pp_tile_0175" asset catalog image resource.
    static let ppTile0175 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0175", bundle: resourceBundle)

    /// The "pp_tile_0176" asset catalog image resource.
    static let ppTile0176 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0176", bundle: resourceBundle)

    /// The "pp_tile_0177" asset catalog image resource.
    static let ppTile0177 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0177", bundle: resourceBundle)

    /// The "pp_tile_0178" asset catalog image resource.
    static let ppTile0178 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0178", bundle: resourceBundle)

    /// The "pp_tile_0179" asset catalog image resource.
    static let ppTile0179 = DeveloperToolsSupport.ImageResource(name: "pp_tile_0179", bundle: resourceBundle)

    /// The "puff_whitePuff00" asset catalog image resource.
    static let puffWhitePuff00 = DeveloperToolsSupport.ImageResource(name: "puff_whitePuff00", bundle: resourceBundle)

    /// The "puff_whitePuff01" asset catalog image resource.
    static let puffWhitePuff01 = DeveloperToolsSupport.ImageResource(name: "puff_whitePuff01", bundle: resourceBundle)

    /// The "puff_whitePuff02" asset catalog image resource.
    static let puffWhitePuff02 = DeveloperToolsSupport.ImageResource(name: "puff_whitePuff02", bundle: resourceBundle)

    /// The "puff_whitePuff03" asset catalog image resource.
    static let puffWhitePuff03 = DeveloperToolsSupport.ImageResource(name: "puff_whitePuff03", bundle: resourceBundle)

    /// The "puff_whitePuff04" asset catalog image resource.
    static let puffWhitePuff04 = DeveloperToolsSupport.ImageResource(name: "puff_whitePuff04", bundle: resourceBundle)

    /// The "puff_whitePuff05" asset catalog image resource.
    static let puffWhitePuff05 = DeveloperToolsSupport.ImageResource(name: "puff_whitePuff05", bundle: resourceBundle)

    /// The "puff_whitePuff06" asset catalog image resource.
    static let puffWhitePuff06 = DeveloperToolsSupport.ImageResource(name: "puff_whitePuff06", bundle: resourceBundle)

    /// The "puff_whitePuff07" asset catalog image resource.
    static let puffWhitePuff07 = DeveloperToolsSupport.ImageResource(name: "puff_whitePuff07", bundle: resourceBundle)

    /// The "puff_whitePuff08" asset catalog image resource.
    static let puffWhitePuff08 = DeveloperToolsSupport.ImageResource(name: "puff_whitePuff08", bundle: resourceBundle)

    /// The "puff_whitePuff09" asset catalog image resource.
    static let puffWhitePuff09 = DeveloperToolsSupport.ImageResource(name: "puff_whitePuff09", bundle: resourceBundle)

    /// The "puff_whitePuff10" asset catalog image resource.
    static let puffWhitePuff10 = DeveloperToolsSupport.ImageResource(name: "puff_whitePuff10", bundle: resourceBundle)

    /// The "puff_whitePuff11" asset catalog image resource.
    static let puffWhitePuff11 = DeveloperToolsSupport.ImageResource(name: "puff_whitePuff11", bundle: resourceBundle)

    /// The "puff_whitePuff12" asset catalog image resource.
    static let puffWhitePuff12 = DeveloperToolsSupport.ImageResource(name: "puff_whitePuff12", bundle: resourceBundle)

    /// The "puff_whitePuff13" asset catalog image resource.
    static let puffWhitePuff13 = DeveloperToolsSupport.ImageResource(name: "puff_whitePuff13", bundle: resourceBundle)

    /// The "puff_whitePuff14" asset catalog image resource.
    static let puffWhitePuff14 = DeveloperToolsSupport.ImageResource(name: "puff_whitePuff14", bundle: resourceBundle)

    /// The "puff_whitePuff15" asset catalog image resource.
    static let puffWhitePuff15 = DeveloperToolsSupport.ImageResource(name: "puff_whitePuff15", bundle: resourceBundle)

    /// The "puff_whitePuff16" asset catalog image resource.
    static let puffWhitePuff16 = DeveloperToolsSupport.ImageResource(name: "puff_whitePuff16", bundle: resourceBundle)

    /// The "puff_whitePuff17" asset catalog image resource.
    static let puffWhitePuff17 = DeveloperToolsSupport.ImageResource(name: "puff_whitePuff17", bundle: resourceBundle)

    /// The "puff_whitePuff18" asset catalog image resource.
    static let puffWhitePuff18 = DeveloperToolsSupport.ImageResource(name: "puff_whitePuff18", bundle: resourceBundle)

    /// The "puff_whitePuff19" asset catalog image resource.
    static let puffWhitePuff19 = DeveloperToolsSupport.ImageResource(name: "puff_whitePuff19", bundle: resourceBundle)

    /// The "puff_whitePuff20" asset catalog image resource.
    static let puffWhitePuff20 = DeveloperToolsSupport.ImageResource(name: "puff_whitePuff20", bundle: resourceBundle)

    /// The "puff_whitePuff21" asset catalog image resource.
    static let puffWhitePuff21 = DeveloperToolsSupport.ImageResource(name: "puff_whitePuff21", bundle: resourceBundle)

    /// The "puff_whitePuff22" asset catalog image resource.
    static let puffWhitePuff22 = DeveloperToolsSupport.ImageResource(name: "puff_whitePuff22", bundle: resourceBundle)

    /// The "puff_whitePuff23" asset catalog image resource.
    static let puffWhitePuff23 = DeveloperToolsSupport.ImageResource(name: "puff_whitePuff23", bundle: resourceBundle)

    /// The "rock" asset catalog image resource.
    static let rock = DeveloperToolsSupport.ImageResource(name: "rock", bundle: resourceBundle)

    /// The "rune_sword" asset catalog image resource.
    static let runeSword = DeveloperToolsSupport.ImageResource(name: "rune_sword", bundle: resourceBundle)

    /// The "shield" asset catalog image resource.
    static let shield = DeveloperToolsSupport.ImageResource(name: "shield", bundle: resourceBundle)

    /// The "signpost" asset catalog image resource.
    static let signpost = DeveloperToolsSupport.ImageResource(name: "signpost", bundle: resourceBundle)

    /// The "skeleton" asset catalog image resource.
    static let skeleton = DeveloperToolsSupport.ImageResource(name: "skeleton", bundle: resourceBundle)

    /// The "slime" asset catalog image resource.
    static let slime = DeveloperToolsSupport.ImageResource(name: "slime", bundle: resourceBundle)

    /// The "spell_books" asset catalog image resource.
    static let spellBooks = DeveloperToolsSupport.ImageResource(name: "spell_books", bundle: resourceBundle)

    /// The "spider" asset catalog image resource.
    static let spider = DeveloperToolsSupport.ImageResource(name: "spider", bundle: resourceBundle)

    /// The "star" asset catalog image resource.
    static let star = DeveloperToolsSupport.ImageResource(name: "star", bundle: resourceBundle)

    /// The "tb_tile_0000" asset catalog image resource.
    static let tbTile0000 = DeveloperToolsSupport.ImageResource(name: "tb_tile_0000", bundle: resourceBundle)

    /// The "tb_tile_0003" asset catalog image resource.
    static let tbTile0003 = DeveloperToolsSupport.ImageResource(name: "tb_tile_0003", bundle: resourceBundle)

    /// The "tb_tile_0006" asset catalog image resource.
    static let tbTile0006 = DeveloperToolsSupport.ImageResource(name: "tb_tile_0006", bundle: resourceBundle)

    /// The "tb_tile_0009" asset catalog image resource.
    static let tbTile0009 = DeveloperToolsSupport.ImageResource(name: "tb_tile_0009", bundle: resourceBundle)

    /// The "tb_tile_0012" asset catalog image resource.
    static let tbTile0012 = DeveloperToolsSupport.ImageResource(name: "tb_tile_0012", bundle: resourceBundle)

    /// The "tb_tile_0015" asset catalog image resource.
    static let tbTile0015 = DeveloperToolsSupport.ImageResource(name: "tb_tile_0015", bundle: resourceBundle)

    /// The "tb_tile_0018" asset catalog image resource.
    static let tbTile0018 = DeveloperToolsSupport.ImageResource(name: "tb_tile_0018", bundle: resourceBundle)

    /// The "tb_tile_0021" asset catalog image resource.
    static let tbTile0021 = DeveloperToolsSupport.ImageResource(name: "tb_tile_0021", bundle: resourceBundle)

    /// The "tb_tile_0024" asset catalog image resource.
    static let tbTile0024 = DeveloperToolsSupport.ImageResource(name: "tb_tile_0024", bundle: resourceBundle)

    /// The "tb_tile_0027" asset catalog image resource.
    static let tbTile0027 = DeveloperToolsSupport.ImageResource(name: "tb_tile_0027", bundle: resourceBundle)

    /// The "tb_tile_0030" asset catalog image resource.
    static let tbTile0030 = DeveloperToolsSupport.ImageResource(name: "tb_tile_0030", bundle: resourceBundle)

    /// The "tb_tile_0033" asset catalog image resource.
    static let tbTile0033 = DeveloperToolsSupport.ImageResource(name: "tb_tile_0033", bundle: resourceBundle)

    /// The "tb_tile_0036" asset catalog image resource.
    static let tbTile0036 = DeveloperToolsSupport.ImageResource(name: "tb_tile_0036", bundle: resourceBundle)

    /// The "tb_tile_0039" asset catalog image resource.
    static let tbTile0039 = DeveloperToolsSupport.ImageResource(name: "tb_tile_0039", bundle: resourceBundle)

    /// The "tb_tile_0042" asset catalog image resource.
    static let tbTile0042 = DeveloperToolsSupport.ImageResource(name: "tb_tile_0042", bundle: resourceBundle)

    /// The "tb_tile_0045" asset catalog image resource.
    static let tbTile0045 = DeveloperToolsSupport.ImageResource(name: "tb_tile_0045", bundle: resourceBundle)

    /// The "tb_tile_0048" asset catalog image resource.
    static let tbTile0048 = DeveloperToolsSupport.ImageResource(name: "tb_tile_0048", bundle: resourceBundle)

    /// The "tb_tile_0051" asset catalog image resource.
    static let tbTile0051 = DeveloperToolsSupport.ImageResource(name: "tb_tile_0051", bundle: resourceBundle)

    /// The "tb_tile_0054" asset catalog image resource.
    static let tbTile0054 = DeveloperToolsSupport.ImageResource(name: "tb_tile_0054", bundle: resourceBundle)

    /// The "tb_tile_0057" asset catalog image resource.
    static let tbTile0057 = DeveloperToolsSupport.ImageResource(name: "tb_tile_0057", bundle: resourceBundle)

    /// The "tb_tile_0060" asset catalog image resource.
    static let tbTile0060 = DeveloperToolsSupport.ImageResource(name: "tb_tile_0060", bundle: resourceBundle)

    /// The "tb_tile_0063" asset catalog image resource.
    static let tbTile0063 = DeveloperToolsSupport.ImageResource(name: "tb_tile_0063", bundle: resourceBundle)

    /// The "tb_tile_0066" asset catalog image resource.
    static let tbTile0066 = DeveloperToolsSupport.ImageResource(name: "tb_tile_0066", bundle: resourceBundle)

    /// The "tb_tile_0069" asset catalog image resource.
    static let tbTile0069 = DeveloperToolsSupport.ImageResource(name: "tb_tile_0069", bundle: resourceBundle)

    /// The "tb_tile_0072" asset catalog image resource.
    static let tbTile0072 = DeveloperToolsSupport.ImageResource(name: "tb_tile_0072", bundle: resourceBundle)

    /// The "tb_tile_0075" asset catalog image resource.
    static let tbTile0075 = DeveloperToolsSupport.ImageResource(name: "tb_tile_0075", bundle: resourceBundle)

    /// The "tb_tile_0078" asset catalog image resource.
    static let tbTile0078 = DeveloperToolsSupport.ImageResource(name: "tb_tile_0078", bundle: resourceBundle)

    /// The "tb_tile_0081" asset catalog image resource.
    static let tbTile0081 = DeveloperToolsSupport.ImageResource(name: "tb_tile_0081", bundle: resourceBundle)

    /// The "tb_tile_0084" asset catalog image resource.
    static let tbTile0084 = DeveloperToolsSupport.ImageResource(name: "tb_tile_0084", bundle: resourceBundle)

    /// The "tb_tile_0087" asset catalog image resource.
    static let tbTile0087 = DeveloperToolsSupport.ImageResource(name: "tb_tile_0087", bundle: resourceBundle)

    /// The "tb_tile_0090" asset catalog image resource.
    static let tbTile0090 = DeveloperToolsSupport.ImageResource(name: "tb_tile_0090", bundle: resourceBundle)

    /// The "tb_tile_0093" asset catalog image resource.
    static let tbTile0093 = DeveloperToolsSupport.ImageResource(name: "tb_tile_0093", bundle: resourceBundle)

    /// The "tb_tile_0096" asset catalog image resource.
    static let tbTile0096 = DeveloperToolsSupport.ImageResource(name: "tb_tile_0096", bundle: resourceBundle)

    /// The "tb_tile_0099" asset catalog image resource.
    static let tbTile0099 = DeveloperToolsSupport.ImageResource(name: "tb_tile_0099", bundle: resourceBundle)

    /// The "tb_tile_0102" asset catalog image resource.
    static let tbTile0102 = DeveloperToolsSupport.ImageResource(name: "tb_tile_0102", bundle: resourceBundle)

    /// The "tb_tile_0105" asset catalog image resource.
    static let tbTile0105 = DeveloperToolsSupport.ImageResource(name: "tb_tile_0105", bundle: resourceBundle)

    /// The "tb_tile_0108" asset catalog image resource.
    static let tbTile0108 = DeveloperToolsSupport.ImageResource(name: "tb_tile_0108", bundle: resourceBundle)

    /// The "tb_tile_0111" asset catalog image resource.
    static let tbTile0111 = DeveloperToolsSupport.ImageResource(name: "tb_tile_0111", bundle: resourceBundle)

    /// The "tb_tile_0114" asset catalog image resource.
    static let tbTile0114 = DeveloperToolsSupport.ImageResource(name: "tb_tile_0114", bundle: resourceBundle)

    /// The "tb_tile_0117" asset catalog image resource.
    static let tbTile0117 = DeveloperToolsSupport.ImageResource(name: "tb_tile_0117", bundle: resourceBundle)

    /// The "tb_tile_0120" asset catalog image resource.
    static let tbTile0120 = DeveloperToolsSupport.ImageResource(name: "tb_tile_0120", bundle: resourceBundle)

    /// The "tb_tile_0123" asset catalog image resource.
    static let tbTile0123 = DeveloperToolsSupport.ImageResource(name: "tb_tile_0123", bundle: resourceBundle)

    /// The "tb_tile_0126" asset catalog image resource.
    static let tbTile0126 = DeveloperToolsSupport.ImageResource(name: "tb_tile_0126", bundle: resourceBundle)

    /// The "tb_tile_0129" asset catalog image resource.
    static let tbTile0129 = DeveloperToolsSupport.ImageResource(name: "tb_tile_0129", bundle: resourceBundle)

    /// The "tb_tile_0132" asset catalog image resource.
    static let tbTile0132 = DeveloperToolsSupport.ImageResource(name: "tb_tile_0132", bundle: resourceBundle)

    /// The "tb_tile_0135" asset catalog image resource.
    static let tbTile0135 = DeveloperToolsSupport.ImageResource(name: "tb_tile_0135", bundle: resourceBundle)

    /// The "tb_tile_0138" asset catalog image resource.
    static let tbTile0138 = DeveloperToolsSupport.ImageResource(name: "tb_tile_0138", bundle: resourceBundle)

    /// The "tb_tile_0141" asset catalog image resource.
    static let tbTile0141 = DeveloperToolsSupport.ImageResource(name: "tb_tile_0141", bundle: resourceBundle)

    /// The "tb_tile_0144" asset catalog image resource.
    static let tbTile0144 = DeveloperToolsSupport.ImageResource(name: "tb_tile_0144", bundle: resourceBundle)

    /// The "tb_tile_0147" asset catalog image resource.
    static let tbTile0147 = DeveloperToolsSupport.ImageResource(name: "tb_tile_0147", bundle: resourceBundle)

    /// The "td_detail_crystal" asset catalog image resource.
    static let tdDetailCrystal = DeveloperToolsSupport.ImageResource(name: "td_detail_crystal", bundle: resourceBundle)

    /// The "td_detail_crystal_large" asset catalog image resource.
    static let tdDetailCrystalLarge = DeveloperToolsSupport.ImageResource(name: "td_detail_crystal_large", bundle: resourceBundle)

    /// The "td_detail_dirt" asset catalog image resource.
    static let tdDetailDirt = DeveloperToolsSupport.ImageResource(name: "td_detail_dirt", bundle: resourceBundle)

    /// The "td_detail_dirt_large" asset catalog image resource.
    static let tdDetailDirtLarge = DeveloperToolsSupport.ImageResource(name: "td_detail_dirt_large", bundle: resourceBundle)

    /// The "td_detail_rocks" asset catalog image resource.
    static let tdDetailRocks = DeveloperToolsSupport.ImageResource(name: "td_detail_rocks", bundle: resourceBundle)

    /// The "td_detail_rocks_large" asset catalog image resource.
    static let tdDetailRocksLarge = DeveloperToolsSupport.ImageResource(name: "td_detail_rocks_large", bundle: resourceBundle)

    /// The "td_detail_tree" asset catalog image resource.
    static let tdDetailTree = DeveloperToolsSupport.ImageResource(name: "td_detail_tree", bundle: resourceBundle)

    /// The "td_detail_tree_large" asset catalog image resource.
    static let tdDetailTreeLarge = DeveloperToolsSupport.ImageResource(name: "td_detail_tree_large", bundle: resourceBundle)

    /// The "td_enemy_ufo_a" asset catalog image resource.
    static let tdEnemyUfoA = DeveloperToolsSupport.ImageResource(name: "td_enemy_ufo_a", bundle: resourceBundle)

    /// The "td_enemy_ufo_a_weapon" asset catalog image resource.
    static let tdEnemyUfoAWeapon = DeveloperToolsSupport.ImageResource(name: "td_enemy_ufo_a_weapon", bundle: resourceBundle)

    /// The "td_enemy_ufo_b" asset catalog image resource.
    static let tdEnemyUfoB = DeveloperToolsSupport.ImageResource(name: "td_enemy_ufo_b", bundle: resourceBundle)

    /// The "td_enemy_ufo_b_weapon" asset catalog image resource.
    static let tdEnemyUfoBWeapon = DeveloperToolsSupport.ImageResource(name: "td_enemy_ufo_b_weapon", bundle: resourceBundle)

    /// The "td_enemy_ufo_beam" asset catalog image resource.
    static let tdEnemyUfoBeam = DeveloperToolsSupport.ImageResource(name: "td_enemy_ufo_beam", bundle: resourceBundle)

    /// The "td_enemy_ufo_beam_burst" asset catalog image resource.
    static let tdEnemyUfoBeamBurst = DeveloperToolsSupport.ImageResource(name: "td_enemy_ufo_beam_burst", bundle: resourceBundle)

    /// The "td_enemy_ufo_c" asset catalog image resource.
    static let tdEnemyUfoC = DeveloperToolsSupport.ImageResource(name: "td_enemy_ufo_c", bundle: resourceBundle)

    /// The "td_enemy_ufo_c_weapon" asset catalog image resource.
    static let tdEnemyUfoCWeapon = DeveloperToolsSupport.ImageResource(name: "td_enemy_ufo_c_weapon", bundle: resourceBundle)

    /// The "td_enemy_ufo_d" asset catalog image resource.
    static let tdEnemyUfoD = DeveloperToolsSupport.ImageResource(name: "td_enemy_ufo_d", bundle: resourceBundle)

    /// The "td_enemy_ufo_d_weapon" asset catalog image resource.
    static let tdEnemyUfoDWeapon = DeveloperToolsSupport.ImageResource(name: "td_enemy_ufo_d_weapon", bundle: resourceBundle)

    /// The "td_selection_a" asset catalog image resource.
    static let tdSelectionA = DeveloperToolsSupport.ImageResource(name: "td_selection_a", bundle: resourceBundle)

    /// The "td_selection_b" asset catalog image resource.
    static let tdSelectionB = DeveloperToolsSupport.ImageResource(name: "td_selection_b", bundle: resourceBundle)

    /// The "td_snow_detail_crystal" asset catalog image resource.
    static let tdSnowDetailCrystal = DeveloperToolsSupport.ImageResource(name: "td_snow_detail_crystal", bundle: resourceBundle)

    /// The "td_snow_detail_crystal_large" asset catalog image resource.
    static let tdSnowDetailCrystalLarge = DeveloperToolsSupport.ImageResource(name: "td_snow_detail_crystal_large", bundle: resourceBundle)

    /// The "td_snow_detail_dirt" asset catalog image resource.
    static let tdSnowDetailDirt = DeveloperToolsSupport.ImageResource(name: "td_snow_detail_dirt", bundle: resourceBundle)

    /// The "td_snow_detail_dirt_large" asset catalog image resource.
    static let tdSnowDetailDirtLarge = DeveloperToolsSupport.ImageResource(name: "td_snow_detail_dirt_large", bundle: resourceBundle)

    /// The "td_snow_detail_rocks" asset catalog image resource.
    static let tdSnowDetailRocks = DeveloperToolsSupport.ImageResource(name: "td_snow_detail_rocks", bundle: resourceBundle)

    /// The "td_snow_detail_rocks_large" asset catalog image resource.
    static let tdSnowDetailRocksLarge = DeveloperToolsSupport.ImageResource(name: "td_snow_detail_rocks_large", bundle: resourceBundle)

    /// The "td_snow_detail_tree" asset catalog image resource.
    static let tdSnowDetailTree = DeveloperToolsSupport.ImageResource(name: "td_snow_detail_tree", bundle: resourceBundle)

    /// The "td_snow_detail_tree_large" asset catalog image resource.
    static let tdSnowDetailTreeLarge = DeveloperToolsSupport.ImageResource(name: "td_snow_detail_tree_large", bundle: resourceBundle)

    /// The "td_snow_tile" asset catalog image resource.
    static let tdSnowTile = DeveloperToolsSupport.ImageResource(name: "td_snow_tile", bundle: resourceBundle)

    /// The "td_snow_tile_bump" asset catalog image resource.
    static let tdSnowTileBump = DeveloperToolsSupport.ImageResource(name: "td_snow_tile_bump", bundle: resourceBundle)

    /// The "td_snow_tile_corner_inner" asset catalog image resource.
    static let tdSnowTileCornerInner = DeveloperToolsSupport.ImageResource(name: "td_snow_tile_corner_inner", bundle: resourceBundle)

    /// The "td_snow_tile_corner_large" asset catalog image resource.
    static let tdSnowTileCornerLarge = DeveloperToolsSupport.ImageResource(name: "td_snow_tile_corner_large", bundle: resourceBundle)

    /// The "td_snow_tile_corner_outer" asset catalog image resource.
    static let tdSnowTileCornerOuter = DeveloperToolsSupport.ImageResource(name: "td_snow_tile_corner_outer", bundle: resourceBundle)

    /// The "td_snow_tile_corner_round" asset catalog image resource.
    static let tdSnowTileCornerRound = DeveloperToolsSupport.ImageResource(name: "td_snow_tile_corner_round", bundle: resourceBundle)

    /// The "td_snow_tile_corner_square" asset catalog image resource.
    static let tdSnowTileCornerSquare = DeveloperToolsSupport.ImageResource(name: "td_snow_tile_corner_square", bundle: resourceBundle)

    /// The "td_snow_tile_crossing" asset catalog image resource.
    static let tdSnowTileCrossing = DeveloperToolsSupport.ImageResource(name: "td_snow_tile_crossing", bundle: resourceBundle)

    /// The "td_snow_tile_crystal" asset catalog image resource.
    static let tdSnowTileCrystal = DeveloperToolsSupport.ImageResource(name: "td_snow_tile_crystal", bundle: resourceBundle)

    /// The "td_snow_tile_dirt" asset catalog image resource.
    static let tdSnowTileDirt = DeveloperToolsSupport.ImageResource(name: "td_snow_tile_dirt", bundle: resourceBundle)

    /// The "td_snow_tile_end" asset catalog image resource.
    static let tdSnowTileEnd = DeveloperToolsSupport.ImageResource(name: "td_snow_tile_end", bundle: resourceBundle)

    /// The "td_snow_tile_end_round" asset catalog image resource.
    static let tdSnowTileEndRound = DeveloperToolsSupport.ImageResource(name: "td_snow_tile_end_round", bundle: resourceBundle)

    /// The "td_snow_tile_hill" asset catalog image resource.
    static let tdSnowTileHill = DeveloperToolsSupport.ImageResource(name: "td_snow_tile_hill", bundle: resourceBundle)

    /// The "td_snow_tile_river_bridge" asset catalog image resource.
    static let tdSnowTileRiverBridge = DeveloperToolsSupport.ImageResource(name: "td_snow_tile_river_bridge", bundle: resourceBundle)

    /// The "td_snow_tile_river_corner" asset catalog image resource.
    static let tdSnowTileRiverCorner = DeveloperToolsSupport.ImageResource(name: "td_snow_tile_river_corner", bundle: resourceBundle)

    /// The "td_snow_tile_river_slope" asset catalog image resource.
    static let tdSnowTileRiverSlope = DeveloperToolsSupport.ImageResource(name: "td_snow_tile_river_slope", bundle: resourceBundle)

    /// The "td_snow_tile_river_slope_large" asset catalog image resource.
    static let tdSnowTileRiverSlopeLarge = DeveloperToolsSupport.ImageResource(name: "td_snow_tile_river_slope_large", bundle: resourceBundle)

    /// The "td_snow_tile_river_straight" asset catalog image resource.
    static let tdSnowTileRiverStraight = DeveloperToolsSupport.ImageResource(name: "td_snow_tile_river_straight", bundle: resourceBundle)

    /// The "td_snow_tile_river_transition" asset catalog image resource.
    static let tdSnowTileRiverTransition = DeveloperToolsSupport.ImageResource(name: "td_snow_tile_river_transition", bundle: resourceBundle)

    /// The "td_snow_tile_river_waterfall" asset catalog image resource.
    static let tdSnowTileRiverWaterfall = DeveloperToolsSupport.ImageResource(name: "td_snow_tile_river_waterfall", bundle: resourceBundle)

    /// The "td_snow_tile_rock" asset catalog image resource.
    static let tdSnowTileRock = DeveloperToolsSupport.ImageResource(name: "td_snow_tile_rock", bundle: resourceBundle)

    /// The "td_snow_tile_slope" asset catalog image resource.
    static let tdSnowTileSlope = DeveloperToolsSupport.ImageResource(name: "td_snow_tile_slope", bundle: resourceBundle)

    /// The "td_snow_tile_spawn" asset catalog image resource.
    static let tdSnowTileSpawn = DeveloperToolsSupport.ImageResource(name: "td_snow_tile_spawn", bundle: resourceBundle)

    /// The "td_snow_tile_spawn_end" asset catalog image resource.
    static let tdSnowTileSpawnEnd = DeveloperToolsSupport.ImageResource(name: "td_snow_tile_spawn_end", bundle: resourceBundle)

    /// The "td_snow_tile_spawn_end_round" asset catalog image resource.
    static let tdSnowTileSpawnEndRound = DeveloperToolsSupport.ImageResource(name: "td_snow_tile_spawn_end_round", bundle: resourceBundle)

    /// The "td_snow_tile_spawn_round" asset catalog image resource.
    static let tdSnowTileSpawnRound = DeveloperToolsSupport.ImageResource(name: "td_snow_tile_spawn_round", bundle: resourceBundle)

    /// The "td_snow_tile_split" asset catalog image resource.
    static let tdSnowTileSplit = DeveloperToolsSupport.ImageResource(name: "td_snow_tile_split", bundle: resourceBundle)

    /// The "td_snow_tile_straight" asset catalog image resource.
    static let tdSnowTileStraight = DeveloperToolsSupport.ImageResource(name: "td_snow_tile_straight", bundle: resourceBundle)

    /// The "td_snow_tile_straight_slope" asset catalog image resource.
    static let tdSnowTileStraightSlope = DeveloperToolsSupport.ImageResource(name: "td_snow_tile_straight_slope", bundle: resourceBundle)

    /// The "td_snow_tile_straight_slope_large" asset catalog image resource.
    static let tdSnowTileStraightSlopeLarge = DeveloperToolsSupport.ImageResource(name: "td_snow_tile_straight_slope_large", bundle: resourceBundle)

    /// The "td_snow_tile_transition" asset catalog image resource.
    static let tdSnowTileTransition = DeveloperToolsSupport.ImageResource(name: "td_snow_tile_transition", bundle: resourceBundle)

    /// The "td_snow_tile_tree" asset catalog image resource.
    static let tdSnowTileTree = DeveloperToolsSupport.ImageResource(name: "td_snow_tile_tree", bundle: resourceBundle)

    /// The "td_snow_tile_tree_double" asset catalog image resource.
    static let tdSnowTileTreeDouble = DeveloperToolsSupport.ImageResource(name: "td_snow_tile_tree_double", bundle: resourceBundle)

    /// The "td_snow_tile_tree_quad" asset catalog image resource.
    static let tdSnowTileTreeQuad = DeveloperToolsSupport.ImageResource(name: "td_snow_tile_tree_quad", bundle: resourceBundle)

    /// The "td_snow_tile_wide_corner" asset catalog image resource.
    static let tdSnowTileWideCorner = DeveloperToolsSupport.ImageResource(name: "td_snow_tile_wide_corner", bundle: resourceBundle)

    /// The "td_snow_tile_wide_split" asset catalog image resource.
    static let tdSnowTileWideSplit = DeveloperToolsSupport.ImageResource(name: "td_snow_tile_wide_split", bundle: resourceBundle)

    /// The "td_snow_tile_wide_straight" asset catalog image resource.
    static let tdSnowTileWideStraight = DeveloperToolsSupport.ImageResource(name: "td_snow_tile_wide_straight", bundle: resourceBundle)

    /// The "td_snow_tile_wide_transition" asset catalog image resource.
    static let tdSnowTileWideTransition = DeveloperToolsSupport.ImageResource(name: "td_snow_tile_wide_transition", bundle: resourceBundle)

    /// The "td_snow_wood_structure" asset catalog image resource.
    static let tdSnowWoodStructure = DeveloperToolsSupport.ImageResource(name: "td_snow_wood_structure", bundle: resourceBundle)

    /// The "td_snow_wood_structure_high" asset catalog image resource.
    static let tdSnowWoodStructureHigh = DeveloperToolsSupport.ImageResource(name: "td_snow_wood_structure_high", bundle: resourceBundle)

    /// The "td_snow_wood_structure_high_part" asset catalog image resource.
    static let tdSnowWoodStructureHighPart = DeveloperToolsSupport.ImageResource(name: "td_snow_wood_structure_high_part", bundle: resourceBundle)

    /// The "td_snow_wood_structure_part" asset catalog image resource.
    static let tdSnowWoodStructurePart = DeveloperToolsSupport.ImageResource(name: "td_snow_wood_structure_part", bundle: resourceBundle)

    /// The "td_spawn_round" asset catalog image resource.
    static let tdSpawnRound = DeveloperToolsSupport.ImageResource(name: "td_spawn_round", bundle: resourceBundle)

    /// The "td_spawn_square" asset catalog image resource.
    static let tdSpawnSquare = DeveloperToolsSupport.ImageResource(name: "td_spawn_square", bundle: resourceBundle)

    /// The "td_tile" asset catalog image resource.
    static let tdTile = DeveloperToolsSupport.ImageResource(name: "td_tile", bundle: resourceBundle)

    /// The "td_tile_bump" asset catalog image resource.
    static let tdTileBump = DeveloperToolsSupport.ImageResource(name: "td_tile_bump", bundle: resourceBundle)

    /// The "td_tile_corner_inner" asset catalog image resource.
    static let tdTileCornerInner = DeveloperToolsSupport.ImageResource(name: "td_tile_corner_inner", bundle: resourceBundle)

    /// The "td_tile_corner_large" asset catalog image resource.
    static let tdTileCornerLarge = DeveloperToolsSupport.ImageResource(name: "td_tile_corner_large", bundle: resourceBundle)

    /// The "td_tile_corner_outer" asset catalog image resource.
    static let tdTileCornerOuter = DeveloperToolsSupport.ImageResource(name: "td_tile_corner_outer", bundle: resourceBundle)

    /// The "td_tile_corner_round" asset catalog image resource.
    static let tdTileCornerRound = DeveloperToolsSupport.ImageResource(name: "td_tile_corner_round", bundle: resourceBundle)

    /// The "td_tile_corner_square" asset catalog image resource.
    static let tdTileCornerSquare = DeveloperToolsSupport.ImageResource(name: "td_tile_corner_square", bundle: resourceBundle)

    /// The "td_tile_crossing" asset catalog image resource.
    static let tdTileCrossing = DeveloperToolsSupport.ImageResource(name: "td_tile_crossing", bundle: resourceBundle)

    /// The "td_tile_crystal" asset catalog image resource.
    static let tdTileCrystal = DeveloperToolsSupport.ImageResource(name: "td_tile_crystal", bundle: resourceBundle)

    /// The "td_tile_dirt" asset catalog image resource.
    static let tdTileDirt = DeveloperToolsSupport.ImageResource(name: "td_tile_dirt", bundle: resourceBundle)

    /// The "td_tile_end" asset catalog image resource.
    static let tdTileEnd = DeveloperToolsSupport.ImageResource(name: "td_tile_end", bundle: resourceBundle)

    /// The "td_tile_end_round" asset catalog image resource.
    static let tdTileEndRound = DeveloperToolsSupport.ImageResource(name: "td_tile_end_round", bundle: resourceBundle)

    /// The "td_tile_hill" asset catalog image resource.
    static let tdTileHill = DeveloperToolsSupport.ImageResource(name: "td_tile_hill", bundle: resourceBundle)

    /// The "td_tile_river_bridge" asset catalog image resource.
    static let tdTileRiverBridge = DeveloperToolsSupport.ImageResource(name: "td_tile_river_bridge", bundle: resourceBundle)

    /// The "td_tile_river_corner" asset catalog image resource.
    static let tdTileRiverCorner = DeveloperToolsSupport.ImageResource(name: "td_tile_river_corner", bundle: resourceBundle)

    /// The "td_tile_river_slope" asset catalog image resource.
    static let tdTileRiverSlope = DeveloperToolsSupport.ImageResource(name: "td_tile_river_slope", bundle: resourceBundle)

    /// The "td_tile_river_slope_large" asset catalog image resource.
    static let tdTileRiverSlopeLarge = DeveloperToolsSupport.ImageResource(name: "td_tile_river_slope_large", bundle: resourceBundle)

    /// The "td_tile_river_straight" asset catalog image resource.
    static let tdTileRiverStraight = DeveloperToolsSupport.ImageResource(name: "td_tile_river_straight", bundle: resourceBundle)

    /// The "td_tile_river_transition" asset catalog image resource.
    static let tdTileRiverTransition = DeveloperToolsSupport.ImageResource(name: "td_tile_river_transition", bundle: resourceBundle)

    /// The "td_tile_river_waterfall" asset catalog image resource.
    static let tdTileRiverWaterfall = DeveloperToolsSupport.ImageResource(name: "td_tile_river_waterfall", bundle: resourceBundle)

    /// The "td_tile_rock" asset catalog image resource.
    static let tdTileRock = DeveloperToolsSupport.ImageResource(name: "td_tile_rock", bundle: resourceBundle)

    /// The "td_tile_slope" asset catalog image resource.
    static let tdTileSlope = DeveloperToolsSupport.ImageResource(name: "td_tile_slope", bundle: resourceBundle)

    /// The "td_tile_spawn" asset catalog image resource.
    static let tdTileSpawn = DeveloperToolsSupport.ImageResource(name: "td_tile_spawn", bundle: resourceBundle)

    /// The "td_tile_spawn_end" asset catalog image resource.
    static let tdTileSpawnEnd = DeveloperToolsSupport.ImageResource(name: "td_tile_spawn_end", bundle: resourceBundle)

    /// The "td_tile_spawn_end_round" asset catalog image resource.
    static let tdTileSpawnEndRound = DeveloperToolsSupport.ImageResource(name: "td_tile_spawn_end_round", bundle: resourceBundle)

    /// The "td_tile_spawn_round" asset catalog image resource.
    static let tdTileSpawnRound = DeveloperToolsSupport.ImageResource(name: "td_tile_spawn_round", bundle: resourceBundle)

    /// The "td_tile_split" asset catalog image resource.
    static let tdTileSplit = DeveloperToolsSupport.ImageResource(name: "td_tile_split", bundle: resourceBundle)

    /// The "td_tile_straight" asset catalog image resource.
    static let tdTileStraight = DeveloperToolsSupport.ImageResource(name: "td_tile_straight", bundle: resourceBundle)

    /// The "td_tile_straight_slope" asset catalog image resource.
    static let tdTileStraightSlope = DeveloperToolsSupport.ImageResource(name: "td_tile_straight_slope", bundle: resourceBundle)

    /// The "td_tile_straight_slope_large" asset catalog image resource.
    static let tdTileStraightSlopeLarge = DeveloperToolsSupport.ImageResource(name: "td_tile_straight_slope_large", bundle: resourceBundle)

    /// The "td_tile_transition" asset catalog image resource.
    static let tdTileTransition = DeveloperToolsSupport.ImageResource(name: "td_tile_transition", bundle: resourceBundle)

    /// The "td_tile_tree" asset catalog image resource.
    static let tdTileTree = DeveloperToolsSupport.ImageResource(name: "td_tile_tree", bundle: resourceBundle)

    /// The "td_tile_tree_double" asset catalog image resource.
    static let tdTileTreeDouble = DeveloperToolsSupport.ImageResource(name: "td_tile_tree_double", bundle: resourceBundle)

    /// The "td_tile_tree_quad" asset catalog image resource.
    static let tdTileTreeQuad = DeveloperToolsSupport.ImageResource(name: "td_tile_tree_quad", bundle: resourceBundle)

    /// The "td_tile_wide_corner" asset catalog image resource.
    static let tdTileWideCorner = DeveloperToolsSupport.ImageResource(name: "td_tile_wide_corner", bundle: resourceBundle)

    /// The "td_tile_wide_split" asset catalog image resource.
    static let tdTileWideSplit = DeveloperToolsSupport.ImageResource(name: "td_tile_wide_split", bundle: resourceBundle)

    /// The "td_tile_wide_straight" asset catalog image resource.
    static let tdTileWideStraight = DeveloperToolsSupport.ImageResource(name: "td_tile_wide_straight", bundle: resourceBundle)

    /// The "td_tile_wide_transition" asset catalog image resource.
    static let tdTileWideTransition = DeveloperToolsSupport.ImageResource(name: "td_tile_wide_transition", bundle: resourceBundle)

    /// The "td_tower_round_base" asset catalog image resource.
    static let tdTowerRoundBase = DeveloperToolsSupport.ImageResource(name: "td_tower_round_base", bundle: resourceBundle)

    /// The "td_tower_round_bottom_a" asset catalog image resource.
    static let tdTowerRoundBottomA = DeveloperToolsSupport.ImageResource(name: "td_tower_round_bottom_a", bundle: resourceBundle)

    /// The "td_tower_round_bottom_b" asset catalog image resource.
    static let tdTowerRoundBottomB = DeveloperToolsSupport.ImageResource(name: "td_tower_round_bottom_b", bundle: resourceBundle)

    /// The "td_tower_round_bottom_c" asset catalog image resource.
    static let tdTowerRoundBottomC = DeveloperToolsSupport.ImageResource(name: "td_tower_round_bottom_c", bundle: resourceBundle)

    /// The "td_tower_round_build_a" asset catalog image resource.
    static let tdTowerRoundBuildA = DeveloperToolsSupport.ImageResource(name: "td_tower_round_build_a", bundle: resourceBundle)

    /// The "td_tower_round_build_b" asset catalog image resource.
    static let tdTowerRoundBuildB = DeveloperToolsSupport.ImageResource(name: "td_tower_round_build_b", bundle: resourceBundle)

    /// The "td_tower_round_build_c" asset catalog image resource.
    static let tdTowerRoundBuildC = DeveloperToolsSupport.ImageResource(name: "td_tower_round_build_c", bundle: resourceBundle)

    /// The "td_tower_round_build_d" asset catalog image resource.
    static let tdTowerRoundBuildD = DeveloperToolsSupport.ImageResource(name: "td_tower_round_build_d", bundle: resourceBundle)

    /// The "td_tower_round_build_e" asset catalog image resource.
    static let tdTowerRoundBuildE = DeveloperToolsSupport.ImageResource(name: "td_tower_round_build_e", bundle: resourceBundle)

    /// The "td_tower_round_build_f" asset catalog image resource.
    static let tdTowerRoundBuildF = DeveloperToolsSupport.ImageResource(name: "td_tower_round_build_f", bundle: resourceBundle)

    /// The "td_tower_round_crystals" asset catalog image resource.
    static let tdTowerRoundCrystals = DeveloperToolsSupport.ImageResource(name: "td_tower_round_crystals", bundle: resourceBundle)

    /// The "td_tower_round_middle_a" asset catalog image resource.
    static let tdTowerRoundMiddleA = DeveloperToolsSupport.ImageResource(name: "td_tower_round_middle_a", bundle: resourceBundle)

    /// The "td_tower_round_middle_b" asset catalog image resource.
    static let tdTowerRoundMiddleB = DeveloperToolsSupport.ImageResource(name: "td_tower_round_middle_b", bundle: resourceBundle)

    /// The "td_tower_round_middle_c" asset catalog image resource.
    static let tdTowerRoundMiddleC = DeveloperToolsSupport.ImageResource(name: "td_tower_round_middle_c", bundle: resourceBundle)

    /// The "td_tower_round_roof_a" asset catalog image resource.
    static let tdTowerRoundRoofA = DeveloperToolsSupport.ImageResource(name: "td_tower_round_roof_a", bundle: resourceBundle)

    /// The "td_tower_round_roof_b" asset catalog image resource.
    static let tdTowerRoundRoofB = DeveloperToolsSupport.ImageResource(name: "td_tower_round_roof_b", bundle: resourceBundle)

    /// The "td_tower_round_roof_c" asset catalog image resource.
    static let tdTowerRoundRoofC = DeveloperToolsSupport.ImageResource(name: "td_tower_round_roof_c", bundle: resourceBundle)

    /// The "td_tower_round_top_a" asset catalog image resource.
    static let tdTowerRoundTopA = DeveloperToolsSupport.ImageResource(name: "td_tower_round_top_a", bundle: resourceBundle)

    /// The "td_tower_round_top_b" asset catalog image resource.
    static let tdTowerRoundTopB = DeveloperToolsSupport.ImageResource(name: "td_tower_round_top_b", bundle: resourceBundle)

    /// The "td_tower_round_top_c" asset catalog image resource.
    static let tdTowerRoundTopC = DeveloperToolsSupport.ImageResource(name: "td_tower_round_top_c", bundle: resourceBundle)

    /// The "td_tower_square_bottom_a" asset catalog image resource.
    static let tdTowerSquareBottomA = DeveloperToolsSupport.ImageResource(name: "td_tower_square_bottom_a", bundle: resourceBundle)

    /// The "td_tower_square_bottom_b" asset catalog image resource.
    static let tdTowerSquareBottomB = DeveloperToolsSupport.ImageResource(name: "td_tower_square_bottom_b", bundle: resourceBundle)

    /// The "td_tower_square_bottom_c" asset catalog image resource.
    static let tdTowerSquareBottomC = DeveloperToolsSupport.ImageResource(name: "td_tower_square_bottom_c", bundle: resourceBundle)

    /// The "td_tower_square_build_a" asset catalog image resource.
    static let tdTowerSquareBuildA = DeveloperToolsSupport.ImageResource(name: "td_tower_square_build_a", bundle: resourceBundle)

    /// The "td_tower_square_build_b" asset catalog image resource.
    static let tdTowerSquareBuildB = DeveloperToolsSupport.ImageResource(name: "td_tower_square_build_b", bundle: resourceBundle)

    /// The "td_tower_square_build_c" asset catalog image resource.
    static let tdTowerSquareBuildC = DeveloperToolsSupport.ImageResource(name: "td_tower_square_build_c", bundle: resourceBundle)

    /// The "td_tower_square_build_d" asset catalog image resource.
    static let tdTowerSquareBuildD = DeveloperToolsSupport.ImageResource(name: "td_tower_square_build_d", bundle: resourceBundle)

    /// The "td_tower_square_build_e" asset catalog image resource.
    static let tdTowerSquareBuildE = DeveloperToolsSupport.ImageResource(name: "td_tower_square_build_e", bundle: resourceBundle)

    /// The "td_tower_square_build_f" asset catalog image resource.
    static let tdTowerSquareBuildF = DeveloperToolsSupport.ImageResource(name: "td_tower_square_build_f", bundle: resourceBundle)

    /// The "td_tower_square_middle_a" asset catalog image resource.
    static let tdTowerSquareMiddleA = DeveloperToolsSupport.ImageResource(name: "td_tower_square_middle_a", bundle: resourceBundle)

    /// The "td_tower_square_middle_b" asset catalog image resource.
    static let tdTowerSquareMiddleB = DeveloperToolsSupport.ImageResource(name: "td_tower_square_middle_b", bundle: resourceBundle)

    /// The "td_tower_square_middle_c" asset catalog image resource.
    static let tdTowerSquareMiddleC = DeveloperToolsSupport.ImageResource(name: "td_tower_square_middle_c", bundle: resourceBundle)

    /// The "td_tower_square_roof_a" asset catalog image resource.
    static let tdTowerSquareRoofA = DeveloperToolsSupport.ImageResource(name: "td_tower_square_roof_a", bundle: resourceBundle)

    /// The "td_tower_square_roof_b" asset catalog image resource.
    static let tdTowerSquareRoofB = DeveloperToolsSupport.ImageResource(name: "td_tower_square_roof_b", bundle: resourceBundle)

    /// The "td_tower_square_roof_c" asset catalog image resource.
    static let tdTowerSquareRoofC = DeveloperToolsSupport.ImageResource(name: "td_tower_square_roof_c", bundle: resourceBundle)

    /// The "td_tower_square_top_a" asset catalog image resource.
    static let tdTowerSquareTopA = DeveloperToolsSupport.ImageResource(name: "td_tower_square_top_a", bundle: resourceBundle)

    /// The "td_tower_square_top_b" asset catalog image resource.
    static let tdTowerSquareTopB = DeveloperToolsSupport.ImageResource(name: "td_tower_square_top_b", bundle: resourceBundle)

    /// The "td_tower_square_top_c" asset catalog image resource.
    static let tdTowerSquareTopC = DeveloperToolsSupport.ImageResource(name: "td_tower_square_top_c", bundle: resourceBundle)

    /// The "td_weapon_ammo_arrow" asset catalog image resource.
    static let tdWeaponAmmoArrow = DeveloperToolsSupport.ImageResource(name: "td_weapon_ammo_arrow", bundle: resourceBundle)

    /// The "td_weapon_ammo_boulder" asset catalog image resource.
    static let tdWeaponAmmoBoulder = DeveloperToolsSupport.ImageResource(name: "td_weapon_ammo_boulder", bundle: resourceBundle)

    /// The "td_weapon_ammo_bullet" asset catalog image resource.
    static let tdWeaponAmmoBullet = DeveloperToolsSupport.ImageResource(name: "td_weapon_ammo_bullet", bundle: resourceBundle)

    /// The "td_weapon_ammo_cannonball" asset catalog image resource.
    static let tdWeaponAmmoCannonball = DeveloperToolsSupport.ImageResource(name: "td_weapon_ammo_cannonball", bundle: resourceBundle)

    /// The "td_weapon_ballista" asset catalog image resource.
    static let tdWeaponBallista = DeveloperToolsSupport.ImageResource(name: "td_weapon_ballista", bundle: resourceBundle)

    /// The "td_weapon_cannon" asset catalog image resource.
    static let tdWeaponCannon = DeveloperToolsSupport.ImageResource(name: "td_weapon_cannon", bundle: resourceBundle)

    /// The "td_weapon_catapult" asset catalog image resource.
    static let tdWeaponCatapult = DeveloperToolsSupport.ImageResource(name: "td_weapon_catapult", bundle: resourceBundle)

    /// The "td_weapon_turret" asset catalog image resource.
    static let tdWeaponTurret = DeveloperToolsSupport.ImageResource(name: "td_weapon_turret", bundle: resourceBundle)

    /// The "td_wood_structure" asset catalog image resource.
    static let tdWoodStructure = DeveloperToolsSupport.ImageResource(name: "td_wood_structure", bundle: resourceBundle)

    /// The "td_wood_structure_high" asset catalog image resource.
    static let tdWoodStructureHigh = DeveloperToolsSupport.ImageResource(name: "td_wood_structure_high", bundle: resourceBundle)

    /// The "td_wood_structure_high_part" asset catalog image resource.
    static let tdWoodStructureHighPart = DeveloperToolsSupport.ImageResource(name: "td_wood_structure_high_part", bundle: resourceBundle)

    /// The "td_wood_structure_part" asset catalog image resource.
    static let tdWoodStructurePart = DeveloperToolsSupport.ImageResource(name: "td_wood_structure_part", bundle: resourceBundle)

    /// The "tdg_tile_0000" asset catalog image resource.
    static let tdgTile0000 = DeveloperToolsSupport.ImageResource(name: "tdg_tile_0000", bundle: resourceBundle)

    /// The "tdg_tile_0002" asset catalog image resource.
    static let tdgTile0002 = DeveloperToolsSupport.ImageResource(name: "tdg_tile_0002", bundle: resourceBundle)

    /// The "tdg_tile_0004" asset catalog image resource.
    static let tdgTile0004 = DeveloperToolsSupport.ImageResource(name: "tdg_tile_0004", bundle: resourceBundle)

    /// The "tdg_tile_0006" asset catalog image resource.
    static let tdgTile0006 = DeveloperToolsSupport.ImageResource(name: "tdg_tile_0006", bundle: resourceBundle)

    /// The "tdg_tile_0008" asset catalog image resource.
    static let tdgTile0008 = DeveloperToolsSupport.ImageResource(name: "tdg_tile_0008", bundle: resourceBundle)

    /// The "tdg_tile_0010" asset catalog image resource.
    static let tdgTile0010 = DeveloperToolsSupport.ImageResource(name: "tdg_tile_0010", bundle: resourceBundle)

    /// The "tdg_tile_0012" asset catalog image resource.
    static let tdgTile0012 = DeveloperToolsSupport.ImageResource(name: "tdg_tile_0012", bundle: resourceBundle)

    /// The "tdg_tile_0014" asset catalog image resource.
    static let tdgTile0014 = DeveloperToolsSupport.ImageResource(name: "tdg_tile_0014", bundle: resourceBundle)

    /// The "tdg_tile_0016" asset catalog image resource.
    static let tdgTile0016 = DeveloperToolsSupport.ImageResource(name: "tdg_tile_0016", bundle: resourceBundle)

    /// The "tdg_tile_0018" asset catalog image resource.
    static let tdgTile0018 = DeveloperToolsSupport.ImageResource(name: "tdg_tile_0018", bundle: resourceBundle)

    /// The "tdg_tile_0020" asset catalog image resource.
    static let tdgTile0020 = DeveloperToolsSupport.ImageResource(name: "tdg_tile_0020", bundle: resourceBundle)

    /// The "tdg_tile_0022" asset catalog image resource.
    static let tdgTile0022 = DeveloperToolsSupport.ImageResource(name: "tdg_tile_0022", bundle: resourceBundle)

    /// The "tdg_tile_0024" asset catalog image resource.
    static let tdgTile0024 = DeveloperToolsSupport.ImageResource(name: "tdg_tile_0024", bundle: resourceBundle)

    /// The "tdg_tile_0026" asset catalog image resource.
    static let tdgTile0026 = DeveloperToolsSupport.ImageResource(name: "tdg_tile_0026", bundle: resourceBundle)

    /// The "tdg_tile_0028" asset catalog image resource.
    static let tdgTile0028 = DeveloperToolsSupport.ImageResource(name: "tdg_tile_0028", bundle: resourceBundle)

    /// The "tdg_tile_0030" asset catalog image resource.
    static let tdgTile0030 = DeveloperToolsSupport.ImageResource(name: "tdg_tile_0030", bundle: resourceBundle)

    /// The "tdg_tile_0032" asset catalog image resource.
    static let tdgTile0032 = DeveloperToolsSupport.ImageResource(name: "tdg_tile_0032", bundle: resourceBundle)

    /// The "tdg_tile_0034" asset catalog image resource.
    static let tdgTile0034 = DeveloperToolsSupport.ImageResource(name: "tdg_tile_0034", bundle: resourceBundle)

    /// The "tdg_tile_0036" asset catalog image resource.
    static let tdgTile0036 = DeveloperToolsSupport.ImageResource(name: "tdg_tile_0036", bundle: resourceBundle)

    /// The "tdg_tile_0038" asset catalog image resource.
    static let tdgTile0038 = DeveloperToolsSupport.ImageResource(name: "tdg_tile_0038", bundle: resourceBundle)

    /// The "tdg_tile_0040" asset catalog image resource.
    static let tdgTile0040 = DeveloperToolsSupport.ImageResource(name: "tdg_tile_0040", bundle: resourceBundle)

    /// The "tdg_tile_0042" asset catalog image resource.
    static let tdgTile0042 = DeveloperToolsSupport.ImageResource(name: "tdg_tile_0042", bundle: resourceBundle)

    /// The "tdg_tile_0044" asset catalog image resource.
    static let tdgTile0044 = DeveloperToolsSupport.ImageResource(name: "tdg_tile_0044", bundle: resourceBundle)

    /// The "tdg_tile_0046" asset catalog image resource.
    static let tdgTile0046 = DeveloperToolsSupport.ImageResource(name: "tdg_tile_0046", bundle: resourceBundle)

    /// The "tdg_tile_0048" asset catalog image resource.
    static let tdgTile0048 = DeveloperToolsSupport.ImageResource(name: "tdg_tile_0048", bundle: resourceBundle)

    /// The "tdg_tile_0050" asset catalog image resource.
    static let tdgTile0050 = DeveloperToolsSupport.ImageResource(name: "tdg_tile_0050", bundle: resourceBundle)

    /// The "tdg_tile_0052" asset catalog image resource.
    static let tdgTile0052 = DeveloperToolsSupport.ImageResource(name: "tdg_tile_0052", bundle: resourceBundle)

    /// The "tdg_tile_0054" asset catalog image resource.
    static let tdgTile0054 = DeveloperToolsSupport.ImageResource(name: "tdg_tile_0054", bundle: resourceBundle)

    /// The "tdg_tile_0056" asset catalog image resource.
    static let tdgTile0056 = DeveloperToolsSupport.ImageResource(name: "tdg_tile_0056", bundle: resourceBundle)

    /// The "tdg_tile_0058" asset catalog image resource.
    static let tdgTile0058 = DeveloperToolsSupport.ImageResource(name: "tdg_tile_0058", bundle: resourceBundle)

    /// The "tdg_tile_0060" asset catalog image resource.
    static let tdgTile0060 = DeveloperToolsSupport.ImageResource(name: "tdg_tile_0060", bundle: resourceBundle)

    /// The "tdg_tile_0062" asset catalog image resource.
    static let tdgTile0062 = DeveloperToolsSupport.ImageResource(name: "tdg_tile_0062", bundle: resourceBundle)

    /// The "tdg_tile_0064" asset catalog image resource.
    static let tdgTile0064 = DeveloperToolsSupport.ImageResource(name: "tdg_tile_0064", bundle: resourceBundle)

    /// The "tdg_tile_0066" asset catalog image resource.
    static let tdgTile0066 = DeveloperToolsSupport.ImageResource(name: "tdg_tile_0066", bundle: resourceBundle)

    /// The "tdg_tile_0068" asset catalog image resource.
    static let tdgTile0068 = DeveloperToolsSupport.ImageResource(name: "tdg_tile_0068", bundle: resourceBundle)

    /// The "tdg_tile_0070" asset catalog image resource.
    static let tdgTile0070 = DeveloperToolsSupport.ImageResource(name: "tdg_tile_0070", bundle: resourceBundle)

    /// The "tdg_tile_0072" asset catalog image resource.
    static let tdgTile0072 = DeveloperToolsSupport.ImageResource(name: "tdg_tile_0072", bundle: resourceBundle)

    /// The "tdg_tile_0074" asset catalog image resource.
    static let tdgTile0074 = DeveloperToolsSupport.ImageResource(name: "tdg_tile_0074", bundle: resourceBundle)

    /// The "tdg_tile_0076" asset catalog image resource.
    static let tdgTile0076 = DeveloperToolsSupport.ImageResource(name: "tdg_tile_0076", bundle: resourceBundle)

    /// The "tdg_tile_0078" asset catalog image resource.
    static let tdgTile0078 = DeveloperToolsSupport.ImageResource(name: "tdg_tile_0078", bundle: resourceBundle)

    /// The "tdg_tile_0080" asset catalog image resource.
    static let tdgTile0080 = DeveloperToolsSupport.ImageResource(name: "tdg_tile_0080", bundle: resourceBundle)

    /// The "tdg_tile_0082" asset catalog image resource.
    static let tdgTile0082 = DeveloperToolsSupport.ImageResource(name: "tdg_tile_0082", bundle: resourceBundle)

    /// The "tdg_tile_0084" asset catalog image resource.
    static let tdgTile0084 = DeveloperToolsSupport.ImageResource(name: "tdg_tile_0084", bundle: resourceBundle)

    /// The "tdg_tile_0086" asset catalog image resource.
    static let tdgTile0086 = DeveloperToolsSupport.ImageResource(name: "tdg_tile_0086", bundle: resourceBundle)

    /// The "tdg_tile_0088" asset catalog image resource.
    static let tdgTile0088 = DeveloperToolsSupport.ImageResource(name: "tdg_tile_0088", bundle: resourceBundle)

    /// The "tdg_tile_0090" asset catalog image resource.
    static let tdgTile0090 = DeveloperToolsSupport.ImageResource(name: "tdg_tile_0090", bundle: resourceBundle)

    /// The "tdg_tile_0092" asset catalog image resource.
    static let tdgTile0092 = DeveloperToolsSupport.ImageResource(name: "tdg_tile_0092", bundle: resourceBundle)

    /// The "tdg_tile_0094" asset catalog image resource.
    static let tdgTile0094 = DeveloperToolsSupport.ImageResource(name: "tdg_tile_0094", bundle: resourceBundle)

    /// The "tdg_tile_0096" asset catalog image resource.
    static let tdgTile0096 = DeveloperToolsSupport.ImageResource(name: "tdg_tile_0096", bundle: resourceBundle)

    /// The "tdg_tile_0098" asset catalog image resource.
    static let tdgTile0098 = DeveloperToolsSupport.ImageResource(name: "tdg_tile_0098", bundle: resourceBundle)

    /// The "torch" asset catalog image resource.
    static let torch = DeveloperToolsSupport.ImageResource(name: "torch", bundle: resourceBundle)

    /// The "tower" asset catalog image resource.
    static let tower = DeveloperToolsSupport.ImageResource(name: "tower", bundle: resourceBundle)

    /// The "treasure_chest" asset catalog image resource.
    static let treasureChest = DeveloperToolsSupport.ImageResource(name: "treasure_chest", bundle: resourceBundle)

    /// The "treasure_map" asset catalog image resource.
    static let treasureMap = DeveloperToolsSupport.ImageResource(name: "treasure_map", bundle: resourceBundle)

    /// The "tree" asset catalog image resource.
    static let tree = DeveloperToolsSupport.ImageResource(name: "tree", bundle: resourceBundle)

    /// The "tt_tile_0000" asset catalog image resource.
    static let ttTile0000 = DeveloperToolsSupport.ImageResource(name: "tt_tile_0000", bundle: resourceBundle)

    /// The "tt_tile_0002" asset catalog image resource.
    static let ttTile0002 = DeveloperToolsSupport.ImageResource(name: "tt_tile_0002", bundle: resourceBundle)

    /// The "tt_tile_0004" asset catalog image resource.
    static let ttTile0004 = DeveloperToolsSupport.ImageResource(name: "tt_tile_0004", bundle: resourceBundle)

    /// The "tt_tile_0006" asset catalog image resource.
    static let ttTile0006 = DeveloperToolsSupport.ImageResource(name: "tt_tile_0006", bundle: resourceBundle)

    /// The "tt_tile_0008" asset catalog image resource.
    static let ttTile0008 = DeveloperToolsSupport.ImageResource(name: "tt_tile_0008", bundle: resourceBundle)

    /// The "tt_tile_0010" asset catalog image resource.
    static let ttTile0010 = DeveloperToolsSupport.ImageResource(name: "tt_tile_0010", bundle: resourceBundle)

    /// The "tt_tile_0012" asset catalog image resource.
    static let ttTile0012 = DeveloperToolsSupport.ImageResource(name: "tt_tile_0012", bundle: resourceBundle)

    /// The "tt_tile_0014" asset catalog image resource.
    static let ttTile0014 = DeveloperToolsSupport.ImageResource(name: "tt_tile_0014", bundle: resourceBundle)

    /// The "tt_tile_0016" asset catalog image resource.
    static let ttTile0016 = DeveloperToolsSupport.ImageResource(name: "tt_tile_0016", bundle: resourceBundle)

    /// The "tt_tile_0018" asset catalog image resource.
    static let ttTile0018 = DeveloperToolsSupport.ImageResource(name: "tt_tile_0018", bundle: resourceBundle)

    /// The "tt_tile_0020" asset catalog image resource.
    static let ttTile0020 = DeveloperToolsSupport.ImageResource(name: "tt_tile_0020", bundle: resourceBundle)

    /// The "tt_tile_0022" asset catalog image resource.
    static let ttTile0022 = DeveloperToolsSupport.ImageResource(name: "tt_tile_0022", bundle: resourceBundle)

    /// The "tt_tile_0024" asset catalog image resource.
    static let ttTile0024 = DeveloperToolsSupport.ImageResource(name: "tt_tile_0024", bundle: resourceBundle)

    /// The "tt_tile_0026" asset catalog image resource.
    static let ttTile0026 = DeveloperToolsSupport.ImageResource(name: "tt_tile_0026", bundle: resourceBundle)

    /// The "tt_tile_0028" asset catalog image resource.
    static let ttTile0028 = DeveloperToolsSupport.ImageResource(name: "tt_tile_0028", bundle: resourceBundle)

    /// The "tt_tile_0030" asset catalog image resource.
    static let ttTile0030 = DeveloperToolsSupport.ImageResource(name: "tt_tile_0030", bundle: resourceBundle)

    /// The "tt_tile_0032" asset catalog image resource.
    static let ttTile0032 = DeveloperToolsSupport.ImageResource(name: "tt_tile_0032", bundle: resourceBundle)

    /// The "tt_tile_0034" asset catalog image resource.
    static let ttTile0034 = DeveloperToolsSupport.ImageResource(name: "tt_tile_0034", bundle: resourceBundle)

    /// The "tt_tile_0036" asset catalog image resource.
    static let ttTile0036 = DeveloperToolsSupport.ImageResource(name: "tt_tile_0036", bundle: resourceBundle)

    /// The "tt_tile_0038" asset catalog image resource.
    static let ttTile0038 = DeveloperToolsSupport.ImageResource(name: "tt_tile_0038", bundle: resourceBundle)

    /// The "tt_tile_0040" asset catalog image resource.
    static let ttTile0040 = DeveloperToolsSupport.ImageResource(name: "tt_tile_0040", bundle: resourceBundle)

    /// The "tt_tile_0042" asset catalog image resource.
    static let ttTile0042 = DeveloperToolsSupport.ImageResource(name: "tt_tile_0042", bundle: resourceBundle)

    /// The "tt_tile_0044" asset catalog image resource.
    static let ttTile0044 = DeveloperToolsSupport.ImageResource(name: "tt_tile_0044", bundle: resourceBundle)

    /// The "tt_tile_0046" asset catalog image resource.
    static let ttTile0046 = DeveloperToolsSupport.ImageResource(name: "tt_tile_0046", bundle: resourceBundle)

    /// The "tt_tile_0048" asset catalog image resource.
    static let ttTile0048 = DeveloperToolsSupport.ImageResource(name: "tt_tile_0048", bundle: resourceBundle)

    /// The "tt_tile_0050" asset catalog image resource.
    static let ttTile0050 = DeveloperToolsSupport.ImageResource(name: "tt_tile_0050", bundle: resourceBundle)

    /// The "tt_tile_0052" asset catalog image resource.
    static let ttTile0052 = DeveloperToolsSupport.ImageResource(name: "tt_tile_0052", bundle: resourceBundle)

    /// The "tt_tile_0054" asset catalog image resource.
    static let ttTile0054 = DeveloperToolsSupport.ImageResource(name: "tt_tile_0054", bundle: resourceBundle)

    /// The "tt_tile_0056" asset catalog image resource.
    static let ttTile0056 = DeveloperToolsSupport.ImageResource(name: "tt_tile_0056", bundle: resourceBundle)

    /// The "tt_tile_0058" asset catalog image resource.
    static let ttTile0058 = DeveloperToolsSupport.ImageResource(name: "tt_tile_0058", bundle: resourceBundle)

    /// The "tt_tile_0060" asset catalog image resource.
    static let ttTile0060 = DeveloperToolsSupport.ImageResource(name: "tt_tile_0060", bundle: resourceBundle)

    /// The "tt_tile_0062" asset catalog image resource.
    static let ttTile0062 = DeveloperToolsSupport.ImageResource(name: "tt_tile_0062", bundle: resourceBundle)

    /// The "tt_tile_0064" asset catalog image resource.
    static let ttTile0064 = DeveloperToolsSupport.ImageResource(name: "tt_tile_0064", bundle: resourceBundle)

    /// The "tt_tile_0066" asset catalog image resource.
    static let ttTile0066 = DeveloperToolsSupport.ImageResource(name: "tt_tile_0066", bundle: resourceBundle)

    /// The "tt_tile_0068" asset catalog image resource.
    static let ttTile0068 = DeveloperToolsSupport.ImageResource(name: "tt_tile_0068", bundle: resourceBundle)

    /// The "tt_tile_0070" asset catalog image resource.
    static let ttTile0070 = DeveloperToolsSupport.ImageResource(name: "tt_tile_0070", bundle: resourceBundle)

    /// The "tt_tile_0072" asset catalog image resource.
    static let ttTile0072 = DeveloperToolsSupport.ImageResource(name: "tt_tile_0072", bundle: resourceBundle)

    /// The "tt_tile_0074" asset catalog image resource.
    static let ttTile0074 = DeveloperToolsSupport.ImageResource(name: "tt_tile_0074", bundle: resourceBundle)

    /// The "tt_tile_0076" asset catalog image resource.
    static let ttTile0076 = DeveloperToolsSupport.ImageResource(name: "tt_tile_0076", bundle: resourceBundle)

    /// The "tt_tile_0078" asset catalog image resource.
    static let ttTile0078 = DeveloperToolsSupport.ImageResource(name: "tt_tile_0078", bundle: resourceBundle)

    /// The "tt_tile_0080" asset catalog image resource.
    static let ttTile0080 = DeveloperToolsSupport.ImageResource(name: "tt_tile_0080", bundle: resourceBundle)

    /// The "tt_tile_0082" asset catalog image resource.
    static let ttTile0082 = DeveloperToolsSupport.ImageResource(name: "tt_tile_0082", bundle: resourceBundle)

    /// The "tt_tile_0084" asset catalog image resource.
    static let ttTile0084 = DeveloperToolsSupport.ImageResource(name: "tt_tile_0084", bundle: resourceBundle)

    /// The "tt_tile_0086" asset catalog image resource.
    static let ttTile0086 = DeveloperToolsSupport.ImageResource(name: "tt_tile_0086", bundle: resourceBundle)

    /// The "tt_tile_0088" asset catalog image resource.
    static let ttTile0088 = DeveloperToolsSupport.ImageResource(name: "tt_tile_0088", bundle: resourceBundle)

    /// The "tt_tile_0090" asset catalog image resource.
    static let ttTile0090 = DeveloperToolsSupport.ImageResource(name: "tt_tile_0090", bundle: resourceBundle)

    /// The "tt_tile_0092" asset catalog image resource.
    static let ttTile0092 = DeveloperToolsSupport.ImageResource(name: "tt_tile_0092", bundle: resourceBundle)

    /// The "tt_tile_0094" asset catalog image resource.
    static let ttTile0094 = DeveloperToolsSupport.ImageResource(name: "tt_tile_0094", bundle: resourceBundle)

    /// The "tt_tile_0096" asset catalog image resource.
    static let ttTile0096 = DeveloperToolsSupport.ImageResource(name: "tt_tile_0096", bundle: resourceBundle)

    /// The "tt_tile_0098" asset catalog image resource.
    static let ttTile0098 = DeveloperToolsSupport.ImageResource(name: "tt_tile_0098", bundle: resourceBundle)

    /// The "ui_b_arrow_basic_e" asset catalog image resource.
    static let uiBArrowBasicE = DeveloperToolsSupport.ImageResource(name: "ui_b_arrow_basic_e", bundle: resourceBundle)

    /// The "ui_b_arrow_basic_e_small" asset catalog image resource.
    static let uiBArrowBasicESmall = DeveloperToolsSupport.ImageResource(name: "ui_b_arrow_basic_e_small", bundle: resourceBundle)

    /// The "ui_b_arrow_basic_n" asset catalog image resource.
    static let uiBArrowBasicN = DeveloperToolsSupport.ImageResource(name: "ui_b_arrow_basic_n", bundle: resourceBundle)

    /// The "ui_b_arrow_basic_n_small" asset catalog image resource.
    static let uiBArrowBasicNSmall = DeveloperToolsSupport.ImageResource(name: "ui_b_arrow_basic_n_small", bundle: resourceBundle)

    /// The "ui_b_arrow_basic_s" asset catalog image resource.
    static let uiBArrowBasicS = DeveloperToolsSupport.ImageResource(name: "ui_b_arrow_basic_s", bundle: resourceBundle)

    /// The "ui_b_arrow_basic_s_small" asset catalog image resource.
    static let uiBArrowBasicSSmall = DeveloperToolsSupport.ImageResource(name: "ui_b_arrow_basic_s_small", bundle: resourceBundle)

    /// The "ui_b_arrow_basic_w" asset catalog image resource.
    static let uiBArrowBasicW = DeveloperToolsSupport.ImageResource(name: "ui_b_arrow_basic_w", bundle: resourceBundle)

    /// The "ui_b_arrow_basic_w_small" asset catalog image resource.
    static let uiBArrowBasicWSmall = DeveloperToolsSupport.ImageResource(name: "ui_b_arrow_basic_w_small", bundle: resourceBundle)

    /// The "ui_b_button_rectangle_border" asset catalog image resource.
    static let uiBButtonRectangleBorder = DeveloperToolsSupport.ImageResource(name: "ui_b_button_rectangle_border", bundle: resourceBundle)

    /// The "ui_b_button_rectangle_depth_border" asset catalog image resource.
    static let uiBButtonRectangleDepthBorder = DeveloperToolsSupport.ImageResource(name: "ui_b_button_rectangle_depth_border", bundle: resourceBundle)

    /// The "ui_b_button_rectangle_depth_flat" asset catalog image resource.
    static let uiBButtonRectangleDepthFlat = DeveloperToolsSupport.ImageResource(name: "ui_b_button_rectangle_depth_flat", bundle: resourceBundle)

    /// The "ui_b_button_rectangle_depth_gloss" asset catalog image resource.
    static let uiBButtonRectangleDepthGloss = DeveloperToolsSupport.ImageResource(name: "ui_b_button_rectangle_depth_gloss", bundle: resourceBundle)

    /// The "ui_b_button_rectangle_depth_gradient" asset catalog image resource.
    static let uiBButtonRectangleDepthGradient = DeveloperToolsSupport.ImageResource(name: "ui_b_button_rectangle_depth_gradient", bundle: resourceBundle)

    /// The "ui_b_button_rectangle_depth_line" asset catalog image resource.
    static let uiBButtonRectangleDepthLine = DeveloperToolsSupport.ImageResource(name: "ui_b_button_rectangle_depth_line", bundle: resourceBundle)

    /// The "ui_b_button_rectangle_flat" asset catalog image resource.
    static let uiBButtonRectangleFlat = DeveloperToolsSupport.ImageResource(name: "ui_b_button_rectangle_flat", bundle: resourceBundle)

    /// The "ui_b_button_rectangle_gloss" asset catalog image resource.
    static let uiBButtonRectangleGloss = DeveloperToolsSupport.ImageResource(name: "ui_b_button_rectangle_gloss", bundle: resourceBundle)

    /// The "ui_b_button_rectangle_gradient" asset catalog image resource.
    static let uiBButtonRectangleGradient = DeveloperToolsSupport.ImageResource(name: "ui_b_button_rectangle_gradient", bundle: resourceBundle)

    /// The "ui_b_button_rectangle_line" asset catalog image resource.
    static let uiBButtonRectangleLine = DeveloperToolsSupport.ImageResource(name: "ui_b_button_rectangle_line", bundle: resourceBundle)

    /// The "ui_b_button_round_border" asset catalog image resource.
    static let uiBButtonRoundBorder = DeveloperToolsSupport.ImageResource(name: "ui_b_button_round_border", bundle: resourceBundle)

    /// The "ui_b_button_round_depth_border" asset catalog image resource.
    static let uiBButtonRoundDepthBorder = DeveloperToolsSupport.ImageResource(name: "ui_b_button_round_depth_border", bundle: resourceBundle)

    /// The "ui_b_button_round_depth_flat" asset catalog image resource.
    static let uiBButtonRoundDepthFlat = DeveloperToolsSupport.ImageResource(name: "ui_b_button_round_depth_flat", bundle: resourceBundle)

    /// The "ui_b_button_round_depth_gloss" asset catalog image resource.
    static let uiBButtonRoundDepthGloss = DeveloperToolsSupport.ImageResource(name: "ui_b_button_round_depth_gloss", bundle: resourceBundle)

    /// The "ui_b_button_round_depth_gradient" asset catalog image resource.
    static let uiBButtonRoundDepthGradient = DeveloperToolsSupport.ImageResource(name: "ui_b_button_round_depth_gradient", bundle: resourceBundle)

    /// The "ui_b_button_round_depth_line" asset catalog image resource.
    static let uiBButtonRoundDepthLine = DeveloperToolsSupport.ImageResource(name: "ui_b_button_round_depth_line", bundle: resourceBundle)

    /// The "ui_b_button_round_flat" asset catalog image resource.
    static let uiBButtonRoundFlat = DeveloperToolsSupport.ImageResource(name: "ui_b_button_round_flat", bundle: resourceBundle)

    /// The "ui_b_button_round_gloss" asset catalog image resource.
    static let uiBButtonRoundGloss = DeveloperToolsSupport.ImageResource(name: "ui_b_button_round_gloss", bundle: resourceBundle)

    /// The "ui_b_button_round_gradient" asset catalog image resource.
    static let uiBButtonRoundGradient = DeveloperToolsSupport.ImageResource(name: "ui_b_button_round_gradient", bundle: resourceBundle)

    /// The "ui_b_button_round_line" asset catalog image resource.
    static let uiBButtonRoundLine = DeveloperToolsSupport.ImageResource(name: "ui_b_button_round_line", bundle: resourceBundle)

    /// The "ui_b_button_square_border" asset catalog image resource.
    static let uiBButtonSquareBorder = DeveloperToolsSupport.ImageResource(name: "ui_b_button_square_border", bundle: resourceBundle)

    /// The "ui_b_button_square_depth_border" asset catalog image resource.
    static let uiBButtonSquareDepthBorder = DeveloperToolsSupport.ImageResource(name: "ui_b_button_square_depth_border", bundle: resourceBundle)

    /// The "ui_b_button_square_depth_flat" asset catalog image resource.
    static let uiBButtonSquareDepthFlat = DeveloperToolsSupport.ImageResource(name: "ui_b_button_square_depth_flat", bundle: resourceBundle)

    /// The "ui_b_button_square_depth_gloss" asset catalog image resource.
    static let uiBButtonSquareDepthGloss = DeveloperToolsSupport.ImageResource(name: "ui_b_button_square_depth_gloss", bundle: resourceBundle)

    /// The "ui_b_button_square_depth_gradient" asset catalog image resource.
    static let uiBButtonSquareDepthGradient = DeveloperToolsSupport.ImageResource(name: "ui_b_button_square_depth_gradient", bundle: resourceBundle)

    /// The "ui_b_button_square_depth_line" asset catalog image resource.
    static let uiBButtonSquareDepthLine = DeveloperToolsSupport.ImageResource(name: "ui_b_button_square_depth_line", bundle: resourceBundle)

    /// The "ui_b_button_square_flat" asset catalog image resource.
    static let uiBButtonSquareFlat = DeveloperToolsSupport.ImageResource(name: "ui_b_button_square_flat", bundle: resourceBundle)

    /// The "ui_b_button_square_gloss" asset catalog image resource.
    static let uiBButtonSquareGloss = DeveloperToolsSupport.ImageResource(name: "ui_b_button_square_gloss", bundle: resourceBundle)

    /// The "ui_b_button_square_gradient" asset catalog image resource.
    static let uiBButtonSquareGradient = DeveloperToolsSupport.ImageResource(name: "ui_b_button_square_gradient", bundle: resourceBundle)

    /// The "ui_b_button_square_line" asset catalog image resource.
    static let uiBButtonSquareLine = DeveloperToolsSupport.ImageResource(name: "ui_b_button_square_line", bundle: resourceBundle)

    /// The "ui_b_check_round_color" asset catalog image resource.
    static let uiBCheckRound = DeveloperToolsSupport.ImageResource(name: "ui_b_check_round_color", bundle: resourceBundle)

    /// The "ui_b_icon_checkmark" asset catalog image resource.
    static let uiBIconCheckmark = DeveloperToolsSupport.ImageResource(name: "ui_b_icon_checkmark", bundle: resourceBundle)

    /// The "ui_g_arrow_basic_e" asset catalog image resource.
    static let uiGArrowBasicE = DeveloperToolsSupport.ImageResource(name: "ui_g_arrow_basic_e", bundle: resourceBundle)

    /// The "ui_g_arrow_basic_e_small" asset catalog image resource.
    static let uiGArrowBasicESmall = DeveloperToolsSupport.ImageResource(name: "ui_g_arrow_basic_e_small", bundle: resourceBundle)

    /// The "ui_g_arrow_basic_n" asset catalog image resource.
    static let uiGArrowBasicN = DeveloperToolsSupport.ImageResource(name: "ui_g_arrow_basic_n", bundle: resourceBundle)

    /// The "ui_g_arrow_basic_n_small" asset catalog image resource.
    static let uiGArrowBasicNSmall = DeveloperToolsSupport.ImageResource(name: "ui_g_arrow_basic_n_small", bundle: resourceBundle)

    /// The "ui_g_arrow_basic_s" asset catalog image resource.
    static let uiGArrowBasicS = DeveloperToolsSupport.ImageResource(name: "ui_g_arrow_basic_s", bundle: resourceBundle)

    /// The "ui_g_arrow_basic_s_small" asset catalog image resource.
    static let uiGArrowBasicSSmall = DeveloperToolsSupport.ImageResource(name: "ui_g_arrow_basic_s_small", bundle: resourceBundle)

    /// The "ui_g_arrow_basic_w" asset catalog image resource.
    static let uiGArrowBasicW = DeveloperToolsSupport.ImageResource(name: "ui_g_arrow_basic_w", bundle: resourceBundle)

    /// The "ui_g_arrow_basic_w_small" asset catalog image resource.
    static let uiGArrowBasicWSmall = DeveloperToolsSupport.ImageResource(name: "ui_g_arrow_basic_w_small", bundle: resourceBundle)

    /// The "ui_g_button_rectangle_border" asset catalog image resource.
    static let uiGButtonRectangleBorder = DeveloperToolsSupport.ImageResource(name: "ui_g_button_rectangle_border", bundle: resourceBundle)

    /// The "ui_g_button_rectangle_depth_border" asset catalog image resource.
    static let uiGButtonRectangleDepthBorder = DeveloperToolsSupport.ImageResource(name: "ui_g_button_rectangle_depth_border", bundle: resourceBundle)

    /// The "ui_g_button_rectangle_depth_flat" asset catalog image resource.
    static let uiGButtonRectangleDepthFlat = DeveloperToolsSupport.ImageResource(name: "ui_g_button_rectangle_depth_flat", bundle: resourceBundle)

    /// The "ui_g_button_rectangle_depth_gloss" asset catalog image resource.
    static let uiGButtonRectangleDepthGloss = DeveloperToolsSupport.ImageResource(name: "ui_g_button_rectangle_depth_gloss", bundle: resourceBundle)

    /// The "ui_g_button_rectangle_depth_gradient" asset catalog image resource.
    static let uiGButtonRectangleDepthGradient = DeveloperToolsSupport.ImageResource(name: "ui_g_button_rectangle_depth_gradient", bundle: resourceBundle)

    /// The "ui_g_button_rectangle_depth_line" asset catalog image resource.
    static let uiGButtonRectangleDepthLine = DeveloperToolsSupport.ImageResource(name: "ui_g_button_rectangle_depth_line", bundle: resourceBundle)

    /// The "ui_g_button_rectangle_flat" asset catalog image resource.
    static let uiGButtonRectangleFlat = DeveloperToolsSupport.ImageResource(name: "ui_g_button_rectangle_flat", bundle: resourceBundle)

    /// The "ui_g_button_rectangle_gloss" asset catalog image resource.
    static let uiGButtonRectangleGloss = DeveloperToolsSupport.ImageResource(name: "ui_g_button_rectangle_gloss", bundle: resourceBundle)

    /// The "ui_g_button_rectangle_gradient" asset catalog image resource.
    static let uiGButtonRectangleGradient = DeveloperToolsSupport.ImageResource(name: "ui_g_button_rectangle_gradient", bundle: resourceBundle)

    /// The "ui_g_button_rectangle_line" asset catalog image resource.
    static let uiGButtonRectangleLine = DeveloperToolsSupport.ImageResource(name: "ui_g_button_rectangle_line", bundle: resourceBundle)

    /// The "ui_g_button_round_border" asset catalog image resource.
    static let uiGButtonRoundBorder = DeveloperToolsSupport.ImageResource(name: "ui_g_button_round_border", bundle: resourceBundle)

    /// The "ui_g_button_round_depth_border" asset catalog image resource.
    static let uiGButtonRoundDepthBorder = DeveloperToolsSupport.ImageResource(name: "ui_g_button_round_depth_border", bundle: resourceBundle)

    /// The "ui_g_button_round_depth_flat" asset catalog image resource.
    static let uiGButtonRoundDepthFlat = DeveloperToolsSupport.ImageResource(name: "ui_g_button_round_depth_flat", bundle: resourceBundle)

    /// The "ui_g_button_round_depth_gloss" asset catalog image resource.
    static let uiGButtonRoundDepthGloss = DeveloperToolsSupport.ImageResource(name: "ui_g_button_round_depth_gloss", bundle: resourceBundle)

    /// The "ui_g_button_round_depth_gradient" asset catalog image resource.
    static let uiGButtonRoundDepthGradient = DeveloperToolsSupport.ImageResource(name: "ui_g_button_round_depth_gradient", bundle: resourceBundle)

    /// The "ui_g_button_round_depth_line" asset catalog image resource.
    static let uiGButtonRoundDepthLine = DeveloperToolsSupport.ImageResource(name: "ui_g_button_round_depth_line", bundle: resourceBundle)

    /// The "ui_g_button_round_flat" asset catalog image resource.
    static let uiGButtonRoundFlat = DeveloperToolsSupport.ImageResource(name: "ui_g_button_round_flat", bundle: resourceBundle)

    /// The "ui_g_button_round_gloss" asset catalog image resource.
    static let uiGButtonRoundGloss = DeveloperToolsSupport.ImageResource(name: "ui_g_button_round_gloss", bundle: resourceBundle)

    /// The "ui_g_button_round_gradient" asset catalog image resource.
    static let uiGButtonRoundGradient = DeveloperToolsSupport.ImageResource(name: "ui_g_button_round_gradient", bundle: resourceBundle)

    /// The "ui_g_button_round_line" asset catalog image resource.
    static let uiGButtonRoundLine = DeveloperToolsSupport.ImageResource(name: "ui_g_button_round_line", bundle: resourceBundle)

    /// The "ui_g_button_square_border" asset catalog image resource.
    static let uiGButtonSquareBorder = DeveloperToolsSupport.ImageResource(name: "ui_g_button_square_border", bundle: resourceBundle)

    /// The "ui_g_button_square_depth_border" asset catalog image resource.
    static let uiGButtonSquareDepthBorder = DeveloperToolsSupport.ImageResource(name: "ui_g_button_square_depth_border", bundle: resourceBundle)

    /// The "ui_g_button_square_depth_flat" asset catalog image resource.
    static let uiGButtonSquareDepthFlat = DeveloperToolsSupport.ImageResource(name: "ui_g_button_square_depth_flat", bundle: resourceBundle)

    /// The "ui_g_button_square_depth_gloss" asset catalog image resource.
    static let uiGButtonSquareDepthGloss = DeveloperToolsSupport.ImageResource(name: "ui_g_button_square_depth_gloss", bundle: resourceBundle)

    /// The "ui_g_button_square_depth_gradient" asset catalog image resource.
    static let uiGButtonSquareDepthGradient = DeveloperToolsSupport.ImageResource(name: "ui_g_button_square_depth_gradient", bundle: resourceBundle)

    /// The "ui_g_button_square_depth_line" asset catalog image resource.
    static let uiGButtonSquareDepthLine = DeveloperToolsSupport.ImageResource(name: "ui_g_button_square_depth_line", bundle: resourceBundle)

    /// The "ui_g_button_square_flat" asset catalog image resource.
    static let uiGButtonSquareFlat = DeveloperToolsSupport.ImageResource(name: "ui_g_button_square_flat", bundle: resourceBundle)

    /// The "ui_g_button_square_gloss" asset catalog image resource.
    static let uiGButtonSquareGloss = DeveloperToolsSupport.ImageResource(name: "ui_g_button_square_gloss", bundle: resourceBundle)

    /// The "ui_g_button_square_gradient" asset catalog image resource.
    static let uiGButtonSquareGradient = DeveloperToolsSupport.ImageResource(name: "ui_g_button_square_gradient", bundle: resourceBundle)

    /// The "ui_g_button_square_line" asset catalog image resource.
    static let uiGButtonSquareLine = DeveloperToolsSupport.ImageResource(name: "ui_g_button_square_line", bundle: resourceBundle)

    /// The "ui_g_check_round_color" asset catalog image resource.
    static let uiGCheckRound = DeveloperToolsSupport.ImageResource(name: "ui_g_check_round_color", bundle: resourceBundle)

    /// The "ui_g_icon_checkmark" asset catalog image resource.
    static let uiGIconCheckmark = DeveloperToolsSupport.ImageResource(name: "ui_g_icon_checkmark", bundle: resourceBundle)

    /// The "ui_r_arrow_basic_e" asset catalog image resource.
    static let uiRArrowBasicE = DeveloperToolsSupport.ImageResource(name: "ui_r_arrow_basic_e", bundle: resourceBundle)

    /// The "ui_r_arrow_basic_e_small" asset catalog image resource.
    static let uiRArrowBasicESmall = DeveloperToolsSupport.ImageResource(name: "ui_r_arrow_basic_e_small", bundle: resourceBundle)

    /// The "ui_r_arrow_basic_n" asset catalog image resource.
    static let uiRArrowBasicN = DeveloperToolsSupport.ImageResource(name: "ui_r_arrow_basic_n", bundle: resourceBundle)

    /// The "ui_r_arrow_basic_n_small" asset catalog image resource.
    static let uiRArrowBasicNSmall = DeveloperToolsSupport.ImageResource(name: "ui_r_arrow_basic_n_small", bundle: resourceBundle)

    /// The "ui_r_arrow_basic_s" asset catalog image resource.
    static let uiRArrowBasicS = DeveloperToolsSupport.ImageResource(name: "ui_r_arrow_basic_s", bundle: resourceBundle)

    /// The "ui_r_arrow_basic_s_small" asset catalog image resource.
    static let uiRArrowBasicSSmall = DeveloperToolsSupport.ImageResource(name: "ui_r_arrow_basic_s_small", bundle: resourceBundle)

    /// The "ui_r_arrow_basic_w" asset catalog image resource.
    static let uiRArrowBasicW = DeveloperToolsSupport.ImageResource(name: "ui_r_arrow_basic_w", bundle: resourceBundle)

    /// The "ui_r_arrow_basic_w_small" asset catalog image resource.
    static let uiRArrowBasicWSmall = DeveloperToolsSupport.ImageResource(name: "ui_r_arrow_basic_w_small", bundle: resourceBundle)

    /// The "ui_r_button_rectangle_border" asset catalog image resource.
    static let uiRButtonRectangleBorder = DeveloperToolsSupport.ImageResource(name: "ui_r_button_rectangle_border", bundle: resourceBundle)

    /// The "ui_r_button_rectangle_depth_border" asset catalog image resource.
    static let uiRButtonRectangleDepthBorder = DeveloperToolsSupport.ImageResource(name: "ui_r_button_rectangle_depth_border", bundle: resourceBundle)

    /// The "ui_r_button_rectangle_depth_flat" asset catalog image resource.
    static let uiRButtonRectangleDepthFlat = DeveloperToolsSupport.ImageResource(name: "ui_r_button_rectangle_depth_flat", bundle: resourceBundle)

    /// The "ui_r_button_rectangle_depth_gloss" asset catalog image resource.
    static let uiRButtonRectangleDepthGloss = DeveloperToolsSupport.ImageResource(name: "ui_r_button_rectangle_depth_gloss", bundle: resourceBundle)

    /// The "ui_r_button_rectangle_depth_gradient" asset catalog image resource.
    static let uiRButtonRectangleDepthGradient = DeveloperToolsSupport.ImageResource(name: "ui_r_button_rectangle_depth_gradient", bundle: resourceBundle)

    /// The "ui_r_button_rectangle_depth_line" asset catalog image resource.
    static let uiRButtonRectangleDepthLine = DeveloperToolsSupport.ImageResource(name: "ui_r_button_rectangle_depth_line", bundle: resourceBundle)

    /// The "ui_r_button_rectangle_flat" asset catalog image resource.
    static let uiRButtonRectangleFlat = DeveloperToolsSupport.ImageResource(name: "ui_r_button_rectangle_flat", bundle: resourceBundle)

    /// The "ui_r_button_rectangle_gloss" asset catalog image resource.
    static let uiRButtonRectangleGloss = DeveloperToolsSupport.ImageResource(name: "ui_r_button_rectangle_gloss", bundle: resourceBundle)

    /// The "ui_r_button_rectangle_gradient" asset catalog image resource.
    static let uiRButtonRectangleGradient = DeveloperToolsSupport.ImageResource(name: "ui_r_button_rectangle_gradient", bundle: resourceBundle)

    /// The "ui_r_button_rectangle_line" asset catalog image resource.
    static let uiRButtonRectangleLine = DeveloperToolsSupport.ImageResource(name: "ui_r_button_rectangle_line", bundle: resourceBundle)

    /// The "ui_r_button_round_border" asset catalog image resource.
    static let uiRButtonRoundBorder = DeveloperToolsSupport.ImageResource(name: "ui_r_button_round_border", bundle: resourceBundle)

    /// The "ui_r_button_round_depth_border" asset catalog image resource.
    static let uiRButtonRoundDepthBorder = DeveloperToolsSupport.ImageResource(name: "ui_r_button_round_depth_border", bundle: resourceBundle)

    /// The "ui_r_button_round_depth_flat" asset catalog image resource.
    static let uiRButtonRoundDepthFlat = DeveloperToolsSupport.ImageResource(name: "ui_r_button_round_depth_flat", bundle: resourceBundle)

    /// The "ui_r_button_round_depth_gloss" asset catalog image resource.
    static let uiRButtonRoundDepthGloss = DeveloperToolsSupport.ImageResource(name: "ui_r_button_round_depth_gloss", bundle: resourceBundle)

    /// The "ui_r_button_round_depth_gradient" asset catalog image resource.
    static let uiRButtonRoundDepthGradient = DeveloperToolsSupport.ImageResource(name: "ui_r_button_round_depth_gradient", bundle: resourceBundle)

    /// The "ui_r_button_round_depth_line" asset catalog image resource.
    static let uiRButtonRoundDepthLine = DeveloperToolsSupport.ImageResource(name: "ui_r_button_round_depth_line", bundle: resourceBundle)

    /// The "ui_r_button_round_flat" asset catalog image resource.
    static let uiRButtonRoundFlat = DeveloperToolsSupport.ImageResource(name: "ui_r_button_round_flat", bundle: resourceBundle)

    /// The "ui_r_button_round_gloss" asset catalog image resource.
    static let uiRButtonRoundGloss = DeveloperToolsSupport.ImageResource(name: "ui_r_button_round_gloss", bundle: resourceBundle)

    /// The "ui_r_button_round_gradient" asset catalog image resource.
    static let uiRButtonRoundGradient = DeveloperToolsSupport.ImageResource(name: "ui_r_button_round_gradient", bundle: resourceBundle)

    /// The "ui_r_button_round_line" asset catalog image resource.
    static let uiRButtonRoundLine = DeveloperToolsSupport.ImageResource(name: "ui_r_button_round_line", bundle: resourceBundle)

    /// The "ui_r_button_square_border" asset catalog image resource.
    static let uiRButtonSquareBorder = DeveloperToolsSupport.ImageResource(name: "ui_r_button_square_border", bundle: resourceBundle)

    /// The "ui_r_button_square_depth_border" asset catalog image resource.
    static let uiRButtonSquareDepthBorder = DeveloperToolsSupport.ImageResource(name: "ui_r_button_square_depth_border", bundle: resourceBundle)

    /// The "ui_r_button_square_depth_flat" asset catalog image resource.
    static let uiRButtonSquareDepthFlat = DeveloperToolsSupport.ImageResource(name: "ui_r_button_square_depth_flat", bundle: resourceBundle)

    /// The "ui_r_button_square_depth_gloss" asset catalog image resource.
    static let uiRButtonSquareDepthGloss = DeveloperToolsSupport.ImageResource(name: "ui_r_button_square_depth_gloss", bundle: resourceBundle)

    /// The "ui_r_button_square_depth_gradient" asset catalog image resource.
    static let uiRButtonSquareDepthGradient = DeveloperToolsSupport.ImageResource(name: "ui_r_button_square_depth_gradient", bundle: resourceBundle)

    /// The "ui_r_button_square_depth_line" asset catalog image resource.
    static let uiRButtonSquareDepthLine = DeveloperToolsSupport.ImageResource(name: "ui_r_button_square_depth_line", bundle: resourceBundle)

    /// The "ui_r_button_square_flat" asset catalog image resource.
    static let uiRButtonSquareFlat = DeveloperToolsSupport.ImageResource(name: "ui_r_button_square_flat", bundle: resourceBundle)

    /// The "ui_r_button_square_gloss" asset catalog image resource.
    static let uiRButtonSquareGloss = DeveloperToolsSupport.ImageResource(name: "ui_r_button_square_gloss", bundle: resourceBundle)

    /// The "ui_r_button_square_gradient" asset catalog image resource.
    static let uiRButtonSquareGradient = DeveloperToolsSupport.ImageResource(name: "ui_r_button_square_gradient", bundle: resourceBundle)

    /// The "ui_r_button_square_line" asset catalog image resource.
    static let uiRButtonSquareLine = DeveloperToolsSupport.ImageResource(name: "ui_r_button_square_line", bundle: resourceBundle)

    /// The "ui_r_check_round_color" asset catalog image resource.
    static let uiRCheckRound = DeveloperToolsSupport.ImageResource(name: "ui_r_check_round_color", bundle: resourceBundle)

    /// The "ui_r_icon_checkmark" asset catalog image resource.
    static let uiRIconCheckmark = DeveloperToolsSupport.ImageResource(name: "ui_r_icon_checkmark", bundle: resourceBundle)

    /// The "ui_x_button_rectangle_depth_line" asset catalog image resource.
    static let uiXButtonRectangleDepthLine = DeveloperToolsSupport.ImageResource(name: "ui_x_button_rectangle_depth_line", bundle: resourceBundle)

    /// The "ui_x_button_rectangle_line" asset catalog image resource.
    static let uiXButtonRectangleLine = DeveloperToolsSupport.ImageResource(name: "ui_x_button_rectangle_line", bundle: resourceBundle)

    /// The "ui_x_button_round_depth_line" asset catalog image resource.
    static let uiXButtonRoundDepthLine = DeveloperToolsSupport.ImageResource(name: "ui_x_button_round_depth_line", bundle: resourceBundle)

    /// The "ui_x_button_round_line" asset catalog image resource.
    static let uiXButtonRoundLine = DeveloperToolsSupport.ImageResource(name: "ui_x_button_round_line", bundle: resourceBundle)

    /// The "ui_x_button_square_depth_line" asset catalog image resource.
    static let uiXButtonSquareDepthLine = DeveloperToolsSupport.ImageResource(name: "ui_x_button_square_depth_line", bundle: resourceBundle)

    /// The "ui_x_button_square_line" asset catalog image resource.
    static let uiXButtonSquareLine = DeveloperToolsSupport.ImageResource(name: "ui_x_button_square_line", bundle: resourceBundle)

    /// The "ui_y_arrow_basic_e" asset catalog image resource.
    static let uiYArrowBasicE = DeveloperToolsSupport.ImageResource(name: "ui_y_arrow_basic_e", bundle: resourceBundle)

    /// The "ui_y_arrow_basic_e_small" asset catalog image resource.
    static let uiYArrowBasicESmall = DeveloperToolsSupport.ImageResource(name: "ui_y_arrow_basic_e_small", bundle: resourceBundle)

    /// The "ui_y_arrow_basic_n" asset catalog image resource.
    static let uiYArrowBasicN = DeveloperToolsSupport.ImageResource(name: "ui_y_arrow_basic_n", bundle: resourceBundle)

    /// The "ui_y_arrow_basic_n_small" asset catalog image resource.
    static let uiYArrowBasicNSmall = DeveloperToolsSupport.ImageResource(name: "ui_y_arrow_basic_n_small", bundle: resourceBundle)

    /// The "ui_y_arrow_basic_s" asset catalog image resource.
    static let uiYArrowBasicS = DeveloperToolsSupport.ImageResource(name: "ui_y_arrow_basic_s", bundle: resourceBundle)

    /// The "ui_y_arrow_basic_s_small" asset catalog image resource.
    static let uiYArrowBasicSSmall = DeveloperToolsSupport.ImageResource(name: "ui_y_arrow_basic_s_small", bundle: resourceBundle)

    /// The "ui_y_arrow_basic_w" asset catalog image resource.
    static let uiYArrowBasicW = DeveloperToolsSupport.ImageResource(name: "ui_y_arrow_basic_w", bundle: resourceBundle)

    /// The "ui_y_arrow_basic_w_small" asset catalog image resource.
    static let uiYArrowBasicWSmall = DeveloperToolsSupport.ImageResource(name: "ui_y_arrow_basic_w_small", bundle: resourceBundle)

    /// The "ui_y_button_rectangle_border" asset catalog image resource.
    static let uiYButtonRectangleBorder = DeveloperToolsSupport.ImageResource(name: "ui_y_button_rectangle_border", bundle: resourceBundle)

    /// The "ui_y_button_rectangle_depth_border" asset catalog image resource.
    static let uiYButtonRectangleDepthBorder = DeveloperToolsSupport.ImageResource(name: "ui_y_button_rectangle_depth_border", bundle: resourceBundle)

    /// The "ui_y_button_rectangle_depth_flat" asset catalog image resource.
    static let uiYButtonRectangleDepthFlat = DeveloperToolsSupport.ImageResource(name: "ui_y_button_rectangle_depth_flat", bundle: resourceBundle)

    /// The "ui_y_button_rectangle_depth_gloss" asset catalog image resource.
    static let uiYButtonRectangleDepthGloss = DeveloperToolsSupport.ImageResource(name: "ui_y_button_rectangle_depth_gloss", bundle: resourceBundle)

    /// The "ui_y_button_rectangle_depth_gradient" asset catalog image resource.
    static let uiYButtonRectangleDepthGradient = DeveloperToolsSupport.ImageResource(name: "ui_y_button_rectangle_depth_gradient", bundle: resourceBundle)

    /// The "ui_y_button_rectangle_depth_line" asset catalog image resource.
    static let uiYButtonRectangleDepthLine = DeveloperToolsSupport.ImageResource(name: "ui_y_button_rectangle_depth_line", bundle: resourceBundle)

    /// The "ui_y_button_rectangle_flat" asset catalog image resource.
    static let uiYButtonRectangleFlat = DeveloperToolsSupport.ImageResource(name: "ui_y_button_rectangle_flat", bundle: resourceBundle)

    /// The "ui_y_button_rectangle_gloss" asset catalog image resource.
    static let uiYButtonRectangleGloss = DeveloperToolsSupport.ImageResource(name: "ui_y_button_rectangle_gloss", bundle: resourceBundle)

    /// The "ui_y_button_rectangle_gradient" asset catalog image resource.
    static let uiYButtonRectangleGradient = DeveloperToolsSupport.ImageResource(name: "ui_y_button_rectangle_gradient", bundle: resourceBundle)

    /// The "ui_y_button_rectangle_line" asset catalog image resource.
    static let uiYButtonRectangleLine = DeveloperToolsSupport.ImageResource(name: "ui_y_button_rectangle_line", bundle: resourceBundle)

    /// The "ui_y_button_round_border" asset catalog image resource.
    static let uiYButtonRoundBorder = DeveloperToolsSupport.ImageResource(name: "ui_y_button_round_border", bundle: resourceBundle)

    /// The "ui_y_button_round_depth_border" asset catalog image resource.
    static let uiYButtonRoundDepthBorder = DeveloperToolsSupport.ImageResource(name: "ui_y_button_round_depth_border", bundle: resourceBundle)

    /// The "ui_y_button_round_depth_flat" asset catalog image resource.
    static let uiYButtonRoundDepthFlat = DeveloperToolsSupport.ImageResource(name: "ui_y_button_round_depth_flat", bundle: resourceBundle)

    /// The "ui_y_button_round_depth_gloss" asset catalog image resource.
    static let uiYButtonRoundDepthGloss = DeveloperToolsSupport.ImageResource(name: "ui_y_button_round_depth_gloss", bundle: resourceBundle)

    /// The "ui_y_button_round_depth_gradient" asset catalog image resource.
    static let uiYButtonRoundDepthGradient = DeveloperToolsSupport.ImageResource(name: "ui_y_button_round_depth_gradient", bundle: resourceBundle)

    /// The "ui_y_button_round_depth_line" asset catalog image resource.
    static let uiYButtonRoundDepthLine = DeveloperToolsSupport.ImageResource(name: "ui_y_button_round_depth_line", bundle: resourceBundle)

    /// The "ui_y_button_round_flat" asset catalog image resource.
    static let uiYButtonRoundFlat = DeveloperToolsSupport.ImageResource(name: "ui_y_button_round_flat", bundle: resourceBundle)

    /// The "ui_y_button_round_gloss" asset catalog image resource.
    static let uiYButtonRoundGloss = DeveloperToolsSupport.ImageResource(name: "ui_y_button_round_gloss", bundle: resourceBundle)

    /// The "ui_y_button_round_gradient" asset catalog image resource.
    static let uiYButtonRoundGradient = DeveloperToolsSupport.ImageResource(name: "ui_y_button_round_gradient", bundle: resourceBundle)

    /// The "ui_y_button_round_line" asset catalog image resource.
    static let uiYButtonRoundLine = DeveloperToolsSupport.ImageResource(name: "ui_y_button_round_line", bundle: resourceBundle)

    /// The "ui_y_button_square_border" asset catalog image resource.
    static let uiYButtonSquareBorder = DeveloperToolsSupport.ImageResource(name: "ui_y_button_square_border", bundle: resourceBundle)

    /// The "ui_y_button_square_depth_border" asset catalog image resource.
    static let uiYButtonSquareDepthBorder = DeveloperToolsSupport.ImageResource(name: "ui_y_button_square_depth_border", bundle: resourceBundle)

    /// The "ui_y_button_square_depth_flat" asset catalog image resource.
    static let uiYButtonSquareDepthFlat = DeveloperToolsSupport.ImageResource(name: "ui_y_button_square_depth_flat", bundle: resourceBundle)

    /// The "ui_y_button_square_depth_gloss" asset catalog image resource.
    static let uiYButtonSquareDepthGloss = DeveloperToolsSupport.ImageResource(name: "ui_y_button_square_depth_gloss", bundle: resourceBundle)

    /// The "ui_y_button_square_depth_gradient" asset catalog image resource.
    static let uiYButtonSquareDepthGradient = DeveloperToolsSupport.ImageResource(name: "ui_y_button_square_depth_gradient", bundle: resourceBundle)

    /// The "ui_y_button_square_depth_line" asset catalog image resource.
    static let uiYButtonSquareDepthLine = DeveloperToolsSupport.ImageResource(name: "ui_y_button_square_depth_line", bundle: resourceBundle)

    /// The "ui_y_button_square_flat" asset catalog image resource.
    static let uiYButtonSquareFlat = DeveloperToolsSupport.ImageResource(name: "ui_y_button_square_flat", bundle: resourceBundle)

    /// The "ui_y_button_square_gloss" asset catalog image resource.
    static let uiYButtonSquareGloss = DeveloperToolsSupport.ImageResource(name: "ui_y_button_square_gloss", bundle: resourceBundle)

    /// The "ui_y_button_square_gradient" asset catalog image resource.
    static let uiYButtonSquareGradient = DeveloperToolsSupport.ImageResource(name: "ui_y_button_square_gradient", bundle: resourceBundle)

    /// The "ui_y_button_square_line" asset catalog image resource.
    static let uiYButtonSquareLine = DeveloperToolsSupport.ImageResource(name: "ui_y_button_square_line", bundle: resourceBundle)

    /// The "ui_y_check_round_color" asset catalog image resource.
    static let uiYCheckRound = DeveloperToolsSupport.ImageResource(name: "ui_y_check_round_color", bundle: resourceBundle)

    /// The "ui_y_icon_checkmark" asset catalog image resource.
    static let uiYIconCheckmark = DeveloperToolsSupport.ImageResource(name: "ui_y_icon_checkmark", bundle: resourceBundle)

    /// The "water_elemental" asset catalog image resource.
    static let waterElemental = DeveloperToolsSupport.ImageResource(name: "water_elemental", bundle: resourceBundle)

    /// The "well" asset catalog image resource.
    static let well = DeveloperToolsSupport.ImageResource(name: "well", bundle: resourceBundle)

    /// The "windmill" asset catalog image resource.
    static let windmill = DeveloperToolsSupport.ImageResource(name: "windmill", bundle: resourceBundle)

    /// The "wolf" asset catalog image resource.
    static let wolf = DeveloperToolsSupport.ImageResource(name: "wolf", bundle: resourceBundle)

}

