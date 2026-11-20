import JapanTaxLaw.TaxFinance

/-!
# ExamFee — 税理士法施行令 art.6の2（受験手数料等）bounded L4 モデル

Sources (pinned):
  Law id: 326CO0000000216
  Revision: 326CO0000000216_20240401_505CO0000000146
  Raw snapshot: data/raw/326CO0000000216_20240401_505CO0000000146.law.json
  Article Num 6_2, flat/normalized leaf text 143 chars, U+3000 count 0.

原文逐語:
  §1 「法第九条第一項に規定する政令で定める額は、受験科目の数が一である場合に
       あつては四千円、受験科目の数が二以上である場合にあつては四千円と千五百円に
       一を超える受験科目の数を乗じて得た額との合計額とする。」
  §2 「法第九条第二項に規定する政令で定める額は、八千八百円とする。」

Computation（原文逐語から導出）:
  baseFee = 4_000（四千円）
  perExtraSubject = 1_500（千五百円）
  examFee(1) = 4_000
  examFee(n) = 4_000 + 1_500 × (n − 1)  （n ≥ 2）
  secondClauseFee = 8_800（八千八百円）

Scope / NOT MODELLED:
  - n = 0（受験科目ゼロ）は本条の適用外（一科目以上が前提）。
  - 法9条1項/2項の申請区分の具体認定、減免、納付手続は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.ExamFee

open JapanTaxLaw.TaxFinance

/-- 受験手数料の基準額 = 四千円。 -/
def baseFee : Money := 4_000
/-- 一を超える科目ごとの加算額 = 千五百円。 -/
def perExtraSubjectYen : Money := 1_500
/-- 法9条2項の額 = 八千八百円。 -/
def secondClauseFee : Money := 8_800

/-- 受験手数料。n=0 は適用外だが全域函数として 0 を返す。 -/
def examFee (n : Nat) : Money :=
  if n = 0 then 0
  else if n = 1 then baseFee
  else baseFee + perExtraSubjectYen * (n - 1)

example : baseFee = 4_000 := by decide
example : perExtraSubjectYen = 1_500 := by decide
example : secondClauseFee = 8_800 := by decide
example : examFee 0 = 0 := by decide
example : examFee 1 = 4_000 := by decide
example : examFee 2 = 5_500 := by decide
example : examFee 3 = 7_000 := by decide
example : examFee 5 = 10_000 := by decide

end JapanTaxLaw.ExamFee
