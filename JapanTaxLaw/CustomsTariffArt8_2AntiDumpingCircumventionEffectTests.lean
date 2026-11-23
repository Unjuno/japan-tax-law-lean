import JapanTaxLaw.CustomsTariffArt8_2AntiDumpingCircumventionEffectSpec

/-!
# CustomsTariffArt8_2AntiDumpingCircumventionEffectTests — kernel-checked checks for 第八条の二 caption

Verifies EFFECT 「（不当廉売関税の課税の回避のために第三国から輸入される貨物等に対して課する関税）」: third-country origin with avoidance purpose only.
-/

namespace JapanTaxLaw.CustomsTariffArt8_2AntiDumpingCircumventionEffect

example : withinEffect ImportOrigin.thirdCountry Purpose.avoidAntiDumping = true := circumnvention_effect_within
example : withinEffect ImportOrigin.other Purpose.avoidAntiDumping = false := other_origin_outside Purpose.avoidAntiDumping
example : withinEffect ImportOrigin.thirdCountry Purpose.other = false :=
  other_purpose_outside ImportOrigin.thirdCountry
example (o : ImportOrigin) (p : Purpose) : (withinEffect o p = true) ↔ SpecWithinEffect o p :=
  agree_within_effect o p

end JapanTaxLaw.CustomsTariffArt8_2AntiDumpingCircumventionEffect
