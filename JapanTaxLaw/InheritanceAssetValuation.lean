import JapanTaxLaw.TaxFinance

/-!
# InheritanceAssetValuation — 相続税法 art. 22〜25（資産評価）の bounded L4 スライス

Source (pinned, verbatim normalized bytes):

  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008
  Amendment enforcement date: 2026-04-01
  Text: W_J_inheritance_eval.txt（第22条〜第25条、正規化済み・UTF-8）

Scope:

  * 第23条（地上権及び永小作権の評価）を本スライスの主対象としてモデル化:
    残存期間 10 区分の割合表（5/10/20/30/40/50/60/70/80/90%）と、
    「土地の時価 × 割合（切り捨て）」の評価額計算。
    存続期間の定めのない地上権（perpetual = true）は 40%。
  * 第25条（定期金給付契約のうち定期金給付事由が発生していないもの）の
    明示的な算術部分のみモデル化: 解約返戻金の定めがない場合の
    「百分の九十を乗じて得た金額」（90%）。基礎となる複利計算額は
    caller-established `Money`。

NOT MODELLED（理由を明示）:

  * 第22条（評価の原則）: 「時価による」「債務の金額はその時の現況による」という
    評価原則のみで算術式がない。時価・債務額の認定は caller-established であり、
    L4 の計算モデルとして定式化する対象がない。
  * 第24条（定期金に関する権利の評価）: 複利年金現価率・予定利率・政令で定める
    余命年数を用い、「いずれか多い金額」「いずれか少ない金額」の比較を伴う。
    複利年金現価率は財務省令で定める割合で原文に数式がなく、予定利率・余命年数も
    外部パラメータ。bounded な再現を主張できないため非モデル化。
  * 第23条の「借地借家法の借地権・民法269条の2第1項の地下/空間地上権の除外」、
    第25条の「生命保険契約の除外」「定期金給付事由発生済み（→第24条）」の
    適用判定はすべて caller-established。
  * 第25条の複利計算（掛金・保険料の元利合計額／複利年金終価率）そのもの、
    および解約返戻金のある場合（第二号）の金額認定は非モデル化。

Honesty:

  * `Money = Nat`、割合は `TaxRate`（den = 100）、端数は `TaxRate.applyFloor`（切り捨て）。
  * 土地時価・残存期間・存続期間不定か・複利計算額はすべて caller-established。
  * 転記監査は fidelity-only（原文 bytes との一致確認）であり法的正しさを保証しない。
    L4 のごく小さな bounded スライスであり、完成・網羅を主張しない。
-/

namespace JapanTaxLaw.InheritanceAssetValuation

open JapanTaxLaw.TaxFinance

-- ==== 第23条: 残存期間別の割合表 ====

/-- art. 23 — 百分率を `pct/100` の `TaxRate` として保持する（端数は掛算後に切り捨て）。 -/
def pctRate (pct : Nat) : TaxRate := ⟨pct, 100, by decide⟩

/-- art. 23 — 残存期間（年）と「存続期間の定めのない地上権」フラグから割合を返す。
    原文の全区分:

      ≤10                    → 5%
      10 超 15 以下           → 10%
      15 超 20 以下           → 20%
      20 超 25 以下           → 30%
      25 超 30 以下 及び 存続期間の定めのない地上権 → 40%
      30 超 35 以下           → 50%
      35 超 40 以下           → 60%
      40 超 45 以下           → 70%
      45 超 50 以下           → 80%
      50 超                  → 90%

    `perpetual = true` のときは残存期間の値にかかわらず 40%（存続期間不定の地上権）。
    残存期間・存続期間不定かは caller-established。 -/
def superficiesRate (years : Nat) (perpetual : Bool) : TaxRate :=
  if perpetual then pctRate 40
  else if years ≤ 10 then pctRate 5
  else if years ≤ 15 then pctRate 10
  else if years ≤ 20 then pctRate 20
  else if years ≤ 25 then pctRate 30
  else if years ≤ 30 then pctRate 40
  else if years ≤ 35 then pctRate 50
  else if years ≤ 40 then pctRate 60
  else if years ≤ 45 then pctRate 70
  else if years ≤ 50 then pctRate 80
  else pctRate 90

/-- art. 23 — 地上権・永小作権の価額 =
    目的土地の時価（権利設定がない場合の時価）× 割合（切り捨て）。
    土地時価・残存期間・存続期間不定かは caller-established。 -/
def superficiesValue (landMarketValue : Money) (years : Nat) (perpetual : Bool) : Money :=
  (superficiesRate years perpetual).applyFloor landMarketValue

-- ==== 第25条: 明確な部分のみ（百分の九十） ====

/-- art. 25 第一号 — 「当該契約に解約返戻金を支払う旨の定めがない場合」の
    百分の九十を 90/100 の `TaxRate` として保持する。 -/
def art25NoSurrenderRate : TaxRate := pctRate 90

/-- art. 25 第一号 — 解約返戻金の定めがない場合の価額 = 各号の金額 × 90%（切り捨て）。
    `compoundBase` は原文イ・ロの「予定利率の複利による元利合計額／複利年金終価率を
    乗じて得た金額」であり、その複利計算は本モデル外（caller-established `Money`）。 -/
def art25NoSurrenderValue (compoundBase : Money) : Money :=
  art25NoSurrenderRate.applyFloor compoundBase

-- ==== verified facts（モデルの性質のみ） ====

theorem superficiesValue_eq (m : Money) (y : Nat) (p : Bool) :
    superficiesValue m y p = m * (superficiesRate y p).num / (superficiesRate y p).den := rfl

theorem art25NoSurrenderValue_eq (m : Money) :
    art25NoSurrenderValue m = m * 90 / 100 := rfl

/-- 評価額は土地時価について単調（端数切り捨ての下でも成立）。 -/
theorem superficiesValue_mono {a b : Money} (h : a ≤ b) (y : Nat) (p : Bool) :
    superficiesValue a y p ≤ superficiesValue b y p := by
  rw [superficiesValue_eq, superficiesValue_eq]
  exact Nat.div_le_div_right (Nat.mul_le_mul_right (superficiesRate y p).num h)

/-- art. 25 の 90% 適用も基礎額について単調。 -/
theorem art25NoSurrenderValue_mono {a b : Money} (h : a ≤ b) :
    art25NoSurrenderValue a ≤ art25NoSurrenderValue b := by
  rw [art25NoSurrenderValue_eq, art25NoSurrenderValue_eq]
  exact Nat.div_le_div_right (Nat.mul_le_mul_right 90 h)

-- ==== kernel-decided smoke（割合表の全区分・境界値） ====

example : (pctRate 5).num = 5 := by decide
example : (pctRate 5).den = 100 := by decide
example : (superficiesRate 0 false).num = 5 := by decide
example : (superficiesRate 9 false).num = 5 := by decide
example : (superficiesRate 10 false).num = 5 := by decide
example : (superficiesRate 11 false).num = 10 := by decide
example : (superficiesRate 15 false).num = 10 := by decide
example : (superficiesRate 16 false).num = 20 := by decide
example : (superficiesRate 20 false).num = 20 := by decide
example : (superficiesRate 21 false).num = 30 := by decide
example : (superficiesRate 25 false).num = 30 := by decide
example : (superficiesRate 26 false).num = 40 := by decide
example : (superficiesRate 30 false).num = 40 := by decide
example : (superficiesRate 31 false).num = 50 := by decide
example : (superficiesRate 35 false).num = 50 := by decide
example : (superficiesRate 36 false).num = 60 := by decide
example : (superficiesRate 40 false).num = 60 := by decide
example : (superficiesRate 41 false).num = 70 := by decide
example : (superficiesRate 45 false).num = 70 := by decide
example : (superficiesRate 46 false).num = 80 := by decide
example : (superficiesRate 50 false).num = 80 := by decide
example : (superficiesRate 51 false).num = 90 := by decide
example : (superficiesRate 60 false).num = 90 := by decide

-- 存続期間の定めのない地上権（perpetual = true）は常に 40%
example : (superficiesRate 0 true).num = 40 := by decide
example : (superficiesRate 10 true).num = 40 := by decide
example : (superficiesRate 30 true).num = 40 := by decide
example : (superficiesRate 51 true).num = 40 := by decide

-- 分母は常に 100
example : (superficiesRate 7 false).den = 100 := by decide
example : (superficiesRate 7 true).den = 100 := by decide

-- 評価額（土地時価 × 割合、切り捨て）
example : superficiesValue 1_000_000 10 false = 50_000 := by decide
example : superficiesValue 1_000_000 11 false = 100_000 := by decide
example : superficiesValue 1_000_000 25 false = 300_000 := by decide
example : superficiesValue 1_000_000 26 false = 400_000 := by decide
example : superficiesValue 1_000_000 31 false = 500_000 := by decide
example : superficiesValue 1_000_000 51 false = 900_000 := by decide
example : superficiesValue 1_000_000 5 true = 400_000 := by decide
example : superficiesValue 1_001 0 false = 50 := by decide
example : superficiesValue 999 51 false = 899 := by decide

-- 第25条（明確な部分のみ）
example : art25NoSurrenderValue 1_000_000 = 900_000 := by decide
example : art25NoSurrenderValue 101 = 90 := by decide
example : art25NoSurrenderValue 0 = 0 := by decide

end JapanTaxLaw.InheritanceAssetValuation
