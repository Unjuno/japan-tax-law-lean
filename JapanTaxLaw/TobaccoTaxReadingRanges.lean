/-!
# TobaccoTaxReadingRanges — たばこ税の準用規定（読み替え範囲）

Pinned sources:
- data/raw/325AC0000000226_20261101_508AC0000000002.law.json
  suppl.art.12(10/12/14) 第四項から第八項まで … 道府県たばこ税 … 準用する
  suppl.art.20(10/12/14) 第四項から第八項まで … 市町村たばこ税 … 準用する
- data/raw/359AC0000000072 (art.52: 第二項から第七項まで; art.51: 第二項から第八項まで)

Eleven READING units. Each is a mutatis-mutandis rule "paragraphs lo..hi apply
to the preceding case". What is formalizable here is the RANGE of paragraphs
incorporated: 「第四項から第八項まで」 = [4,8], 「第二項から第七項まで」 = [2,7],
「第二項から第八項まで」 = [2,8]. Inclusive endpoints (から…まで).

Callers supply the paragraph number p as Nat. The substantive conditions of
those paragraphs are NOT MODELLED — only which paragraphs are incorporated.
-/
namespace JapanTaxLaw.TobaccoTaxReadingRanges

/-- 包含区間 [lo, hi] に段落 p が含まれるか（「lo から hi まで」）。 -/
def inRange (lo hi p : Nat) : Bool := decide (lo <= p ∧ p <= hi)

-- ── 道府県たばこ税 art.12: [4,8] ─────────────────────────────────────
namespace Pref

def applies (p : Nat) : Bool := inRange 4 8 p

theorem at_lo : applies 4 = true := by decide
theorem at_hi : applies 8 = true := by decide
theorem below_lo : applies 3 = false := by decide
theorem above_hi : applies 9 = false := by decide

end Pref

-- ── 市町村たばこ税 art.20: [4,8] ─────────────────────────────────────
namespace City

def applies (p : Nat) : Bool := inRange 4 8 p

theorem at_lo : applies 4 = true := by decide
theorem at_hi : applies 8 = true := by decide

end City

-- ── たばこ税 art.52: [2,7] ───────────────────────────────────────────
namespace Art52

def applies (p : Nat) : Bool := inRange 2 7 p

theorem at_lo : applies 2 = true := by decide
theorem at_hi : applies 7 = true := by decide
theorem above_hi : applies 8 = false := by decide

end Art52

-- ── たばこ税 art.51: [2,8] ───────────────────────────────────────────
namespace Art51

def applies (p : Nat) : Bool := inRange 2 8 p

theorem at_lo : applies 2 = true := by decide
theorem at_hi : applies 8 = true := by decide

end Art51

-- ── 区間の性質（全称 p） ──────────────────────────────────────────────
theorem range_iff (lo hi p : Nat) : inRange lo hi p = true ↔ lo <= p ∧ p <= hi := by
  simp [inRange]

theorem range_mono (lo hi lo' hi' p : Nat) (hl : lo' <= lo) (hh : hi <= hi')
    (h : inRange lo hi p = true) : inRange lo' hi' p = true := by
  simp [inRange] at h ⊢
  omega

-- 道府県と市町村の範囲は同一（横断的関係）
theorem pref_eq_city (p : Nat) : Pref.applies p = City.applies p := by rfl

-- art.52 [2,7] は art.51 [2,8] に包含される
theorem art52_subset_art51 (p : Nat) (h : Art52.applies p = true) :
    Art51.applies p = true := by
  exact range_mono 2 7 2 8 p (by omega) (by omega) h

-- [4,8] と [2,7] の重複は [4,7]（重複・優先関係の整理）
theorem overlap_pref_art52 (p : Nat) :
    (Pref.applies p = true ∧ Art52.applies p = true) ↔ inRange 4 7 p = true := by
  simp [Pref.applies, Art52.applies, inRange]
  omega

end JapanTaxLaw.TobaccoTaxReadingRanges
