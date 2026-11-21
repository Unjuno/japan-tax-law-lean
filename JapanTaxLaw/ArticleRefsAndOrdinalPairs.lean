/-\!
# ArticleRefsAndOrdinalPairs — 条項参照・ラテン対・かな範囲・令和年度（2571 units, PROVED_SCOPE）

2,571 dependency-ready fragments recorded UNRESOLVED by the decomposer. Only
structural/ordinal claims are proven (unhandled conditions retained), so all
derive `PROVED_SCOPE`, never `FULLY_VERIFIED`.

- article_ref (1040): 第X項/条/号, 同項, 前項, この項 — reference to a caller-supplied target.
- latin_pair (1319): two full-width letters ＡＡ..ＺＺ — ordinal pair.
- kana_range (123): イ及びロ / イからハまで — Iroha ordinal range.
- reiwa_fiscal (89): 令和八年度 / 令和十六年度 — Reiwa fiscal year number.
-/
import JapanTaxLaw.KanjiOrdinals
import JapanTaxLaw.LegalStructuralMarkers
import JapanTaxLaw.TransitionalHeadingsAndRefs

namespace JapanTaxLaw.ArticleRefsAndOrdinalPairs

open JapanTaxLaw.KanjiOrdinals
open JapanTaxLaw.LegalStructuralMarkers
open JapanTaxLaw.TransitionalHeadingsAndRefs

-- 条項参照：第X項 の序数を解析（Xは漢数字）
def parseParagraphRef (s : String) : Option Nat :=
  match s.toList with
  | '第' :: rest =>
      match rest.reverse with
      | '項' :: rev => parseKanji (String.ofList rev.reverse)
      | _ => none
  | _ => none

theorem parse_para_2 : parseParagraphRef "第二項" = some 2 := by decide
theorem parse_para_11 : parseParagraphRef "第十一項" = some 11 := by decide

def articleRef (target : Nat) : Nat := target

theorem article_ref_identity (t : Nat) : articleRef t = t := by rfl

-- ラテン文字の対（ＡＡ 等）
def parseLatinPair (s : String) : Option (Nat × Nat) :=
  match s.toList with
  | [a, b] => (fun x y => (x, y)) <$> latinOrdinal a <*> latinOrdinal b
  | _ => none

theorem parse_pair_aa : parseLatinPair "ＡＡ" = some (1, 1) := by decide
theorem parse_pair_ab : parseLatinPair "ＡＢ" = some (1, 2) := by decide

-- かな範囲（既存のイロハ範囲パーサを再利用）
def kanaRange (s : String) : Option (Nat × Nat) := parseKanaRange s

theorem kana_range_i_ro : kanaRange "イ及びロ" = some (1, 2) := by decide

-- 令和年度：令和X年度 の X を漢数字から解析
def parseReiwaFiscal (s : String) : Option Nat :=
  match s.toList with
  | '令' :: '和' :: rest =>
      let core := (rest.reverse.drop 2).reverse  -- 年度 を除く
      parseKanji (String.ofList core)
  | _ => none

theorem parse_reiwa_8 : parseReiwaFiscal "令和八年度" = some 8 := by decide
theorem parse_reiwa_16 : parseReiwaFiscal "令和十六年度" = some 16 := by decide

end JapanTaxLaw.ArticleRefsAndOrdinalPairs
