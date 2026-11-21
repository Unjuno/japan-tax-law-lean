import JapanTaxLaw.TaxFinance

/-
# TwoThirdsMembershipThreshold — 酒税の保全及び酒類業組合等に関する法律 第八十条

Pinned source:
  Law id: 328AC0000000007
  Official title: 酒税の保全及び酒類業組合等に関する法律
  Law type: Act (法律)
  Revision: 328AC0000000007_20250601_504AC0000000068
  Raw snapshot: data/raw/328AC0000000007_20250601_504AC0000000068.law.json
  sha256: 0ef7ec85253d46a1c0fb505342fbf16e0b5a10b18fa0911766211b4ad1695699
  Statutory article: 第八十条 (art. 80)

原文逐語（pinned, 一字一句改変なし）:
  「酒造組合中央会及び酒販組合中央会（以下「中央会」と総称する。）は、その会員の総数が前三項の規定により会員たる資格を有する連合会及び酒類業組合の三分の二以上でなければ、設立することができない。」

Variable contract:
  `members : Nat` = 会員の総数 (total number of members), unit 個.
  `qualified : Nat` = 前三項の規定により会員たる資格を有する連合会及び酒類業組合
                     (number of qualified federations and liquor-industry associations), unit 個.
  Both are Nat: non-negative integer counts of organizations.
  `canEstablish members qualified = true` iff members >= (2/3) * qualified.
  Implemented by exact integer cross-multiplication `3 * members >= 2 * qualified`:
  no Nat division and no rounding, and 「以上」 is inclusive (>=), so exactly
  two-thirds (e.g. 2 of 3) satisfies the condition.

Scope: ONLY the explicit numeric two-thirds establishment condition is modelled.
  The definition of 会員たる資格 in the preceding three paragraphs, the identity of
  the 中央会, all other articles and all operational/enforcement rules are NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.TwoThirdsMembershipThreshold

/-- 「会員の総数が…三分の二以上」: members is at least two-thirds of qualified.
    Exact cross-multiplication avoids Nat division/rounding; 以上 is inclusive. -/
def canEstablish (members qualified : Nat) : Bool :=
  decide (3 * members >= 2 * qualified)

/-- Exactly two-thirds (2 of 3) satisfies 以上 (inclusive). -/
theorem two_of_three_true : canEstablish 2 3 = true := by
  unfold canEstablish
  decide

/-- One of three is below two-thirds: the condition fails. -/
theorem one_of_three_false : canEstablish 1 3 = false := by
  unfold canEstablish
  decide

/-- Zero members can never reach two-thirds while any qualification exists. -/
theorem zero_members_false (qualified : Nat) (hq : 0 < qualified) :
    canEstablish 0 qualified = false := by
  unfold canEstablish
  simp
  omega

/-- No qualified associations: the requirement is vacuous (0 >= 0). -/
theorem zero_qualified_true (members : Nat) : canEstablish members 0 = true := by
  unfold canEstablish
  simp

/-- Monotone in members: adding members never breaks an already-true condition. -/
theorem monotone_members {members members' qualified : Nat}
    (h : canEstablish members qualified = true) (hle : members ≤ members') :
    canEstablish members' qualified = true := by
  unfold canEstablish at h ⊢
  apply decide_eq_true
  have hp : 3 * members >= 2 * qualified := of_decide_eq_true h
  omega

end JapanTaxLaw.TwoThirdsMembershipThreshold
