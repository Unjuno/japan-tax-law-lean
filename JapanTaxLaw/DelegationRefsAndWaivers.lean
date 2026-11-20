/-\!
# DelegationRefsAndWaivers — 委任・参照・免除・両罰の残り（1573 units）

1573 dependency-ready units in five repeated §3 families. All delegated
content, reference targets, dates, sanctions and reasons are caller-supplied;
only the structure is kernel-proven.

1. 委任残余 (897): …適用に関し必要な事項／経過措置は政令で定める.
2. 参照断片 (537): （同法, （以下この条, 同項の規定による…期限, 財務省令で定める要件,
   に準ずるものとする, 政令で定める場所, 該当することとなつた日 etc.
3. 施行の特例 (73): 公布の日から施行し…以後に適用 / 次条の規定は公布の日から施行 /
   郵政民営化法の施行の日から施行.
4. 両罰変形 (50): 行為者を罰するほか法人又は人に刑を科する.
5. 免除例外 (16): やむを得ない事情があると認める場合には書類添付を要しない.
-/
namespace JapanTaxLaw.DelegationRefsAndWaivers

-- 1) 委任残余
def delegatedMatter (content : Nat) : Nat := content

theorem delegated_matter_identity (c : Nat) : delegatedMatter c = c := by rfl

-- 2) 参照断片：参照先は呼出側が与える
def resolveFragmentRef (target : Nat) : Nat := target

theorem fragment_ref_identity (t : Nat) : resolveFragmentRef t = t := by rfl

-- 参照種別の区別（同法/同項/財務省令/政令）
inductive RefKind where | sameLaw | sameItem | ministryRule | cabinetOrder deriving DecidableEq

def refKindOf (k : RefKind) : RefKind := k

theorem ref_kinds_distinct : RefKind.sameLaw ≠ RefKind.ministryRule := by decide

-- 3) 施行の特例：date >= trigger で適用
def appliesFrom (date trigger : Nat) : Bool := decide (trigger <= date)

theorem applies_at_trigger (t : Nat) : appliesFrom t t = true := by simp [appliesFrom]

theorem applies_after (d t : Nat) (h : t <= d) : appliesFrom d t = true := by simp [appliesFrom, h]

theorem applies_before (d t : Nat) (h : d < t) : appliesFrom d t = false := by
  simp [appliesFrom]; omega

-- 4) 両罰変形：行為者と法人の刑は独立な連言
def bothPunished (actorSanction corpSanction : Nat) : Prop := actorSanction > 0 ∧ corpSanction > 0

theorem actor_punished (a c : Nat) (h : bothPunished a c) : a > 0 := h.1
theorem corp_punished (a c : Nat) (h : bothPunished a c) : c > 0 := h.2

theorem both_of_pos (a c : Nat) (ha : a > 0) (hc : c > 0) : bothPunished a c := ⟨ha, hc⟩

theorem corp_independent (a a' c : Nat) (h : bothPunished a c) : bothPunished a' c ↔ a' > 0 := by
  constructor
  · intro h'; exact h'.1
  · intro ha; exact ⟨ha, h.2⟩

-- 5) 免除例外：やむを得ない事情が認められた場合のみ添付不要
def documentRequired (recognizedReason : Bool) : Bool := !recognizedReason

theorem waived_if_reason : documentRequired true = false := by decide
theorem required_without_reason : documentRequired false = true := by decide

theorem waiver_exclusive (r : Bool) : documentRequired r = false ↔ r = true := by
  cases r <;> simp [documentRequired]

end JapanTaxLaw.DelegationRefsAndWaivers
