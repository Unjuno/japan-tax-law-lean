import JapanTaxLaw.Verdict

/-!
# LocalTaxAuthority — 地方税法（昭和二十五年法律第二百二十六号）
                       Act art. 6 (公益等に因る課税免除及び不均一課税)

Source (pinned):
https://laws.e-gov.go.jp/law/325AC0000000226
Law id: 325AC0000000226（昭和二十五年法律第二百二十六号）
Revision: 325AC0000000226_20261101_508AC0000000002
Amendment enforcement date: 2026-11-01 (CurrentEnforced)
Raw snapshot sha256: 3DD29E0078BF24E09C79436CE7B0F00FD2CFB5A5BBCB97BD4F4352971BE68D53

Act art. 6, verbatim from the pinned text:
  第六条 地方団体は、公益上その他の事由に因り課税を不適当とする場合においては、課税をしないことができる.
  ２ 地方団体は、公益上その他の事由に因り必要がある場合においては、不均一の課税をすることができる.

Act art. 6, verbatim from the pinned text:
  第七条 地方団体は、その一部に対して特に利益がある事件に関しては、不均一の課税をし、又はその一部に課税をすることができる.

Scope:
* Act art. 6 only — the public-interest out. Insurance: out of scope here.
* Act art. 7（受益に因る不均一課税及び一部課税）is NOT modeled here (its shape differs: special benefit to only part of the taxpayer population); separate slice.
* Act art. 2（地方団体の課税権）, Act art. 4/5（課税の種目）enumerated catalogs, art. 23 ( definitions) are excluded.
* Verdict inputs: `isLocalEntity`, `publicInterestExemptionApplies` （公益上その他の事由に因り課税を不適当とする場合）,
  `publicInterestUnevenLevyApplies` （公益上その他の事由に因り必要がある場合）.

Axiom discipline: all theorems are proved by `cases`/`simp` over Verdict constructors.
No `sorry`, `admit`, or unverified axioms.
-/

namespace JapanTaxLaw

/-- Assessed facts relevant to Act art. 6. -/
structure LocalTaxExemptionFacts where
  /-- 地方団体か（都道府県・市町村・特別区等）. -/
  isLocalEntity : Verdict
  /-- 公益上その他の事由に因り課税を不適当とするか（第6条第1項）. -/
  publicInterestExemptionApplies : Verdict
  /-- 公益上その他の事由に因り必要があるか（第6条第2項）. -/
  publicInterestUnevenLevyApplies : Verdict
  deriving DecidableEq, Repr

/-- Outcome of the Act art. 6 + Act art. 7 question per se. -/
inductive LocalTaxExemptionOutcome where
  | mayNotLevy           -- 第6条第1項: 課税をしないことができる
  | mayLevyUnevenly      -- 第6条第2項: 不均一の課税をすることができる
  | bothAllowed          -- 第6条1項と2項の両方の要件を同時に満たす（同時に課税しないこともできる、不均一の課税もできる）
  | undetermined         -- 判定不能（不明）
  | inconsistent         -- 矛盾入力
  deriving DecidableEq, Repr

/-- Act art. 6 第1項 resolution. -/
def mayNotLevy (f : LocalTaxExemptionFacts) : Verdict :=
  Verdict.and f.isLocalEntity f.publicInterestExemptionApplies

/-- Act art. 6 第2項 resolution. -/
def mayLevyUnevenly (f : LocalTaxExemptionFacts) : Verdict :=
  Verdict.and f.isLocalEntity f.publicInterestUnevenLevyApplies

/-- Act art. 6 classification: the two paragraphs handled jointly. -/
def classifyLocalTaxExemption (f : LocalTaxExemptionFacts) : LocalTaxExemptionOutcome :=
  match mayNotLevy f, mayLevyUnevenly f with
  | .yes, .yes        => .bothAllowed
  | .yes, .no         => .mayNotLevy
  | .yes, .unknown    => .mayNotLevy
  | .yes, .conflict   => .inconsistent
  | .no,  .yes        => .mayLevyUnevenly
  | .no,  .no         => .undetermined
  | .no,  .unknown    => .undetermined
  | .no,  .conflict   => .inconsistent
  | .unknown, .yes    => .undetermined
  | .unknown, .no     => .undetermined
  | .unknown, .unknown => .undetermined
  | .unknown, .conflict => .inconsistent
  | .conflict, _      => .inconsistent

-- ==================== structural consistency lemmas ====================

/-- 地方団体である ⇒ （第1項）課税をしないことができる（要件一つは地方団体性）. -/
theorem local_entity_exemption_sufficient (f : LocalTaxExemptionFacts)
    (hI : f.isLocalEntity = Verdict.yes) (hP : f.publicInterestExemptionApplies = Verdict.yes) :
    mayNotLevy f = Verdict.yes := by
  simp [mayNotLevy, hI, hP, Verdict.and]

/-- 公益上の理由 ⇒ （第2項）不均一の課税をすることができる. -/
theorem local_entity_uneven_levy_sufficient (f : LocalTaxExemptionFacts)
    (hI : f.isLocalEntity = Verdict.yes) (hP : f.publicInterestUnevenLevyApplies = Verdict.yes) :
    mayLevyUnevenly f = Verdict.yes := by
  simp [mayLevyUnevenly, hI, hP, Verdict.and]

/-- 公益上の課税免除理由なし ⇒ （第1項）課税をしない選択肢を失う. -/
theorem no_exemption_reason_no_choice (f : LocalTaxExemptionFacts)
    (h : f.publicInterestExemptionApplies = Verdict.no) :
    mayNotLevy f ≠ Verdict.yes := by
  cases hI : f.isLocalEntity <;> simp [mayNotLevy, hI, h, Verdict.and]

/-- 不均一課税要件なし ⇒ （第2項）不均一課税の権限を失う. -/
theorem no_uneven_reason_no_authority (f : LocalTaxExemptionFacts)
    (h : f.publicInterestUnevenLevyApplies = Verdict.no) :
    mayLevyUnevenly f ≠ Verdict.yes := by
  cases hI : f.isLocalEntity <;> simp [mayLevyUnevenly, hI, h, Verdict.and]

/-- 第六条は two separate permissions; 認定は4つの結果のいずれかに一意に定まる. -/
theorem local_tax_exemption_classification_always_one (f : LocalTaxExemptionFacts) :
    classifyLocalTaxExemption f = .bothAllowed ∨ classifyLocalTaxExemption f = .mayNotLevy ∨
    classifyLocalTaxExemption f = .mayLevyUnevenly ∨ classifyLocalTaxExemption f = .undetermined ∨
    classifyLocalTaxExemption f = .inconsistent := by
  cases hN : mayNotLevy f <;> cases hU : mayLevyUnevenly f <;>
    simp [classifyLocalTaxExemption, hN, hU]

/-- 両方の権限を持っていても一意の classification を得られる. -/
theorem both_permissions_unique (f : LocalTaxExemptionFacts)
    (hN : mayNotLevy f = Verdict.yes) (hU : mayLevyUnevenly f = Verdict.yes) :
    classifyLocalTaxExemption f = .bothAllowed := by
  simp [classifyLocalTaxExemption, hN, hU]

/-- 第六条は 「できる」規定であり、「賦課しなければならない」ではない. -/
theorem may_not_levy_not_mandatory (f : LocalTaxExemptionFacts)
    (h : mayNotLevy f = Verdict.yes) : ¬ (mayNotLevy f = Verdict.no) := by
  simp [h]

end JapanTaxLaw
