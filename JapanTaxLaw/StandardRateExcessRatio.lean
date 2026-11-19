import JapanTaxLaw.TaxFinance

/-
# StandardRateExcessRatio — 地方税法施行令 art. 35の4の6（標準税率超過率）bounded L4 モデル

Source (pinned):

  Law id: 325CO0000000245
  Revision: 325CO0000000245_20261101_508CO0000000083
  Raw snapshot: data/raw/325CO0000000245_20261101_508CO0000000083.law.json

担当範囲の原文（一字も誤らず、pinned JSON の当該条 leaf-text より転記。needle として転記監査に渡す）:

  （法第七十二条の七十六第一号の標準税率を超えて課する部分に相当する額の割合として算定した率）第三十五条の四の六法第七十二条の七十六第一号に規定する標準税率を超えて課する部分に相当する額の割合として政令で定めるところにより算定した率は、毎年度、道府県知事が基準事業税額から標準税率相当額を控除した額を当該基準事業税額で除して算定した率（第四項及び次条において「標準税率超過率」という。）とする。２前項の基準事業税額とは、第一号から第三号まで及び第五号に掲げる事業税額の合計額から第四号に掲げる事業税額を控除した額をいう。一前年度三月から当該年度二月までの間（以下この項において「算定期間」という。）に道府県知事に提出された法第七十二条の二十五、第七十二条の二十八又は第七十二条の二十九の規定による申告書に記載された事業税額二算定期間に道府県知事に提出された法第七十二条の三十一第二項又は第三項の規定による修正申告書に記載された修正により増加した事業税額三算定期間に道府県知事が法第七十二条の三十九第一項若しくは第三項、第七十二条の四十一第一項若しくは第三項又は第七十二条の四十一の二第一項若しくは第三項の規定による更正（以下この号及び次号において「更正」という。）をした場合における当該更正により増加した事業税額四算定期間に道府県知事が更正をした場合における当該更正により減少した事業税額五算定期間に道府県知事が法第七十二条の三十九第二項、第七十二条の四十一第二項又は第七十二条の四十一の二第二項の規定による決定をした場合における当該決定に係る事業税額３第一項の標準税率相当額とは、前項各号に掲げる事業税額に係る税率が法第七十二条の七十六第一号に規定する標準税率（次条第一項において「標準税率」という。）であるものとした場合における前項に規定する基準事業税額として算定した額をいう。４前各項に定めるもののほか、標準税率超過率の算定に関し必要な事項は、総務省令で定める。

Computation (Money = Nat; caller-established 額を List Money で受け取る):

  第1項  standardRateExcessRatio baseTax standardTaxEquivalent
          = if baseTax = 0 then 0 else (baseTax - standardTaxEquivalent) / baseTax
            -- 原文「基準事業税額から標準税率相当額を控除した額を当該基準事業税額で除して算定した率」
            -- Nat 除算は切り捨て、分母 0 は 0 を返す安全版。

  第2項  baseBusinessTax amounts deductions
          = sumMoney amounts - sumMoney deductions
            -- amounts: 第一号〜第三号及び第五号の事業税額（caller-established List Money）
            -- deductions: 第四号の事業税額（caller-established List Money）
            -- Nat 減算は saturating（控除が合計を超えれば 0）。

Scope & honest boundaries:

  * 基準事業税額・標準税率相当額・各号の事業税額・該当性はすべて caller-established。
    Bool は金額式に入れない（判定は呼び出し側で行い、Money として渡す）。
  * 2項の「算定期間」（前年度三月から当該年度二月まで）および各申告書
    （第七十二条の二十五・二十八・二十九、修正申告書、更正、決定）の具体的認定は NOT MODELLED。
    本モジュールは既に認定済みの金額の合計・控除構造のみを写す。
  * 3項の標準税率相当額の算定（税率が標準税率であるとした場合の再計算）、4項の総務省令、
    および「毎年度」「第四項及び次条」の定義は NOT MODELLED / caller-established。
  * Nat 除算・減算により、端数は切り捨て・控除超過は 0（saturating）となる。
    特に standardTaxEquivalent > 0 かつ ≤ baseTax のとき比は 0、=0 のとき 1 にしかならない
    （整数除算の限于界）。有理数での割合・丸め規則は NOT MODELLED。
  * Pinned evidence は doc-comment にのみ置き、以下の定理はモデルの性質のみを主張する
    （法的意味の等価ではない。転記監査は fidelity-only）。小さな L4 スライスであり、
    完成・網羅を主張しない。人間の法的レビューではない。
-/

namespace JapanTaxLaw.StandardRateExcessRatio

open JapanTaxLaw.TaxFinance

-- ==== 補助: caller-established の List Money を合計 ====

/-- 一号〜三号・五号（または四号）の事業税額の合計。各額は caller-established。 -/
def sumMoney (xs : List Money) : Money :=
  match xs with
  | [] => 0
  | x :: rest => x + sumMoney rest

-- ==== 第1項: 標準税率超過率 ====

/-- 第1項 — 標準税率超過率 = (基準事業税額 − 標準税率相当額) ÷ 基準事業税額。
    Nat 除算（切り捨て）、分母 0 は 0 を返す安全版。 -/
def standardRateExcessRatio (baseTax standardTaxEquivalent : Money) : Money :=
  if baseTax = 0 then 0 else (baseTax - standardTaxEquivalent) / baseTax

-- ==== 第2項: 基準事業税額 ====

/-- 第2項 — 基準事業税額 = 一号〜三号・五号の合計 − 四号の合計。
    Nat 減算は saturating（控除が合計を超えれば 0）。 -/
def baseBusinessTax (amounts deductions : List Money) : Money :=
  sumMoney amounts - sumMoney deductions

/-- 第1項を第2項から組み立てたもの（基準事業税額 → 標準税率超過率）。 -/
def excessRatioFromItems (amounts deductions : List Money)
    (standardTaxEquivalent : Money) : Money :=
  standardRateExcessRatio (baseBusinessTax amounts deductions) standardTaxEquivalent

-- ==== verified facts about the model (model consistency only) ====

theorem sumMoney_nil : sumMoney [] = 0 := rfl

theorem sumMoney_cons (x : Money) (xs : List Money) :
    sumMoney (x :: xs) = x + sumMoney xs := rfl

theorem standardRateExcessRatio_zero_base (standardTaxEquivalent : Money) :
    standardRateExcessRatio 0 standardTaxEquivalent = 0 := by
  simp [standardRateExcessRatio]

theorem standardRateExcessRatio_eq_div {baseTax standardTaxEquivalent : Money}
    (hb : baseTax ≠ 0) :
    standardRateExcessRatio baseTax standardTaxEquivalent =
      (baseTax - standardTaxEquivalent) / baseTax := by
  simp [standardRateExcessRatio, hb]

theorem standardRateExcessRatio_self (baseTax : Money) :
    standardRateExcessRatio baseTax baseTax = 0 := by
  by_cases hb : baseTax = 0
  · simp [standardRateExcessRatio, hb]
  · simp [standardRateExcessRatio, hb]

theorem standardRateExcessRatio_zero_of_ge {baseTax standardTaxEquivalent : Money}
    (h : baseTax ≤ standardTaxEquivalent) :
    standardRateExcessRatio baseTax standardTaxEquivalent = 0 := by
  by_cases hb : baseTax = 0
  · simp [standardRateExcessRatio, hb]
  · simp [standardRateExcessRatio, hb, Nat.sub_eq_zero_of_le h]

theorem standardRateExcessRatio_le_one (baseTax standardTaxEquivalent : Money) :
    standardRateExcessRatio baseTax standardTaxEquivalent ≤ 1 := by
  by_cases hb : baseTax = 0
  · simp [standardRateExcessRatio, hb]
  · rw [standardRateExcessRatio_eq_div hb]
    have hmul : ((baseTax - standardTaxEquivalent) / baseTax) * baseTax ≤
        baseTax - standardTaxEquivalent := Nat.div_mul_le_self _ _
    have hmul'' : ((baseTax - standardTaxEquivalent) / baseTax) * baseTax ≤ baseTax := by
      calc
        ((baseTax - standardTaxEquivalent) / baseTax) * baseTax ≤ baseTax - standardTaxEquivalent := hmul
        _ ≤ baseTax := Nat.sub_le _ _
    have hmul' : ((baseTax - standardTaxEquivalent) / baseTax) * baseTax ≤ 1 * baseTax := by
      simpa using hmul''
    exact Nat.le_of_mul_le_mul_right hmul' (Nat.pos_of_ne_zero hb)

theorem baseBusinessTax_eq (amounts deductions : List Money) :
    baseBusinessTax amounts deductions = sumMoney amounts - sumMoney deductions := rfl

theorem baseBusinessTax_le_amounts (amounts deductions : List Money) :
    baseBusinessTax amounts deductions ≤ sumMoney amounts := by
  unfold baseBusinessTax
  exact Nat.sub_le _ _

theorem baseBusinessTax_eq_zero_of_ge {amounts deductions : List Money}
    (h : sumMoney amounts ≤ sumMoney deductions) :
    baseBusinessTax amounts deductions = 0 := by
  unfold baseBusinessTax
  exact Nat.sub_eq_zero_of_le h

theorem baseBusinessTax_eq_amounts_of_no_deduction (amounts : List Money) :
    baseBusinessTax amounts [] = sumMoney amounts := by
  simp [baseBusinessTax, sumMoney]

theorem excessRatioFromItems_eq (amounts deductions : List Money)
    (standardTaxEquivalent : Money) :
    excessRatioFromItems amounts deductions standardTaxEquivalent =
      standardRateExcessRatio (baseBusinessTax amounts deductions) standardTaxEquivalent := rfl

-- ==== kernel-decided smoke checks ====

example : standardRateExcessRatio 0 0 = 0 := by decide
example : standardRateExcessRatio 0 100 = 0 := by decide            -- 分母 0
example : standardRateExcessRatio 100 100 = 0 := by decide          -- 分子 0
example : standardRateExcessRatio 100 0 = 1 := by decide            -- 控除 0 → 率 1
example : standardRateExcessRatio 100 1 = 0 := by decide            -- 端数切り捨て
example : standardRateExcessRatio 7 3 = 0 := by decide              -- 端数切り捨て
example : standardRateExcessRatio 100 200 = 0 := by decide          -- 控除>基準 → saturating
example : sumMoney [] = 0 := by decide
example : sumMoney [1, 2, 3, 5] = 11 := by decide
example : baseBusinessTax [10, 20, 30] [5] = 55 := by decide
example : baseBusinessTax [10, 20, 30] [] = 60 := by decide
example : baseBusinessTax [] [5] = 0 := by decide
example : baseBusinessTax [10] [50] = 0 := by decide                -- saturating
example : baseBusinessTax [1, 2, 3, 5] [4] = 7 := by decide
example : excessRatioFromItems [1, 2, 3, 5] [4] 7 = 0 := by decide

end JapanTaxLaw.StandardRateExcessRatio
