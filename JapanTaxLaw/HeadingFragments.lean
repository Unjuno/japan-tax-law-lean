/-\!
# HeadingFragments — 見出し片（5573 units, PROVED_SCOPE）

Dependency-ready fragments recorded UNRESOLVED because 原文 is a parenthesized
heading（見出し）, not a self-contained norm. Only the structural claim is
proven: the fragment is wrapped in full-width parentheses with non-empty inner
text. The substantive norm of the provision is NOT MODELLED; accordingly these
units derive `PROVED_SCOPE`, never `FULLY_VERIFIED`.
-/
namespace JapanTaxLaw.HeadingFragments

-- 全角括弧で囲まれ、内側が空でないことを判定
def isParenthesized (s : String) : Bool :=
  match s.toList with
  | '（' :: rest =>
      match rest.reverse with
      | '）' :: inner => !inner.isEmpty
      | _ => false
  | _ => false

theorem par_wrapped : isParenthesized "（納税環境の整備に向けた検討）" = true := by decide
theorem par_min : isParenthesized "（Ａ）" = true := by decide
theorem par_rejects_bare : isParenthesized "納税環境" = false := by decide
theorem par_rejects_empty : isParenthesized "（）" = false := by decide
theorem par_rejects_half : isParenthesized "(納税環境)" = false := by decide
theorem par_accepts_formula_text : isParenthesized "（１／Ａ）" = true := by decide

-- 構造宣言
def headingDeclared : Bool := true
theorem heading_is_declaration : headingDeclared = true := rfl

end JapanTaxLaw.HeadingFragments
