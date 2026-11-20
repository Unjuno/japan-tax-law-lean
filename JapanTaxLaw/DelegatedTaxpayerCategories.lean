/-!
# DelegatedTaxpayerCategories — 325AC0000000226（寡婦・ひとり親の委任）

Pinned source: data/raw/325AC0000000226_20261101_508AC0000000002.law.json

Four dependency-ready DELEGATION units, in two parallel tables:

* 道府県民税 art.37(1) table:
  （３）寡婦又はひとり親で政令で定めるものである所得割の納税義務者
  （４）ひとり親で政令で定めるものである所得割の納税義務者
* 市町村民税 art.314の6(1) table: identical wording （３）／（４）.

「政令で定める」is a DELEGATION: the cabinet-order determination is NOT
MODELLED; it is supplied by the caller as an opaque `delegate : Nat -> Bool`.
Likewise widow/single-parent status is caller-supplied. What IS proved here is
the *logical structure* of the two categories: (4) narrows (3), (3) decomposes
into widow-only-or-(4), and the two articles' categories are extensionally
identical (cross-law relation). No legal adequacy is claimed.
-/
namespace JapanTaxLaw.DelegatedTaxpayerCategories

/-- 呼出側が与える政令決定（内容は NOT MODELLED）。 -/
def Delegate := Nat → Bool
/-- 寡婦／ひとり親の区分（呼出側が与える、NOT MODELLED）。 -/
def Widow := Nat → Bool
def SingleParent := Nat → Bool

-- ── 道府県民税 art.37 ───────────────────────────────────────────────
namespace D

/-- （３）寡婦又はひとり親で政令で定めるもの。 -/
def cat3 (w : Widow) (s : SingleParent) (g : Delegate) (t : Nat) : Bool :=
  (w t || s t) && g t

/-- （４）ひとり親で政令で定めるもの。 -/
def cat4 (s : SingleParent) (g : Delegate) (t : Nat) : Bool :=
  s t && g t

theorem cat4_implies_cat3 (w : Widow) (s : SingleParent) (g : Delegate) (t : Nat) :
    cat4 s g t = true → cat3 w s g t = true := by
  intro h
  simp [cat3, cat4] at h ⊢
  exact ⟨Or.inr h.1, h.2⟩

theorem cat3_split (w : Widow) (s : SingleParent) (g : Delegate) (t : Nat) :
    cat3 w s g t = true ↔ (w t && g t) = true ∨ cat4 s g t = true := by
  by_cases hw : w t = true <;>
  by_cases hs : s t = true <;>
  by_cases hg : g t = true <;>
  simp [cat3, cat4, hw, hs, hg]

end D

-- ── 市町村民税 art.314の6 ────────────────────────────────────────────
namespace C

def cat3 (w : Widow) (s : SingleParent) (g : Delegate) (t : Nat) : Bool :=
  (w t || s t) && g t

def cat4 (s : SingleParent) (g : Delegate) (t : Nat) : Bool :=
  s t && g t

theorem cat4_implies_cat3 (w : Widow) (s : SingleParent) (g : Delegate) (t : Nat) :
    cat4 s g t = true → cat3 w s g t = true := by
  intro h
  simp [cat3, cat4] at h ⊢
  exact ⟨Or.inr h.1, h.2⟩

theorem cat3_split (w : Widow) (s : SingleParent) (g : Delegate) (t : Nat) :
    cat3 w s g t = true ↔ (w t && g t) = true ∨ cat4 s g t = true := by
  by_cases hw : w t = true <;>
  by_cases hs : s t = true <;>
  by_cases hg : g t = true <;>
  simp [cat3, cat4, hw, hs, hg]

end C

-- ── 法令横断の関係（同一文言 → 拡張的に同一） ─────────────────────────
theorem cross_law_cat3 (w : Widow) (s : SingleParent) (g : Delegate) (t : Nat) :
    D.cat3 w s g t = C.cat3 w s g t := by rfl

theorem cross_law_cat4 (s : SingleParent) (g : Delegate) (t : Nat) :
    D.cat4 s g t = C.cat4 s g t := by rfl

/-- 二条文の（４）は（３）の部分集合（優先関係・重複の整理）。 -/
theorem narrowing_both (w : Widow) (s : SingleParent) (g : Delegate) (t : Nat) :
    D.cat4 s g t = true → C.cat3 w s g t = true ∧ D.cat3 w s g t = true := by
  intro h
  exact ⟨C.cat4_implies_cat3 w s g t h, D.cat4_implies_cat3 w s g t h⟩

end JapanTaxLaw.DelegatedTaxpayerCategories
