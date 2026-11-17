import JapanTaxLaw.TaxFinance

/-!
# RegistryRealEstateFeesP1C — 登録免許税法 別表第一（一）区分（十一）〜（十五）の手数料モデル (W-R)

Sources (pinned):

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/342AC0000000035_20261101_508AC0000000021.law.json
  担当範囲原文: registry_app1_1_C.txt（区分（十一）〜（十五）、正規化済み・UTF-8）

Models 別表第一（一）の区分（十一）〜（十五）の各手数料（pinned raw bytes 逐語、
金額・割合は日本語数字で検証して Arabic に変換）:

  （十一）相続財産の分離の登記
    イ 所有権の分離の登記 … 不動産の価額千分の四                 → 4/1000
    ロ 所有権以外の権利の分離の登記 … 不動産の価額千分の二       → 2/1000

  （十二）仮登記
    イ 所有権の保存の仮登記 … 不動産の価額千分の二               → 2/1000
    ロ（１）相続又は法人の合併による移転の仮登記 … 千分の二        → 2/1000
    ロ（２）共有物の分割による移転の仮登記 … 千分の二             → 2/1000
    ロ（３）その他の原因による移転の仮登記 … 千分の十             → 10/1000
    ハ（１）設定若しくは転貸の仮登記 … 千分の五                   → 5/1000
    ハ（２）相続又は法人の合併による移転の仮登記 … 千分の一        → 1/1000
    ハ（３）共有に係る権利の分割による移転の仮登記 … 千分の一      → 1/1000
    ハ（４）その他の原因による移転の仮登記 … 千分の五             → 5/1000
    ニ 配偶者居住権の設定の仮登記 … 千分の一                     → 1/1000
    ホ（１）所有権の信託の仮登記 … 千分の二                       → 2/1000
    ホ（２）先取特権、質権若しくは抵当権の信託の仮登記 …
             債権金額又は極度金額千分の一                         → 1/1000（債権金額基準）
    ホ（３）その他の権利の信託の仮登記 … 千分の一                 → 1/1000
    ヘ（１）所有権の分離の仮登記 … 千分の二                       → 2/1000
    ヘ（２）所有権以外の権利の分離の仮登記 … 千分の一             → 1/1000
    ト その他の仮登記 … 不動産の個数一個につき千円                → ¥1,000 / 個

  （十三）所有権の登記のある不動産の表示の変更の登記
    イ 分筆・分割・区分 … 一個につき千円                         → ¥1,000 / 個
    ロ 合筆・合併 … 一個につき千円                               → ¥1,000 / 個

  （十四）付記登記、抹消された登記の回復の登記又は登記事項の更正若しくは変更の登記
        … 不動産の個数一個につき千円                             → ¥1,000 / 個

  （十五）登記の抹消 … 不動産の個数一個につき千円                → ¥1,000 / 個
        （同一の申請書により二十個を超える場合）一件につき二万円  → ¥20,000 / 件

Scope & honest boundaries:

* 割合型は税率定数（TaxRate）と税額関数 `課税標準 × X / 1000`（floor）を定義する。
  定額型は一件／一個あたりの固定額定数を定義する。
* 課税標準（不動産の価額／債権金額／極度金額）・不動産の個数・申請件数はすべて
  **caller-established** とし、ここでは受け取る値に税率・単価を適用する算術のみを扱う。
* 各区分への該当性（相続・合併の有無、共有物の分割かその他か、設定・転貸か移転か、
  表題部の抹消の除外、二十個超の該当性 等）は **caller-established** とし、
  **Bool を金額式に入れない**。（十五）の「二十個超」は適用判定を式に込めず、
  一個あたり ¥1,000 と二十個超の一件あたり ¥20,000 の **両方の定数**を定義する
  （どちらを適用するかは呼び出し側が判断する）。
* 株主総会等の他の登録免許税法区分、端数処理の通則法的詳細、納付手続は射程外。
* 区分（一）〜（十）は NOT YET COVERED（W-R は（十一）〜（十五）のみ担当）。

Pinned evidence in doc-comments only; all theorems claim model properties only,
never the real legal semantics (誠実性の原則 — Pin ↔ 原文一致 is the trust boundary).
-/

namespace JapanTaxLaw.RegistryRealEstateFeesP1C

open JapanTaxLaw.TaxFinance

-- =====================================================================
-- 割合型: 税率定数（千分率）。課税標準は caller-established。
-- =====================================================================

/-- （十一）イ 所有権の分離の登記「不動産の価額千分の四」(4/1000)。 -/
def inheritanceSeparationOwnershipRate : TaxRate := ⟨4, 1000, by decide⟩

/-- （十一）ロ 所有権以外の権利の分離の登記「不動産の価額千分の二」(2/1000)。 -/
def inheritanceSeparationOtherRate : TaxRate := ⟨2, 1000, by decide⟩

/-- （十二）イ 所有権の保存の仮登記「不動産の価額千分の二」(2/1000)。 -/
def provisionalOwnershipPreservationRate : TaxRate := ⟨2, 1000, by decide⟩

/-- （十二）ロ（１）相続又は法人の合併による移転の仮登記「千分の二」(2/1000)。 -/
def provisionalTransferInheritanceMergerRate : TaxRate := ⟨2, 1000, by decide⟩

/-- （十二）ロ（２）共有物の分割による移転の仮登記「千分の二」(2/1000)。 -/
def provisionalTransferCoOwnershipDivisionRate : TaxRate := ⟨2, 1000, by decide⟩

/-- （十二）ロ（３）その他の原因による移転の仮登記「千分の十」(10/1000)。 -/
def provisionalTransferOtherRate : TaxRate := ⟨10, 1000, by decide⟩

/-- （十二）ハ（１）設定若しくは転貸の仮登記「千分の五」(5/1000)。 -/
def provisionalSettingLeaseRate : TaxRate := ⟨5, 1000, by decide⟩

/-- （十二）ハ（２）相続又は法人の合併による移転の仮登記「千分の一」(1/1000)。 -/
def provisionalInheritanceMergerTransferRate : TaxRate := ⟨1, 1000, by decide⟩

/-- （十二）ハ（３）共有に係る権利の分割による移転の仮登記「千分の一」(1/1000)。 -/
def provisionalCoOwnershipDivisionTransferRate : TaxRate := ⟨1, 1000, by decide⟩

/-- （十二）ハ（４）その他の原因による移転の仮登記「千分の五」(5/1000)。 -/
def provisionalOtherTransferRate : TaxRate := ⟨5, 1000, by decide⟩

/-- （十二）ニ 配偶者居住権の設定の仮登記「千分の一」(1/1000)。 -/
def provisionalSpouseResidenceRightRate : TaxRate := ⟨1, 1000, by decide⟩

/-- （十二）ホ（１）所有権の信託の仮登記「千分の二」(2/1000)。 -/
def provisionalTrustOwnershipRate : TaxRate := ⟨2, 1000, by decide⟩

/-- （十二）ホ（２）先取特権、質権若しくは抵当権の信託の仮登記
    「債権金額又は極度金額千分の一」(1/1000)。課税標準は不動産の価額ではなく
    債権金額／極度金額（原文どおり）。 -/
def provisionalTrustLienRate : TaxRate := ⟨1, 1000, by decide⟩

/-- （十二）ホ（３）その他の権利の信託の仮登記「千分の一」(1/1000)。 -/
def provisionalTrustOtherRightRate : TaxRate := ⟨1, 1000, by decide⟩

/-- （十二）ヘ（１）所有権の分離の仮登記「千分の二」(2/1000)。 -/
def provisionalSeparationOwnershipRate : TaxRate := ⟨2, 1000, by decide⟩

/-- （十二）ヘ（２）所有権以外の権利の分離の仮登記「千分の一」(1/1000)。 -/
def provisionalSeparationOtherRate : TaxRate := ⟨1, 1000, by decide⟩

-- =====================================================================
-- 割合型: 税額 = 課税標準 × X / 1000（floor）。課税標準は caller-established。
-- =====================================================================

/-- （十一）イ 税額 = 不動産の価額 × 4 / 1000。 -/
def inheritanceSeparationOwnershipFee (base : Money) : Money :=
  inheritanceSeparationOwnershipRate.applyFloor base

/-- （十一）ロ 税額 = 不動産の価額 × 2 / 1000。 -/
def inheritanceSeparationOtherFee (base : Money) : Money :=
  inheritanceSeparationOtherRate.applyFloor base

/-- （十二）イ 税額 = 不動産の価額 × 2 / 1000。 -/
def provisionalOwnershipPreservationFee (base : Money) : Money :=
  provisionalOwnershipPreservationRate.applyFloor base

/-- （十二）ロ（１）税額 = 不動産の価額 × 2 / 1000。 -/
def provisionalTransferInheritanceMergerFee (base : Money) : Money :=
  provisionalTransferInheritanceMergerRate.applyFloor base

/-- （十二）ロ（２）税額 = 不動産の価額 × 2 / 1000。 -/
def provisionalTransferCoOwnershipDivisionFee (base : Money) : Money :=
  provisionalTransferCoOwnershipDivisionRate.applyFloor base

/-- （十二）ロ（３）税額 = 不動産の価額 × 10 / 1000。 -/
def provisionalTransferOtherFee (base : Money) : Money :=
  provisionalTransferOtherRate.applyFloor base

/-- （十二）ハ（１）税額 = 不動産の価額 × 5 / 1000。 -/
def provisionalSettingLeaseFee (base : Money) : Money :=
  provisionalSettingLeaseRate.applyFloor base

/-- （十二）ハ（２）税額 = 不動産の価額 × 1 / 1000。 -/
def provisionalInheritanceMergerTransferFee (base : Money) : Money :=
  provisionalInheritanceMergerTransferRate.applyFloor base

/-- （十二）ハ（３）税額 = 不動産の価額 × 1 / 1000。 -/
def provisionalCoOwnershipDivisionTransferFee (base : Money) : Money :=
  provisionalCoOwnershipDivisionTransferRate.applyFloor base

/-- （十二）ハ（４）税額 = 不動産の価額 × 5 / 1000。 -/
def provisionalOtherTransferFee (base : Money) : Money :=
  provisionalOtherTransferRate.applyFloor base

/-- （十二）ニ 税額 = 不動産の価額 × 1 / 1000。 -/
def provisionalSpouseResidenceRightFee (base : Money) : Money :=
  provisionalSpouseResidenceRightRate.applyFloor base

/-- （十二）ホ（１）税額 = 不動産の価額 × 2 / 1000。 -/
def provisionalTrustOwnershipFee (base : Money) : Money :=
  provisionalTrustOwnershipRate.applyFloor base

/-- （十二）ホ（２）税額 = 債権金額／極度金額 × 1 / 1000。基準は原文どおり債権金額。 -/
def provisionalTrustLienFee (base : Money) : Money :=
  provisionalTrustLienRate.applyFloor base

/-- （十二）ホ（３）税額 = 不動産の価額 × 1 / 1000。 -/
def provisionalTrustOtherRightFee (base : Money) : Money :=
  provisionalTrustOtherRightRate.applyFloor base

/-- （十二）ヘ（１）税額 = 不動産の価額 × 2 / 1000。 -/
def provisionalSeparationOwnershipFee (base : Money) : Money :=
  provisionalSeparationOwnershipRate.applyFloor base

/-- （十二）ヘ（２）税額 = 不動産の価額 × 1 / 1000。 -/
def provisionalSeparationOtherFee (base : Money) : Money :=
  provisionalSeparationOtherRate.applyFloor base

-- =====================================================================
-- 定額型: 一件／一個あたりの固定額。個数・件数は caller-established。
-- =====================================================================

/-- （十二）ト その他の仮登記「不動産の個数一個につき千円」(¥1,000/個)。 -/
def provisionalOtherPerItemFee : Money := 1_000

/-- （十三）イ 分筆・分割・区分後の不動産「一個につき千円」(¥1,000/個)。 -/
def displayChangeParcelPerItemFee : Money := 1_000

/-- （十三）ロ 合筆・合併後の不動産「一個につき千円」(¥1,000/個)。 -/
def displayChangeMergerPerItemFee : Money := 1_000

/-- （十四）付記登記等「不動産の個数一個につき千円」(¥1,000/個)。 -/
def additionalRegistrationPerItemFee : Money := 1_000

/-- （十五）登記の抹消「不動産の個数一個につき千円」(¥1,000/個)。 -/
def cancellationPerItemFee : Money := 1_000

/-- （十五）ただし書 同一申請書で二十個超「申請件数一件につき二万円」(¥20,000/件)。
    二十個超の該当性は caller-established（式に Bool を入れない）。 -/
def cancellationOver20PerCaseFee : Money := 20_000

-- =====================================================================
-- 税率分母の正性（well-definedness）— positivity smoke
-- =====================================================================

theorem inheritanceSeparationOwnershipRate_den_pos : 0 < inheritanceSeparationOwnershipRate.den := by decide
theorem inheritanceSeparationOtherRate_den_pos : 0 < inheritanceSeparationOtherRate.den := by decide
theorem provisionalOwnershipPreservationRate_den_pos : 0 < provisionalOwnershipPreservationRate.den := by decide
theorem provisionalTransferInheritanceMergerRate_den_pos : 0 < provisionalTransferInheritanceMergerRate.den := by decide
theorem provisionalTransferCoOwnershipDivisionRate_den_pos : 0 < provisionalTransferCoOwnershipDivisionRate.den := by decide
theorem provisionalTransferOtherRate_den_pos : 0 < provisionalTransferOtherRate.den := by decide
theorem provisionalSettingLeaseRate_den_pos : 0 < provisionalSettingLeaseRate.den := by decide
theorem provisionalInheritanceMergerTransferRate_den_pos : 0 < provisionalInheritanceMergerTransferRate.den := by decide
theorem provisionalCoOwnershipDivisionTransferRate_den_pos : 0 < provisionalCoOwnershipDivisionTransferRate.den := by decide
theorem provisionalOtherTransferRate_den_pos : 0 < provisionalOtherTransferRate.den := by decide
theorem provisionalSpouseResidenceRightRate_den_pos : 0 < provisionalSpouseResidenceRightRate.den := by decide
theorem provisionalTrustOwnershipRate_den_pos : 0 < provisionalTrustOwnershipRate.den := by decide
theorem provisionalTrustLienRate_den_pos : 0 < provisionalTrustLienRate.den := by decide
theorem provisionalTrustOtherRightRate_den_pos : 0 < provisionalTrustOtherRightRate.den := by decide
theorem provisionalSeparationOwnershipRate_den_pos : 0 < provisionalSeparationOwnershipRate.den := by decide
theorem provisionalSeparationOtherRate_den_pos : 0 < provisionalSeparationOtherRate.den := by decide

-- =====================================================================
-- 税額関数の positivity / kernel-decide smoke（base = 1000 → 額 = X）
-- =====================================================================

example : inheritanceSeparationOwnershipFee 0 = 0 := by decide
example : inheritanceSeparationOwnershipFee 1000 = 4 := by decide
example : 0 < inheritanceSeparationOwnershipFee 1000 := by decide
example : inheritanceSeparationOtherFee 1000 = 2 := by decide
example : 0 < inheritanceSeparationOtherFee 1000 := by decide
example : provisionalOwnershipPreservationFee 1000 = 2 := by decide
example : 0 < provisionalOwnershipPreservationFee 1000 := by decide
example : provisionalTransferInheritanceMergerFee 1000 = 2 := by decide
example : 0 < provisionalTransferInheritanceMergerFee 1000 := by decide
example : provisionalTransferCoOwnershipDivisionFee 1000 = 2 := by decide
example : 0 < provisionalTransferCoOwnershipDivisionFee 1000 := by decide
example : provisionalTransferOtherFee 1000 = 10 := by decide
example : 0 < provisionalTransferOtherFee 1000 := by decide
example : provisionalSettingLeaseFee 1000 = 5 := by decide
example : 0 < provisionalSettingLeaseFee 1000 := by decide
example : provisionalInheritanceMergerTransferFee 1000 = 1 := by decide
example : 0 < provisionalInheritanceMergerTransferFee 1000 := by decide
example : provisionalCoOwnershipDivisionTransferFee 1000 = 1 := by decide
example : 0 < provisionalCoOwnershipDivisionTransferFee 1000 := by decide
example : provisionalOtherTransferFee 1000 = 5 := by decide
example : 0 < provisionalOtherTransferFee 1000 := by decide
example : provisionalSpouseResidenceRightFee 1000 = 1 := by decide
example : 0 < provisionalSpouseResidenceRightFee 1000 := by decide
example : provisionalTrustOwnershipFee 1000 = 2 := by decide
example : 0 < provisionalTrustOwnershipFee 1000 := by decide
example : provisionalTrustLienFee 1000 = 1 := by decide
example : 0 < provisionalTrustLienFee 1000 := by decide
example : provisionalTrustOtherRightFee 1000 = 1 := by decide
example : 0 < provisionalTrustOtherRightFee 1000 := by decide
example : provisionalSeparationOwnershipFee 1000 = 2 := by decide
example : 0 < provisionalSeparationOwnershipFee 1000 := by decide
example : provisionalSeparationOtherFee 1000 = 1 := by decide
example : 0 < provisionalSeparationOtherFee 1000 := by decide

-- =====================================================================
-- 定額型の positivity / kernel-decide smoke
-- =====================================================================

theorem provisionalOtherPerItemFee_pos : provisionalOtherPerItemFee > 0 := by decide
theorem displayChangeParcelPerItemFee_pos : displayChangeParcelPerItemFee > 0 := by decide
theorem displayChangeMergerPerItemFee_pos : displayChangeMergerPerItemFee > 0 := by decide
theorem additionalRegistrationPerItemFee_pos : additionalRegistrationPerItemFee > 0 := by decide
theorem cancellationPerItemFee_pos : cancellationPerItemFee > 0 := by decide
theorem cancellationOver20PerCaseFee_pos : cancellationOver20PerCaseFee > 0 := by decide

example : provisionalOtherPerItemFee = 1_000 := by decide
example : displayChangeParcelPerItemFee = 1_000 := by decide
example : displayChangeMergerPerItemFee = 1_000 := by decide
example : additionalRegistrationPerItemFee = 1_000 := by decide
example : cancellationPerItemFee = 1_000 := by decide
example : cancellationOver20PerCaseFee = 20_000 := by decide

end JapanTaxLaw.RegistryRealEstateFeesP1C
