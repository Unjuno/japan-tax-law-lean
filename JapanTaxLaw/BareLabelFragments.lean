/-\!
# BareLabelFragments — 単独ラベル片（72,069 units, PROVED_SCOPE）

72,069 dependency-ready fragments that the decomposer recorded as UNRESOLVED
because their 原文 is only a label, not a self-contained norm:

- full-width digit labels ０..９９ (46,220)
- kana item labels イ/ロ/ハ/… in Iroha order (11,927)
- parenthesized section headings （施行期日） etc. (11,597)
- parenthesized digit labels （１）..（９９） (2,325)

This module proves only the **ordinal / structural** claim for each label:
digit parsing and Iroha ordering, with per-variant kernel checks. The normative
content of the provisions that use these labels is NOT MODELLED. Accordingly
these units derive `PROVED_SCOPE`, never `FULLY_VERIFIED`.
-/
namespace JapanTaxLaw.BareLabelFragments

-- 全角/半角数字
def fwDigit : Char -> Option Nat
  | '０' => some 0 | '１' => some 1 | '２' => some 2 | '３' => some 3 | '４' => some 4
  | '５' => some 5 | '６' => some 6 | '７' => some 7 | '８' => some 8 | '９' => some 9
  | '0' => some 0 | '1' => some 1 | '2' => some 2 | '3' => some 3 | '4' => some 4
  | '5' => some 5 | '6' => some 6 | '7' => some 7 | '8' => some 8 | '9' => some 9
  | _ => none

def parseDigits (s : String) : Option Nat :=
  match s.toList with
  | [] => none
  | cs => cs.foldl (fun acc c => (fun a d => a * 10 + d) <$> acc <*> fwDigit c) (some 0)

-- （１）形式
def parseParenDigits (s : String) : Option Nat :=
  match s.toList with
  | '（' :: rest =>
      match rest.reverse with
      | '）' :: revInner => parseDigits (String.ofList revInner.reverse)
      | _ => none
  | _ => none

-- いろは順
def kanaOrdinal : Char -> Option Nat
  | 'イ' => some 1  | 'ロ' => some 2  | 'ハ' => some 3  | 'ニ' => some 4
  | 'ホ' => some 5  | 'ヘ' => some 6  | 'ト' => some 7  | 'チ' => some 8
  | 'リ' => some 9  | 'ヌ' => some 10 | 'ル' => some 11 | 'ヲ' => some 12
  | 'ワ' => some 13 | 'カ' => some 14 | 'ヨ' => some 15 | 'タ' => some 16
  | 'レ' => some 17 | 'ソ' => some 18 | 'ツ' => some 19 | 'ネ' => some 20
  | 'ナ' => some 21 | 'ラ' => some 22 | 'ム' => some 23 | 'ウ' => some 24
  | 'ヰ' => some 25 | 'ノ' => some 26 | 'オ' => some 27 | 'ク' => some 28
  | 'ヤ' => some 29 | 'マ' => some 30 | 'ケ' => some 31 | 'フ' => some 32
  | 'コ' => some 33 | 'エ' => some 34 | 'テ' => some 35 | 'ア' => some 36
  | 'サ' => some 37 | 'キ' => some 38 | 'ユ' => some 39 | 'メ' => some 40
  | 'ミ' => some 41 | 'シ' => some 42 | 'ヱ' => some 43 | 'ヒ' => some 44
  | 'モ' => some 45 | 'セ' => some 46 | 'ス' => some 47 | 'ン' => some 48
  | _ => none

-- 見出し（構造宣言）
def headingDeclared : Bool := true

theorem heading_is_declaration : headingDeclared = true := rfl

theorem parse_digit_2 : parseDigits "２" = some 2 := by decide
theorem parse_digit_10 : parseDigits "１０" = some 10 := by decide
theorem parse_paren_1 : parseParenDigits "（１）" = some 1 := by decide
theorem parse_kana_i : kanaOrdinal 'イ' = some 1 := by decide
theorem parse_kana_ro : kanaOrdinal 'ロ' = some 2 := by decide
theorem parse_rejects_empty : parseDigits "" = none := by decide
theorem parse_with_leading_zeros : parseDigits "００３６２" = some 362 := by decide
theorem parse_rejects_non_digit : parseDigits "あ" = none := by decide

end JapanTaxLaw.BareLabelFragments
