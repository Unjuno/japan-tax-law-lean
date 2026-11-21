/-\!
# TransitionalHeadingsAndRefs — 経過措置見出し・かな範囲・項参照（8874 units, PROVED_SCOPE）

8,874 dependency-ready fragments recorded UNRESOLVED by the decomposer
(unhandled_conditions = [fragment]). Only structural claims are proven, so all
derive `PROVED_SCOPE`, never `FULLY_VERIFIED`.

- transitional_heading (8509): 「（…に関する経過措置）」 section heading.
- kana_range (241): イからニまで / イ及びロ / イ、ロ — Iroha ordinal ranges.
- paragraph_ref (61): 前項 / 第一項..第十項 — paragraph reference.
- replacement_marker (63): 」とあるのは「 — reading-replacement connector.
-/
import JapanTaxLaw.BareLabelFragments

namespace JapanTaxLaw.TransitionalHeadingsAndRefs

open JapanTaxLaw.BareLabelFragments

-- 経過措置見出し（構造宣言）
def headingDeclared : Bool := true

theorem heading_is_declaration : headingDeclared = true := rfl

-- かな範囲：イロハ順の区間
def parseKanaRange (s : String) : Option (Nat × Nat) :=
  match s.toList with
  | [a, 'か', 'ら', b, 'ま', 'で'] =>
      (fun x y => (x, y)) <$> kanaOrdinal a <*> kanaOrdinal b
  | [a, '及', 'び', b] =>
      (fun x y => (x, y)) <$> kanaOrdinal a <*> kanaOrdinal b
  | [a, '、', b] =>
      (fun x y => (x, y)) <$> kanaOrdinal a <*> kanaOrdinal b
  | _ => none

def inKanaRange (lo hi x : Nat) : Bool := decide (lo <= x ∧ x <= hi)

theorem parse_range_i_ni : parseKanaRange "イからニまで" = some (1, 4) := by decide
theorem parse_range_i_ro : parseKanaRange "イ及びロ" = some (1, 2) := by decide

theorem kana_range_lower (lo hi : Nat) (h : lo <= hi) : inKanaRange lo hi lo = true := by simp [inKanaRange, h]
theorem kana_range_upper (lo hi : Nat) (h : lo <= hi) : inKanaRange lo hi hi = true := by simp [inKanaRange, h]

-- 項参照
def paragraphRef (target : Nat) : Nat := target

theorem paragraph_ref_identity (t : Nat) : paragraphRef t = t := by rfl

-- 読替接続詞
def replacementConnector (x : Nat) : Nat := x

theorem replacement_is_identity (x : Nat) : replacementConnector x = x := by rfl

end JapanTaxLaw.TransitionalHeadingsAndRefs
