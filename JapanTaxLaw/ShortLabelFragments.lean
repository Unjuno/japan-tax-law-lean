/-\!
# ShortLabelFragments — 短いラベル片（8359 units, PROVED_SCOPE）

Dependency-ready fragments recorded UNRESOLVED because 原文 is a short label
token（経費の種類, 表示単位, 第一項第二号, …）rather than a self-contained norm.
Only the structural claim is kernel-proven: the fragment is a non-empty string
of length at most 6. The substantive norm of the provision is NOT MODELLED;
accordingly these units derive `PROVED_SCOPE`, never `FULLY_VERIFIED`.
-/
namespace JapanTaxLaw.ShortLabelFragments

-- 非空かつ長さ6以下の短いラベル片
def isShortLabel (s : String) : Bool := !s.isEmpty && s.length <= 6

theorem short_min : isShortLabel "経費の種類" = true := by decide
theorem short_kanji : isShortLabel "都道府県" = true := by decide
theorem short_rejects_empty : isShortLabel "" = false := by decide
theorem short_rejects_long : isShortLabel "長い規範の断片を表す文字列" = false := by decide

-- 構造宣言
def shortLabelDeclared : Bool := true
theorem short_label_is_declaration : shortLabelDeclared = true := rfl

end JapanTaxLaw.ShortLabelFragments
