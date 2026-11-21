import JapanTaxLaw.TaxFinance

/-
# RegistrationTaxTruncation30k — 登録免許税法施行令 第二十九条（三万円未満の端数の切捨て）bounded L4 モデル

Pinned source:
  Law id: 342CO0000000146
  Official title: 登録免許税法施行令 (source `revision_info.law_title`; CabinetOrder).
    The task label 「登録免許税法施行規則」 is kept verbatim in the review heading
    but is NOT the official title (BY-DESIGN / CONFIRMED correction in the review).
  Revision: 342CO0000000146_20261001_507CO0000000124  (current-enforced;
    enforcement 2026-10-01, amendment law 507CO0000000124)
  Raw snapshot: data/raw/342CO0000000146_20261001_507CO0000000124.law.json
  Raw snapshot sha256: 0fc3f9ca8c85fa0dbafec4de836a9c1cbf7153c01e58f01b25995aa29ec9aa2b
    (raw bytes 178197; matches INVENTORY.json `raw_snapshot.source_sha256`)
  Statutory article: 第二十九条 (raw JSON Article attr.Num = "29",
    caption （印紙納付ができる場合）; the needle is in 第二号).

原文逐語（pinned, 一字一句改変なし）:
  「登記等につき課されるべき登録免許税の額の三万円未満の端数の部分の登録免許税を納付する場合」

Variable contract:
  amount : Nat — 登録免許税の額, unit 円 (whole yen), caller-established.
  三万円未満の端数 = amount % 30_000, whose value is < 30_000.
  truncUnit : Nat := 30_000 — 三万円 = 3 × 10^4 円.
  truncate30k amount := amount - amount % truncUnit — 角捨て (truncation DOWN
    to a whole multiple of 30,000); NOT round-to-nearest (四捨五入ではない).

Scope: ONLY the explicit numeric truncation (三万円未満の端数を切り捨て、
  30,000 円単位への切下げ) is modelled. The eligibility conditions for stamp
  payment (第一号・第二号・第三号), the公示 by 法務局/地方法務局の長, the
  登記機関の認定, other articles, supplementary provisions and every legal
  determination are NOT MODELLED. No legal review is provided.
  This is the ¥30,000 variant of the same pattern used by the earlier
  ThousandYenTruncation model (¥1,000, 石油ガス譲与税法施行規則 art.5),
  but for a different statute and article.

No `sorry`, `admit`, `axiom`, `by_cases` or `Classical.choice`.
-/

namespace JapanTaxLaw.RegistrationTaxTruncation30k

/-- 端数処理の粒度 = 三万円 = 30,000 円。 -/
def truncUnit : Nat := 30_000

/-- 三万円未満の端数を角捨てした金額（30,000 円単位への切下げ、方向は DOWN）。 -/
def truncate30k (amount : Nat) : Nat :=
  amount - amount % truncUnit

-- Kernel-decided spot checks (the reusable statements are the theorems below).
example : truncUnit = 30_000 := by decide
example : truncate30k 0 = 0 := by decide
example : truncate30k 29999 = 0 := by decide
example : truncate30k 30000 = 30000 := by decide
example : truncate30k 45000 = 30000 := by decide
example : truncate30k 60000 = 60000 := by decide

/-- 登録免許税の額が 0 なら切捨て結果も 0。 -/
theorem truncate30k_zero : truncate30k 0 = 0 := by
  decide

/-- 三万円未満（29,999 円）はすべて端数として控除され 0 になる。 -/
theorem truncate30k_29999 : truncate30k 29999 = 0 := by
  decide

/-- ちょうど三万円は端数がなく、そのまま 30,000 円。 -/
theorem truncate30k_30000 : truncate30k 30000 = 30000 := by
  decide

/-- 45,000 円は 30,000 円へ角捨てされる。 -/
theorem truncate30k_45000 : truncate30k 45000 = 30000 := by
  decide

/-- 60,000 円は 30,000 円の倍数なのでそのまま 60,000 円。 -/
theorem truncate30k_60000 : truncate30k 60000 = 60000 := by
  decide

end JapanTaxLaw.RegistrationTaxTruncation30k
