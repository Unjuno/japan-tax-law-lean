/-!
# ReadingReplacements — 表による字句の読み替え（249 units）

249 units in 82 verbatim variants:
「この場合において、次の表の上欄に掲げる規定中同表の中欄に掲げる字句は、
（それぞれ）同表の下欄に掲げる字句とする／読み替えるものとする。」

§3 structure (READING): for a listed provision, replace the text in the middle
column with the text in the lower column; unlisted provisions are unchanged.
Formalized with Nat-encoded tokens:
  substitute x src dst = dst if x = src else x
  applyTable i n froms tos x = substitute x (froms i) (tos i) if i < n else x
Kernel proofs: matched replacement, unaffected tokens, identity outside the
table, and wording-family identity. The actual words, formulas and provisions
are NOT MODELLED.
-/
namespace JapanTaxLaw.ReadingReplacements

def substitute (x src dst : Nat) : Nat := if x == src then dst else x

theorem substitute_matched (src dst : Nat) : substitute src src dst = dst := by
  simp [substitute]

theorem substitute_unaffected (x src dst : Nat) (h : x ≠ src) : substitute x src dst = x := by
  simp [substitute, h]

theorem substitute_id_when_same (x v : Nat) : substitute x v v = x := by
  by_cases h : x == v
  · have heq : x = v := by simpa using h
    simp [substitute, h, heq]
  · simp [substitute, h]

def applyTable (i n : Nat) (froms tos : Nat → Nat) (x : Nat) : Nat :=
  if i < n then substitute x (froms i) (tos i) else x

theorem listed_replaces (i n : Nat) (froms tos : Nat → Nat) (x : Nat) (h : i < n) :
    applyTable i n froms tos x = substitute x (froms i) (tos i) := by
  simp [applyTable, h]

theorem unlisted_unchanged (i n : Nat) (froms tos : Nat → Nat) (x : Nat) (h : n <= i) :
    applyTable i n froms tos x = x := by
  have hn : ¬ i < n := by omega
  simp [applyTable, hn]

theorem replace_preserves_others (i n : Nat) (froms tos : Nat → Nat) (x : Nat)
    (h : i < n) (hx : x ≠ froms i) : applyTable i n froms tos x = x := by
  simp [applyTable, h, substitute, hx]

/- 「とする」と「読み替えるものとする」は同じ置換構造。 -/
namespace Toshite
def apply := @applyTable
end Toshite
namespace Yomikaeru
def apply := @applyTable
end Yomikaeru

theorem wording_families_identical (i n : Nat) (froms tos : Nat → Nat) (x : Nat) :
    Toshite.apply i n froms tos x = Yomikaeru.apply i n froms tos x := by rfl

end JapanTaxLaw.ReadingReplacements
