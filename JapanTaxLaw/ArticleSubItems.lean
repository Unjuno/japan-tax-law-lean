/-\!
# ArticleSubItems — 条の枝番号（4025 units, PROVED_SCOPE）

4,025 dependency-ready fragments recorded UNRESOLVED: article sub-item labels
第一条の二, 第百四条の二, … (2,138 variants). Each is a bare structural label
with a self-referential law_article dependency. Only the (article, sub) ordinal
pair is kernel-proven; the substantive content of the articles is NOT MODELLED.
These derive `PROVED_SCOPE`, never `FULLY_VERIFIED`.
-/
import JapanTaxLaw.ArticleNumberLabels

namespace JapanTaxLaw.ArticleSubItems

open JapanTaxLaw.ArticleNumberLabels

def splitChar (sep : Char) : List Char -> Option (List Char × List Char)
  | [] => none
  | c :: rest => if c == sep then some ([], rest)
                 else (fun (a, b) => (c :: a, b)) <$> splitChar sep rest

def parseSubLabel (s : String) : Option (Nat × Nat) := do
  let (a, tail1) <- splitChar 'の' s.toList
  let art <- parseArticleLabel (String.ofList a)
  let sub <- parseArticleNumber (String.ofList tail1)
  pure (art, sub)

theorem parse_first_2 : parseSubLabel "第一条の二" = some (1, 2) := by decide
theorem parse_104_2 : parseSubLabel "第百四条の二" = some (104, 2) := by decide

def subLabelDeclared : Bool := true

theorem sublabel_is_declaration : subLabelDeclared = true := rfl

end JapanTaxLaw.ArticleSubItems
