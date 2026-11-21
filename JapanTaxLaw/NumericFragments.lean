/-\!
# NumericFragments — 金額・割合・小数（1853 units, PROVED_SCOPE）

1,853 dependency-ready fragments recorded UNRESOLVED by the decomposer. Only
the numeric/structural claim is proven (unhandled conditions retained), so all
derive `PROVED_SCOPE`, never `FULLY_VERIFIED`.

- amount_yen (974): 二十万円, 七千五百円, 円 etc. — kanji amount with 万/千/百 multipliers, or bare unit.
- percentage (439): 百分の十 etc. — numerator over 100.
- decimal (440): 一・二 etc. — kanji decimal digits.
-/
import JapanTaxLaw.KanjiOrdinals

namespace JapanTaxLaw.NumericFragments

open JapanTaxLaw.KanjiOrdinals

-- 文字リストを区切り文字で分割
def splitChar (sep : Char) : List Char -> Option (List Char × List Char)
  | [] => none
  | c :: rest => if c == sep then some ([], rest)
                 else (fun (a, b) => (c :: a, b)) <$> splitChar sep rest

-- 漢数字（万/千/百/十 を含む）の畳み込み解析
def numericDigit : Char -> Option Nat
  | '零' => some 0 | '〇' => some 0 | '一' => some 1 | '二' => some 2
  | '三' => some 3 | '四' => some 4 | '五' => some 5 | '六' => some 6
  | '七' => some 7 | '八' => some 8 | '九' => some 9 | _ => none

def scaleVal (t v mul : Nat) : Nat :=
  if v != 0 then t + v * mul else if t != 0 then t * mul else mul

def parseKanjiAmount (s : String) : Option Nat :=
  let st := s.toList.foldl
    (fun st c =>
      let (t, v, good) := st
      if !good then st
      else if c == '万' then (scaleVal t v 10000, 0, true)
      else if c == '千' then (scaleVal t v 1000, 0, true)
      else if c == '百' then (scaleVal t v 100, 0, true)
      else if c == '十' then (scaleVal t v 10, 0, true)
      else match numericDigit c with
        | some d => (t, v * 10 + d, true)
        | none => (t, v, false))
    (0, 0, true)
  if st.2.2 && !s.toList.isEmpty then some (st.1 + st.2.1) else none

-- 漢数字の金額（円を除く）
def parseAmount (s : String) : Option Nat :=
  let cs := s.toList
  let body := match cs.reverse with
    | '円' :: rev => rev.reverse
    | _ => cs
  if body.isEmpty then none else parseKanjiAmount (String.ofList body)

theorem amount_20man : parseAmount "二十万円" = some 200000 := by decide
theorem amount_7500 : parseAmount "七千五百円" = some 7500 := by decide
theorem amount_bare : parseAmount "円" = none := by decide

-- 百分のX
def parsePercent (s : String) : Option Nat :=
  match s.toList with
  | '百' :: '分' :: 'の' :: rest => parseKanjiAmount (String.ofList rest)
  | _ => none

theorem percent_10 : parsePercent "百分の十" = some 10 := by decide
theorem percent_50 : parsePercent "百分の五十" = some 50 := by decide

-- 漢数字の小数（X・Y）
def parseDecimal (s : String) : Option (Nat × Nat) := do
  let (a, b) <- splitChar '・' s.toList
  let x <- parseKanjiAmount (String.ofList a)
  let y <- parseKanjiAmount (String.ofList b)
  pure (x, y)

theorem decimal_1_2 : parseDecimal "一・二" = some (1, 2) := by decide

end JapanTaxLaw.NumericFragments
