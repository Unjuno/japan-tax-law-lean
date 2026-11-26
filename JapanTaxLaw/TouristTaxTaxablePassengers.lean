import JapanTaxLaw.TaxFinance

/-
# TouristTaxTaxablePassengers — 国際観光旅客税法施行規則 art.3(2) ホ（課税旅客数）

Pinned source (independent re-extraction from the scoped article):
  Law id: 430M60000040039 (国際観光旅客税法施行規則)
  Raw snapshot: data/raw/430M60000040039_20250401_507M60000040024.law.json
  Article: 第三条 (計算書の記載事項), 第二号 イ〜ホ

原文逐語（一字一句改変なし）:
  「イ　旅客の数
    ロ　国際観光旅客等でない者の数
    ハ　法第六条各号に掲げる者の数
    ニ　他の法律の規定により本邦からの出国につき国際観光旅客税を免除される者の数
    ホ　イに掲げる数からロからニまでに掲げる数の合計数を控除した数」

Variable contract (typed, unit recorded, domain Nat):
  `i  : Nat` = イ 旅客の数 (人).
  `ro : Nat` = ロ 国際観光旅客等でない者の数 (人).
  `ha : Nat` = ハ 法第六条各号に掲げる者の数 (人).
  `ni : Nat` = ニ 他の法律による免税者の数 (人).
  `taxablePassengers i ro ha ni = i - (ro + ha + ni)` — Nat saturating
  subtraction (控除は零を下限とする). Unit: 人, domain Nat.

Scope: ONLY the arithmetic definition of ホ. The identification of the four
counts from source documents, the ヘ tax amount, and all other articles are
NOT MODELLED. No `sorry`, `admit`, `axiom` or finite enumeration.
-/

namespace JapanTaxLaw.TouristTaxTaxablePassengers

/-- ホ: イ − (ロ + ハ + ニ)。Nat の飽和減算（下限 0）。 -/
def taxablePassengers (i ro ha ni : Nat) : Nat :=
  i - (ro + ha + ni)

/-- 普遍的境界: 控除後の数は元の旅客数を超えない。 -/
theorem neverExceedsTotal (i ro ha ni : Nat) :
    taxablePassengers i ro ha ni <= i := by
  unfold taxablePassengers
  omega

/-- 普遍的境界: 控除合計が全体を覆えば 0 になる（vacuous でない碰撞）。 -/
theorem zeroWhenExemptionsCoverAll (i ro ha ni : Nat) :
    i <= ro + ha + ni → taxablePassengers i ro ha ni = 0 := by
  unfold taxablePassengers
  intro h
  omega

/-- 普遍的単調性: 免税者が増えても課税旅客数は増えない。 -/
theorem monotoneInExemptions (i ro ha ni ni' : Nat) :
    ni <= ni' → taxablePassengers i ro ha ni' <= taxablePassengers i ro ha ni := by
  unfold taxablePassengers
  intro h
  omega

end JapanTaxLaw.TouristTaxTaxablePassengers
