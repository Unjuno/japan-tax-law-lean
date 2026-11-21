import JapanTaxLaw.ArticleRefsAndOrdinalPairs
import JapanTaxLaw.ArticleRefsAndOrdinalPairsSpec

/-!
# ArticleRefsAndOrdinalPairsTests — 参照・序数対・範囲・年度
-/
namespace JapanTaxLaw.ArticleRefsAndOrdinalPairsTests

open JapanTaxLaw.ArticleRefsAndOrdinalPairs

theorem ref_spec (t : Nat) :
    articleRef t = JapanTaxLaw.ArticleRefsAndOrdinalPairsSpec.refSpec t := by rfl

theorem pair_spec (a b : Nat) :
    (a, b) = JapanTaxLaw.ArticleRefsAndOrdinalPairsSpec.pairSpec a b := by rfl

theorem reiwa_spec (y : Nat) :
    y = JapanTaxLaw.ArticleRefsAndOrdinalPairsSpec.reiwaSpec y := by rfl

example : parseParagraphRef "第二項" = some 2 := parse_para_2
example : parseParagraphRef "第十一項" = some 11 := parse_para_11
example (t : Nat) : articleRef t = t := article_ref_identity t
example : parseLatinPair "ＡＡ" = some (1, 1) := parse_pair_aa
example : parseLatinPair "ＡＢ" = some (1, 2) := parse_pair_ab
example : kanaRange "イ及びロ" = some (1, 2) := kana_range_i_ro
example : parseReiwaFiscal "令和八年度" = some 8 := parse_reiwa_8
example : parseReiwaFiscal "令和十六年度" = some 16 := parse_reiwa_16

end JapanTaxLaw.ArticleRefsAndOrdinalPairsTests
