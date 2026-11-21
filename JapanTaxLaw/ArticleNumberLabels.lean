/-\!
# ArticleNumberLabels — 条番号ラベル（27338 units, PROVED_SCOPE）

27,338 dependency-ready fragments whose 原文 is only an article number label
第一条, 第二条, … (647 variants). These are bare structural labels with a
self-referential law_article dependency; the dependency does not affect status
derivation (only task selection). The decomposer did not classify them as a
self-contained norm. Only the ordinal is kernel-proven, so all derive
`PROVED_SCOPE`, never `FULLY_VERIFIED`.

Parses 第 + kanji numeral + 条 -> Nat via the already kernel-verified
NumericFragments fold parser (including 百/千). The substantive content of the
articles is NOT MODELLED.
-/
namespace JapanTaxLaw.ArticleNumberLabels

-- 漢数字の桁：万は累計に乗じ、千/百/十は加算の桁
def numeralDigit : Char -> Option Nat
  | '零' => some 0 | '〇' => some 0 | '一' => some 1 | '二' => some 2
  | '三' => some 3 | '四' => some 4 | '五' => some 5 | '六' => some 6
  | '七' => some 7 | '八' => some 8 | '九' => some 9 | _ => none

def parseArticleNumber (s : String) : Option Nat :=
  let st := s.toList.foldl
    (fun st c =>
      let (t, cur, ok) := st
      if !ok then st
      else if c == '万' then ((t + cur) * 10000, 0, true)
      else if c == '千' then (t + (if cur == 0 then 1000 else cur * 1000), 0, true)
      else if c == '百' then (t + (if cur == 0 then 100 else cur * 100), 0, true)
      else if c == '十' then (t + (if cur == 0 then 10 else cur * 10), 0, true)
      else match numeralDigit c with
        | some d => (t, cur * 10 + d, true)
        | none => (t, cur, false))
    (0, 0, true)
  if st.2.2 && !s.toList.isEmpty then some (st.1 + st.2.1) else none

def parseArticleLabel (s : String) : Option Nat :=
  match s.toList with
  | '第' :: rest =>
      match rest.reverse with
      | '条' :: rev => parseArticleNumber (String.ofList rev.reverse)
      | _ => none
  | _ => none

theorem parse_first : parseArticleLabel "第一条" = some 1 := by decide
theorem parse_second : parseArticleLabel "第二条" = some 2 := by decide
theorem parse_tenth : parseArticleLabel "第十条" = some 10 := by decide

def labelDeclared : Bool := true

theorem label_is_declaration : labelDeclared = true := rfl

end JapanTaxLaw.ArticleNumberLabels
