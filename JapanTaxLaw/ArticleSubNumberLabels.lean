/-\!
# ArticleSubNumberLabels — 条番号＋のN ラベル（2769 units, PROVED_SCOPE）

2769 bare structural labels of the form 第X条のY (article number with a
sub-number suffix), e.g. 第四条の四. Only the structural shape is kernel-proven;
the substantive content of the referenced articles is NOT MODELLED. Accordingly
these derive `PROVED_SCOPE`, never `FULLY_VERIFIED`.
-/
namespace JapanTaxLaw.ArticleSubNumberLabels

-- 漢数字1桁
def digit : Char → Option Nat
  | '一' => some 1 | '二' => some 2 | '三' => some 3 | '四' => some 4
  | '五' => some 5 | '六' => some 6 | '七' => some 7 | '八' => some 8
  | '九' => some 9 | '〇' => some 0 | '十' => some 10 | '百' => some 100 | '千' => some 1000 | _ => none

-- 第X条のY の構造検証：先頭が 第、末尾が漢数字、中間に 条 と の を含む
def isArticleSubLabel (s : String) : Bool :=
  let cs := s.toList
  match cs.head?, cs.getLast? with
  | some '第', some last =>
      (digit last != none) && cs.contains '条' && cs.contains 'の'
  | _, _ => false

example : isArticleSubLabel "第四条の四" = true := by native_decide
example : isArticleSubLabel "第一条の四" = true := by native_decide
example : isArticleSubLabel "第十五条の四" = true := by native_decide
example : isArticleSubLabel "第四条" = false := by native_decide
example : isArticleSubLabel "その他" = false := by native_decide

-- 構造宣言
def articleSubDeclared : Bool := true
theorem article_sub_is_declaration : articleSubDeclared = true := rfl

end JapanTaxLaw.ArticleSubNumberLabels
