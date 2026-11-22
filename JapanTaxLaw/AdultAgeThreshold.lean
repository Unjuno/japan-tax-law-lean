import JapanTaxLaw.TaxFinance

/-
# AdultAgeThreshold — 沖縄の復帰に伴う地方税法等の適用の特別措置等に関する省令 第七条（成年者年齢二十歳以上）

Sources (pinned):

  Law id: 347M50000008013
  Revision: 347M50000008013_20010106_412M50000008044
  Raw snapshot: data/raw/347M50000008013_20010106_412M50000008044.law.json
  SHA-256: de204ca8423008be669b39af7fbda3da864471b0f0d0eb37f039159ae993cb51
  Official title (raw source, law_type=MinisterialOrdinance / 省令):
    沖縄の復帰に伴う地方税法等の適用の特別措置等に関する省令

Pinned 原文 (verbatim, scoped Article 7):
「前二項の成年者数は、官報で公示された最近の国勢調査の結果による年齢二十歳以上の人口をいう。」

Scoped claim: only the explicit numeric age threshold for an 成年者 (adult) — 年齢二十歳以上.
Variable contract: age = 年齢 (Nat, 歳); 二十歳以上 = age >= 20 INCLUSIVE (>=).
The statute defines 成年者数 as the population aged >= 20 per the latest census;
only the numeric threshold (20, inclusive) is modelled here.
-/

namespace JapanTaxLaw.AdultAgeThreshold

def adultAge : Nat := 20

def isAdult (age : Nat) : Bool :=
  decide (adultAge <= age)

theorem isAdult_0 : isAdult 0 = false := by decide
theorem isAdult_19 : isAdult 19 = false := by decide
theorem isAdult_20 : isAdult 20 = true := by decide
theorem isAdult_21 : isAdult 21 = true := by decide
theorem adultAge_value : adultAge = 20 := rfl

end JapanTaxLaw.AdultAgeThreshold
