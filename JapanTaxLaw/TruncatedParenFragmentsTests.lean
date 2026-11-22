import JapanTaxLaw.TruncatedParenFragments
import JapanTaxLaw.TruncatedParenFragmentsSpec

/-!
# TruncatedParenFragmentsTests — 全variantの括弧開始構造をカーネル検証

These units remain PROVED_SCOPE: only the opening-parenthesis structure is proven,
the substantive norm is NOT MODELLED.
-/
namespace JapanTaxLaw.TruncatedParenFragmentsTests
open JapanTaxLaw.TruncatedParenFragments

theorem spec_agreement (s : String) :
    startsWithParen s = JapanTaxLaw.TruncatedParenFragmentsSpec.startsWithParenSpec s := by
  unfold startsWithParen JapanTaxLaw.TruncatedParenFragmentsSpec.startsWithParenSpec
  cases h : (s.toList.head? == some '（') <;> simp [h]

example : startsWithParen "（" = true := by native_decide
example : startsWithParen "（この項" = true := by native_decide
example : startsWithParen "（これらの" = true := by native_decide
example : startsWithParen "（不納" = true := by native_decide
example : startsWithParen "（同月" = true := by native_decide
example : startsWithParen "（同項" = true := by native_decide
example : startsWithParen "（同項の" = true := by native_decide
example : startsWithParen "（地域経済" = true := by native_decide
example : startsWithParen "（地方税法" = true := by native_decide
example : startsWithParen "（当該" = true := by native_decide
example : startsWithParen "（恒久的施設" = true := by native_decide
example : startsWithParen "（施行令" = true := by native_decide
example : startsWithParen "（次項" = true := by native_decide
example : startsWithParen "（法人税法" = true := by native_decide
example : startsWithParen "（第十七項" = true := by native_decide
example : startsWithParen "（解散の日" = true := by native_decide
example : startsWithParen "（３）　大学" = true := by native_decide
example : startsWithParen "（６）　激" = true := by native_decide
example : startsWithParen "（ｂ" = true := by native_decide
example : startsWithParen "（ｃ" = true := by native_decide

end JapanTaxLaw.TruncatedParenFragmentsTests

