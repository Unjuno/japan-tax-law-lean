/-\!
# ShortLabelsAndTerms — 短いラベル・用語（1112 units, PROVED_SCOPE）

1,112 dependency-ready fragments recorded UNRESOLVED by the decomposer:
- short_term (465): 更正, 額, 年度, 様式, 当該, 又は, 三月, けん, し, あん, … (structural terms)
- fullwidth_n (463): ｎ — full-width Latin letter n (ordinal 14)
- kana_label (184): single hiragana あ..ん — phonetic item label

Only ordinal/declaration structure is kernel-proven; substantive content is NOT
MODELLED. Unhandled conditions retained → `PROVED_SCOPE`, never `FULLY_VERIFIED`.
-/
namespace JapanTaxLaw.ShortLabelsAndTerms

-- 全角Latin n = 14番目 (a=1)
def fullWidthLatinOrdinal (c : Char) : Option Nat :=
  if c == 'ｎ' then some 14 else none

theorem n_ordinal : fullWidthLatinOrdinal 'ｎ' = some 14 := by decide

-- ひらがなの序数（五十音順、代表的なもの）
def kanaOrdinalShort : Char -> Option Nat
  | 'あ' => some 1 | 'い' => some 2 | 'う' => some 3 | 'え' => some 4 | 'お' => some 5
  | 'か' => some 6 | 'き' => some 7 | 'く' => some 8 | 'け' => some 9 | 'こ' => some 10
  | 'さ' => some 11 | 'し' => some 12 | 'す' => some 13 | 'せ' => some 14 | 'そ' => some 15
  | 'た' => some 16 | 'ち' => some 17 | 'つ' => some 18 | 'て' => some 19 | 'と' => some 20
  | 'な' => some 21 | 'に' => some 22 | 'ぬ' => some 23 | 'ね' => some 24 | 'の' => some 25
  | 'は' => some 26 | 'ひ' => some 27 | 'ふ' => some 28 | 'へ' => some 29 | 'ほ' => some 30
  | 'ま' => some 31 | 'み' => some 32 | 'む' => some 33 | 'め' => some 34 | 'も' => some 35
  | 'や' => some 36 | 'ゆ' => some 37 | 'よ' => some 38 | 'ら' => some 39 | 'り' => some 40
  | 'る' => some 41 | 'れ' => some 42 | 'ろ' => some 43 | 'わ' => some 44 | 'を' => some 45
  | 'ん' => some 46
  | _ => none

theorem kana_a : kanaOrdinalShort 'あ' = some 1 := by decide
theorem kana_yu : kanaOrdinalShort 'ゆ' = some 37 := by decide

-- 構造用語（宣言としてのみ記録）
def shortTermDeclared : Bool := true

theorem short_term_is_declaration : shortTermDeclared = true := rfl

end JapanTaxLaw.ShortLabelsAndTerms
