/-!
# RegistrationJointRequest — 322CO0000000109 art.3（同一嘱託書による登記嘱託）

Sources (pinned):

  Law id: 322CO0000000109
  Revision: 322CO0000000109_19470627_000000000000000
  Raw snapshot: data/raw/322CO0000000109_19470627_000000000000000.law.json
  sha256(raw): 9ff39f03e58b315d04fbb65246dd5a4e64cf8c6a428eae84c53bb49c530816ec
  source_path: LawBody[1]/MainProvision/MainProvision[2]/Article:3/Article#3/Paragraph#1/ParagraphSentence/Sentence

  原文（一字一句、87文字、pinned raw から独立抽出して照合済み）:

  「前二条の場合において同一の登記所の管轄内に在る二箇以上の不動産につき登記を嘱託するには、登記原因又は登記の目的が同一でなくても、同一の嘱託書でその登記を嘱託することができる。」

  規範単位（CONDITION + EFFECT）:
    - 適用条件1: 前二条の場合           → priorCase
    - 適用条件2: 同一の登記所の管轄内   → sameRegistry
    - 適用条件3: 二箇以上の不動産       → minProperties ≤ propertyCount
    - 例外の不適用: 登記原因・登記の目的が同一でなくても（障壁にならない）
                                        → causesOrPurposeDiffer は判定に使わない
    - 法的効果: 同一の嘱託書で嘱託することができる → 結果 true（許可）

Scope & honest boundaries:
  - 「前二条の場合」「同一の登記所の管轄内」「不動産の数」「登記原因・目的の異同」は
    すべて caller-established な入力（caller が原文該当性を確定する）。
  - 前二条の具体的要件、登記所の管轄境界、嘱託書の記載事項・提出手続は NOT MODELLED。
  - 本モデルは当該一文の規範単位のみを対象とし、条全体の完成を主張しない。
-/
namespace JapanTaxLaw.RegistrationJointRequest

/-- 原文「二箇以上」。不動産の数の下限（個）。 -/
def minProperties : Nat := 2

/-- 原文の規範単位を判定する実装。
    `causesOrPurposeDiffer` は「登記原因又は登記の目的が同一でなくても」を表し、
    許可判定に影響しない（例外として扱わない）。 -/
def mayUseSingleRequest (priorCase : Bool) (sameRegistry : Bool)
    (propertyCount : Nat) (_causesOrPurposeDiffer : Bool) : Bool :=
  priorCase && sameRegistry && decide (minProperties <= propertyCount)

theorem minProperties_pos : 0 < minProperties := by decide

/-- 境界: 二箇（原文下限）で、原因・目的が異なっても許可。 -/
theorem permits_at_threshold_with_differing_causes :
    mayUseSingleRequest true true 2 true = true := by decide

/-- 境界: 一箇（下限未満）は不許可。 -/
theorem rejects_below_threshold :
    mayUseSingleRequest true true 1 false = false := by decide

/-- 境界: 零箇は不許可。 -/
theorem rejects_zero_properties :
    mayUseSingleRequest true true 0 false = false := by decide

/-- 異なる登記所の管轄は不許可。 -/
theorem rejects_different_registry :
    mayUseSingleRequest true false 3 false = false := by decide

/-- 前二条の場合でないときは不許可。 -/
theorem rejects_outside_prior_two_articles :
    mayUseSingleRequest false true 3 false = false := by decide

/-- 原因・目的の異同に判定は依存しない（原文「同一でなくても」）。 -/
theorem independent_of_causes_or_purpose (p s : Bool) (n : Nat) (d : Bool) :
    mayUseSingleRequest p s n d = mayUseSingleRequest p s n false := by
  cases d <;> rfl

/-- 数が下限以上なら許可（一般命題、有限検査ではない）。 -/
theorem threshold_sufficient {p s c : Bool} {n : Nat} (h : minProperties <= n)
    (hp : p = true) (hs : s = true) :
    mayUseSingleRequest p s n c = true := by
  simp [mayUseSingleRequest, hp, hs, h]

/-- 許可されるなら必ず二箇以上（必要条件、一般命題）。 -/
theorem threshold_necessary {p s c : Bool} {n : Nat}
    (h : mayUseSingleRequest p s n c = true) : minProperties <= n := by
  by_cases hp : p = true <;> by_cases hs : s = true
  · simp [mayUseSingleRequest, hp, hs] at h
    exact h
  · simp [mayUseSingleRequest, hp, hs] at h
  · simp [mayUseSingleRequest, hp, hs] at h
  · simp [mayUseSingleRequest, hp, hs] at h

end JapanTaxLaw.RegistrationJointRequest
