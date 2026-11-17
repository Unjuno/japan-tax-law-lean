import JapanTaxLaw.TaxFinance
import JapanTaxLaw.DelinquencyTax

/-!
# RefundInterest — 国税通則法 art. 58（還付加算金）L4 モデル

Source (pinned):

  Law id: 337AC0000000066
  Revision: 337AC0000000066_20261101_507AC0000000013
  Amendment enforcement date: 2026-11-01
  Raw snapshot sha256: (data/raw/337AC0000000066_20261101_507AC0000000013.law.json,
   revision CurrentEnforced per data/INVENTORY.json)

Models the rate and day-count constants of art. 58 — pinned bytes 逐語:

  1項: 「還付金等を還付し、又は充当する場合には、次の各号に掲げる還付金等の区分に従い
        当該各号に定める日の翌日からその還付のための支払決定の日…までの期間…
        の日数に応じ、その金額に年七・三パーセントの割合を乗じて計算した金額
        （以下「還付加算金」という。）をその還付し、又は充当すべき金額に加算しなければならない。」
  2項一: 「その差押命令又は差押処分の送達を受けた日の翌日から七日を経過した日までの期間」
  2項二: 「その仮差押えがされている期間」

What is modelled (fidelity to pinned bytes):

  * 利率 年7.3% — **既存 `delinquencyLowRate` (73/1000) を再利用**（同一の法定利率）。
    art. 58 が「年七・三パーセント」と明記する値と art. 60 の低率が同一であることを
    `refundInterestRate_eq_delinquencyLowRate` で固定する。
  * 2項一の控除期間「七日」を `attachmentExclusionDays : Nat := 7` として固定。
  * 2項二の控除は「仮差押えがされている期間」— 日数は caller-established。

What is NOT modelled (honest boundary):

  * **日割りの分母（年何日）**：art. 60 と同じく、pinned 条文は「年7.3%の割合を乗じて計算」
    としか書かず日数換算の分母を明示しない。架空の 365 等を仮定して
    「金額×率×日数/365」を作ることは検証規則違反のため行わない。
  * 還付加算金の金額そのもの、1項各号の起算日の特定（納付日／法定納期限／更正請求から三月／
    更正から一月／政令で定める日）、支払決定日の特定 — すべて caller-established。
  * 3項（二回以上の分割納付の過誤納みなし）、4項（法律改正による過納）、5項〜7項、
    art. 59（還付）、art. 57 の還付加算金に関する特例 — NOT YET COVERED。
  * 転記監査は fidelity-only であり法的正しさを保証しない。

Pinned evidence in doc-comments only; all theorems claim model properties only.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- art. 58(1) — 還付加算金の利率 年七・三パーセント。
    art. 60 の延滞税低率と同一値を再利用する。 -/
def refundInterestRate : TaxRate := delinquencyLowRate

/-- art. 58 の利率は art. 60 の低率（7.3%）と等しい。 -/
theorem refundInterestRate_eq_delinquencyLowRate :
    refundInterestRate = delinquencyLowRate := rfl

/-- art. 58(2)一 — 差押命令等の送達日の翌日から七日を経過する日までの控除期間。 -/
def attachmentExclusionDays : Nat := 7

theorem attachmentExclusionDays_eq : attachmentExclusionDays = 7 := rfl

-- ==== kernel-decided smoke checks ====

example : refundInterestRate = ⟨73, 1000, by decide⟩ := by rfl
example : refundInterestRate = delinquencyLowRate := by rfl
example : attachmentExclusionDays = 7 := by decide

end JapanTaxLaw
