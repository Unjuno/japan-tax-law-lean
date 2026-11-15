import JapanTaxLaw.Verdict

/-!
# TaxGeneral — 国税通則法（国税の通則に関する法律）基本定義

Source (pinned):
https://laws.e-gov.go.jp/law/337AC0000000066
Law id: 337AC0000000066（昭和三十七年法律第六十六号）
Revision: 337AC0000000066_20261101_507AC0000000013
Amendment enforcement date: 2026-11-01 (CurrentEnforced)
Raw snapshot sha256: 6F8B43E168652D228066CDA3389A3BF6823900A9268E6BF97297CB6B25189DEE
(as recorded in data/INVENTORY.json; see docs/INVENTORY.md)

Scope:
* Only the definition layer (Act art. 2, items 1–4) is formalized here:
  - 国税 (Act art. 2 item 1): 国が課する税のうち
    関税、とん税、特別とん税、森林環境税及び特別法人事業税以外のもの.
  - 源泉徴収等による国税 (Act art. 2 item 2): 源泉徴収に係る所得税及び
    国際観光旅客税法 第2条第1項第7号に規定する特別徴収に係る国際観光旅客税
    （これらの税に係る附帯税を除く）.
  - 消費税等 (Act art. 2 item 3): 消費税、酒税、たばこ税、揮発油税、
    地方揮発油税、石油ガス税及び石油石炭税.
  - 附帯税 (Act art. 2 item 4): 国税のうち 延滞税、利子税、過少申告加算税、
    無申告加算税、不納付加算税及び重加算税.

What this model deliberately does **not** do:
* It does not model 納税者 (Act art. 2 item 5), 納税申告書 (item 6),
  法定申告期限 (item 7), 法定納期限 (item 8), 課税期間 (item 9),
  or any later provisions of the Act.
* It does not decide whether a concrete tax is a national tax under this
  Act's item 1 beyond the enumerated kinds; the universe of kinds below is
  deliberately CLOSED to the levies this Act names in items 1–4 plus a
  single catch-all `.otherNationalTax`. Extending it is additive work,
  not a change of meaning.
* 国税徴収法、関税法、及び各個別税法は本モジュールの対象ではない。

Axiom discipline: theorems proved by `decide` over closed DecidableEq
instances and by `simp` over the definitions below (leftmost-literal normal
form is unnecessary here since all connectives are pure Bool). No `sorry`,
`admit`, or unverified axioms are used.
-/

namespace JapanTaxLaw

/-- Universe of tax kinds this module reasons about. CLOSED; only the
    kinds named in Act art. 2 items 1–4 plus an explicit catch-all for
    other national taxes appear. -/
inductive TaxKind where
  -- Act art. 2 item 1: explicitly excluded from 国税
  | customsDuty               -- 関税
  | tonZei                    -- とん税
  | specialTonZei             -- 特別とん税
  | forestEnvironmentZei      -- 森林環境税
  | specialCorporateBizZei    -- 特別法人事業税
  -- Act art. 2 item 2: 源泉徴収等による国税
  | withholdingIncomeTax               -- 源泉徴収に係る所得税
  | internationalTourismSpecialCollZei -- 特別徴収に係る国際観光旅客税
  -- Act art. 2 item 3: 消費税等
  | consumptionTax            -- 消費税
  | liquorTax                 -- 酒税
  | tobaccoTax                -- たばこ税
  | gasolineTax               -- 揮発油税
  | localGasolineTax          -- 地方揮発油税
  | petroleumGasTax           -- 石油ガス税
  | petroleumAndCoalTax       -- 石油石炭税
  -- Act art. 2 item 4: 附帯税
  | latePaymentTax            -- 延滞税
  | interestTax               -- 利子税
  | underDeclarationTax       -- 過少申告加算税
  | nonDeclarationTax         -- 無申告加算税
  | nonPaymentTax             -- 不納付加算税
  | heavyAdditionalTax        -- 重加算税
  -- catch-all: other national taxes named elsewhere (Act art. 2 item 1: "以外のもの")
  | otherNationalTax          -- その他の国税（本モジュールで列挙しない）
deriving DecidableEq, Repr

/-- Act art. 2 item 1: the exclusion list, as an indexed family. -/
inductive NationalTaxExcluded : TaxKind → Prop where
  | customsDuty : NationalTaxExcluded .customsDuty
  | tonZei : NationalTaxExcluded .tonZei
  | specialTonZei : NationalTaxExcluded .specialTonZei
  | forestEnvironmentZei : NationalTaxExcluded .forestEnvironmentZei
  | specialCorporateBizZei : NationalTaxExcluded .specialCorporateBizZei

instance : DecidablePred NationalTaxExcluded := fun
  | .customsDuty => isTrue .customsDuty
  | .tonZei => isTrue .tonZei
  | .specialTonZei => isTrue .specialTonZei
  | .forestEnvironmentZei => isTrue .forestEnvironmentZei
  | .specialCorporateBizZei => isTrue .specialCorporateBizZei
  | .withholdingIncomeTax => isFalse (by intro h; cases h)
  | .internationalTourismSpecialCollZei => isFalse (by intro h; cases h)
  | .consumptionTax => isFalse (by intro h; cases h)
  | .liquorTax => isFalse (by intro h; cases h)
  | .tobaccoTax => isFalse (by intro h; cases h)
  | .gasolineTax => isFalse (by intro h; cases h)
  | .localGasolineTax => isFalse (by intro h; cases h)
  | .petroleumGasTax => isFalse (by intro h; cases h)
  | .petroleumAndCoalTax => isFalse (by intro h; cases h)
  | .latePaymentTax => isFalse (by intro h; cases h)
  | .interestTax => isFalse (by intro h; cases h)
  | .underDeclarationTax => isFalse (by intro h; cases h)
  | .nonDeclarationTax => isFalse (by intro h; cases h)
  | .nonPaymentTax => isFalse (by intro h; cases h)
  | .heavyAdditionalTax => isFalse (by intro h; cases h)
  | .otherNationalTax => isFalse (by intro h; cases h)

/-- Act art. 2 item 1: 国税 — national-level imposition minus the five
    kinds the Act expressly excludes. -/
def isNationalTax (k : TaxKind) : Bool := decide (¬ NationalTaxExcluded k)

/-- Act art. 2 item 2: 源泉徴収等による国税 — false otherwise, with the
    expressive `false` covering the ancillary taxes (Act art. 2 item 4)
    attached to these two kinds (これらの税に係る附帯税を除く). -/
def isSourceCollectedNationalTax (k : TaxKind) : Bool :=
  match k with
  | .withholdingIncomeTax => true
  | .internationalTourismSpecialCollZei => true
  | _ => false

/-- Act art. 2 item 3: 消費税等 — exactly the seven enumerated kinds. -/
def isConsumptionTaxEtc (k : TaxKind) : Bool :=
  match k with
  | .consumptionTax | .liquorTax | .tobaccoTax | .gasolineTax
  | .localGasolineTax | .petroleumGasTax | .petroleumAndCoalTax => true
  | _ => false

/-- Act art. 2 item 4: 附帯税 — exactly the six enumerated kinds. -/
def isAncillaryTax (k : TaxKind) : Bool :=
  match k with
  | .latePaymentTax | .interestTax
  | .underDeclarationTax | .nonDeclarationTax | .nonPaymentTax | .heavyAdditionalTax => true
  | _ => false

/-- The two kinds in Act art. 2 item 2 are 国税 (they are not in the item 1
    exclusion list). Direct check. -/
theorem source_collected_are_national :
    isNationalTax .withholdingIncomeTax = true ∧
    isNationalTax .internationalTourismSpecialCollZei = true := by
  decide

/-- The whole exclusion list is exactly {customsDuty, tonZei, specialTonZei,
    forestEnvironmentZei, specialCorporateBizZei}. -/
theorem excluded_kinds_are_exactly_five :
    ∀ k : TaxKind, NationalTaxExcluded k ↔
      k = .customsDuty ∨ k = .tonZei ∨ k = .specialTonZei ∨
      k = .forestEnvironmentZei ∨ k = .specialCorporateBizZei := by
  intro k
  cases k <;> decide

/-- No excluded kind is a source-collected national tax (Act art. 2 item 2
    enumerates 所得税 and 国際観光旅客税; the item 1 exclusion list contains
    neither). -/
theorem excluded_are_not_source_collected :
    ∀ k : TaxKind, NationalTaxExcluded k → isSourceCollectedNationalTax k = false := by
  intro k h
  cases h <;> simp [isSourceCollectedNationalTax]

/-- No excluded kind is 附帯税 (Act art. 2 item 4 kinds are not in the item 1
    exclusion list). -/
theorem excluded_are_not_ancillary :
    ∀ k : TaxKind, NationalTaxExcluded k → isAncillaryTax k = false := by
  intro k h
  cases h <;> simp [isAncillaryTax]

/-- The sets {消費税等 (item 3)} and {附帯税 (item 4)} are universally disjoint. -/
theorem consumption_etc_disjoint_ancillary :
    ∀ k : TaxKind, ¬ (isConsumptionTaxEtc k = true ∧ isAncillaryTax k = true) := by
  intro k
  cases k <;> decide

/-- Every enumerated 消費税等 kind is a national tax (none is in the item 1
    exclusion list). -/
theorem consumption_etc_are_national :
    ∀ k : TaxKind, isConsumptionTaxEtc k = true → isNationalTax k = true := by
  intro k h
  revert h
  cases k <;> intro h <;> simp [isConsumptionTaxEtc, isNationalTax] at * <;> decide

/-- Every enumerated 附帯税 kind is a national tax (none is in the item 1
    exclusion list). -/
theorem ancillary_are_national :
    ∀ k : TaxKind, isAncillaryTax k = true → isNationalTax k = true := by
  intro k h
  revert h
  cases k <;> intro h <;> simp [isAncillaryTax, isNationalTax] at * <;> decide

/-- Source-collected national taxes are NOT 附帯税 (Act art. 2 item 2 excludes
    これらの税に係る附帯税). -/
theorem source_collected_not_ancillary :
    isAncillaryTax .withholdingIncomeTax = false ∧
    isAncillaryTax .internationalTourismSpecialCollZei = false := by
  decide

/-- Cardinality of the item-4 附帯税 list is exactly 6. -/
theorem ancillary_count :
    ([.latePaymentTax, .interestTax, .underDeclarationTax,
      .nonDeclarationTax, .nonPaymentTax, .heavyAdditionalTax].filter isAncillaryTax).length = 6 := by
  decide

/-- Cardinality of the item-3 消費税等 list is exactly 7. -/
theorem consumption_etc_count :
    ([.consumptionTax, .liquorTax, .tobaccoTax, .gasolineTax,
      .localGasolineTax, .petroleumGasTax, .petroleumAndCoalTax].filter isConsumptionTaxEtc).length = 7 := by
  decide

end JapanTaxLaw
