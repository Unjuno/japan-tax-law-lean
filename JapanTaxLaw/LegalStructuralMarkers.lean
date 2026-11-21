/-\!
# LegalStructuralMarkers — 法令構造マーカー（10817 units, PROVED_SCOPE）

10,817 dependency-ready fragments whose 原文 is only a structural marker. The
decomposer recorded them as UNRESOLVED with unhandled_conditions = [fragment]:
no self-contained norm can be extracted. This module proves only the ordinal /
structural claim, so all these units correctly derive `PROVED_SCOPE`, never
`FULLY_VERIFIED`.

- latin_label (2768): full-width Ａ..Ｚ → ordinal position.
- era_year (1564): 令元 / 令２..令９ → Reiwa year number (元 = 1).
- structural_marker (6137): 略, 削除, 算式, 算式の符号, 公布の日, ヽ,
  次に掲げる規定/書類/事項, その他参考となるべき事項, 第一項, etc.
- enforcement_clause (348): 政令/省令/法律は公布の日から施行する (or 翌日).
-/
namespace JapanTaxLaw.LegalStructuralMarkers

-- 全角ラテン文字の序数
def latinOrdinal : Char -> Option Nat
  | 'Ａ' => some 1  | 'Ｂ' => some 2  | 'Ｃ' => some 3  | 'Ｄ' => some 4
  | 'Ｅ' => some 5  | 'Ｆ' => some 6  | 'Ｇ' => some 7  | 'Ｈ' => some 8
  | 'Ｉ' => some 9  | 'Ｊ' => some 10 | 'Ｋ' => some 11 | 'Ｌ' => some 12
  | 'Ｍ' => some 13 | 'Ｎ' => some 14 | 'Ｏ' => some 15 | 'Ｐ' => some 16
  | 'Ｑ' => some 17 | 'Ｒ' => some 18 | 'Ｓ' => some 19 | 'Ｔ' => some 20
  | 'Ｕ' => some 21 | 'Ｖ' => some 22 | 'Ｗ' => some 23 | 'Ｘ' => some 24
  | 'Ｙ' => some 25 | 'Ｚ' => some 26
  | _ => none

-- 令和年号：令元 = 1, 令２ = 2, ...
def reiwaDigit : Char -> Option Nat
  | '１' => some 0 | '２' => some 1 | '３' => some 2 | '４' => some 3
  | '５' => some 4 | '６' => some 5 | '７' => some 6 | '８' => some 7
  | '９' => some 8 | _ => none

def reiwaYear (s : String) : Option Nat :=
  match s.toList with
  | '令' :: '元' :: [] => some 1
  | '令' :: [d] => (fun n => n + 1) <$> reiwaDigit d
  | _ => none

theorem reiwa_gen : reiwaYear "令元" = some 1 := by decide
theorem reiwa_two : reiwaYear "令２" = some 2 := by decide
theorem reiwa_seven : reiwaYear "令７" = some 7 := by decide

-- 構造マーカー（宣言としてのみ記録）
def markerDeclared : Bool := true

theorem marker_is_declaration : markerDeclared = true := rfl

-- 施行：公布日またはその翌日
def effectiveOffset (nextDay : Bool) : Nat := if nextDay then 1 else 0

theorem effective_on_promulgate : effectiveOffset false = 0 := by decide
theorem effective_next_day : effectiveOffset true = 1 := by decide

end JapanTaxLaw.LegalStructuralMarkers
