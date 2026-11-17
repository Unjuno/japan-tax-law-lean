import JapanTaxLaw.TaxFinance

/-!
# RegistryDesignTrademarkFees — 登録免許税法 別表第一（二）の意匠権・商標権・回路配置利用権の登録手数料モデル (W-U)

Sources (pinned):

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/342AC0000000035_20261101_508AC0000000021.law.json
  原文（担当範囲・正規化済み・UTF-8）: reg_ip_C.txt（十五〜十七、約1707文字）

原文の各 fee string「〇〇の件数一件につき△△円」／「債権金額千分のX」を読み、
定額型は `Money` 定数、割合型は税率定数 `TaxRate ⟨X, 1000, …⟩` と
税額関数 `base.applyFloor`（= 課税標準 × X / 1000、切り捨て）としてモデル化する。
金額は原文の日本語数字を検証して Arabic に変換した:

  【十五 意匠権の登録】
  （一）イ 相続・法人合併による移転 .......... 三千円 ....... ¥3,000
  （一）ロ その他の原因による移転 ............ 九千円 ....... ¥9,000
  （二）  専用実施権の設定又は保存 ........... 九千円 ....... ¥9,000
  （三）  質権設定／処分制限 ................ 千分の四 ..... 4/1000
  （四）イ 専用実施権等の移転（相続・合併） ... 千五百円 ..... ¥1,500
  （四）ロ 専用実施権等の移転（その他） ....... 三千円 ....... ¥3,000
  （五）イ 質権の信託 ...................... 千分の二 ..... 2/1000
  （五）ロ 質権以外の権利の信託 .............. 三千円 ....... ¥3,000
  （六）  付記・仮・回復・更正／変更 ......... 千円 ......... ¥1,000
  （七）  登録の抹消 ....................... 千円 ......... ¥1,000
  【十六 商標権の登録】
  （一）イ 相続・法人合併による移転 .......... 三千円 ....... ¥3,000
  （一）ロ その他の原因による移転 ............ 三万円 ....... ¥30,000
  （二）  専用使用権／通常使用権の設定・保存 . 三万円 ....... ¥30,000
  （三）  質権設定／処分制限 ................ 千分の四 ..... 4/1000
  （四）イ 使用権等の移転（相続・合併） ....... 三千円 ....... ¥3,000
  （四）ロ 使用権等の移転（その他） ........... 九千円 ....... ¥9,000
  （五）イ 質権の信託 ...................... 千分の二 ..... 2/1000
  （五）ロ 質権以外の権利の信託 .............. 九千円 ....... ¥9,000
  （六）  付記・仮・回復・更正／変更 ......... 千円 ......... ¥1,000
  （七）  登録の抹消 ....................... 千円 ......... ¥1,000
  【十七 回路配置利用権の登録】
  （一）  設定の登録 ....................... 一万八千円 ... ¥18,000
  （二）イ 相続・法人合併による移転 .......... 三千円 ....... ¥3,000
  （二）ロ その他の原因による移転 ............ 九千円 ....... ¥9,000
  （三）  専用利用権／通常利用権の設定 ....... 九千円 ....... ¥9,000
  （四）  質権設定／処分制限 ................ 千分の四 ..... 4/1000
  （五）イ 利用権等の移転（相続・合併） ....... 千五百円 ..... ¥1,500
  （五）ロ 利用権等の移転（その他） ........... 三千円 ....... ¥3,000
  （六）イ 質権の信託 ...................... 千分の二 ..... 2/1000
  （六）ロ 質権以外の権利の信託 .............. 三千円 ....... ¥3,000
  （七）  付記・仮・回復・更正／変更 ......... 千円 ......... ¥1,000
  （八）  登録の抹消 ....................... 千円 ......... ¥1,000

Scope & honest boundaries:

* 担当範囲原文（reg_ip_C.txt）には十五 意匠権・十六 商標権・十七 回路配置利用権の
  手数料のみが含まれ、**育成者権の手数料は原文に存在しません**。したがって育成者権は
  本モジュールではモデル化していません（状態は STAGING_WU.md に申告）。
* 課税標準（割合型の「債権金額」）は **caller-established** とする。本モデルは与えられた
  `base` に税率を乗じる算術のみを扱い、債権金額の算定は一切行わない。
* 登記の該当性・原因の判定（相続／法人の合併／その他、設定／保存／移転／信託／抹消等）、
  「件数」の数え方、登録の種別の振り分け、軽減・免税の適用可否は **caller-established**
  とし、Bool を金額計算式に入れない。
* 定額型は「件数一件につき」の 1 件あたり定数であり、件数を掛ける Nat 掛け算は行わない
  （件数は caller-established）。
* 端数処理は `TaxRate.applyFloor`（切り捨て）に委ねる。原文は「千分のX」とし当該区分に
  端数規定を持たないため、丸め規則は per-law business data として floor を採用した
  ことをここで明示する。
* 割合型の税額は `base` が小さいと 0 になり得るため strict positivity は成り立たない。
  代わりに各税率定数の `den_pos`（well-definedness）と各税額関数の smoke を付与する。
* 別表第一の他の号・他の区分、登録免許税法全体（納税義務者・免税・軽減・税率の特例・
  他の別表）は **NOT YET COVERED**。
* Pinned evidence is in doc-comments only; all theorems claim model properties only,
  never the real legal semantics (誠実性の原則)。
-/

namespace JapanTaxLaw.RegistryDesignTrademarkFees

open JapanTaxLaw.TaxFinance

/-! === 定額型（Money 定数、1 件あたり） === -/

-- 【十五 意匠権の登録】

/-- 十五（一）イ — 意匠権の移転（相続又は法人の合併）「意匠権の件数一件につき三千円」。 -/
def designTransferInheritanceOrMergerFee : Money := 3_000

/-- 十五（一）ロ — 意匠権の移転（その他）「意匠権の件数一件につき九千円」。 -/
def designTransferOtherFee : Money := 9_000

/-- 十五（二） — 専用実施権の設定又は保存「専用実施権の件数一件につき九千円」。 -/
def designExclusiveRightEstablishmentOrPreservationFee : Money := 9_000

/-- 十五（四）イ — 専用実施権の移転等（相続・合併）「意匠権又は専用実施権の件数一件につき千五百円」。 -/
def designExclusiveRightTransferInheritanceOrMergerFee : Money := 1_500

/-- 十五（四）ロ — 専用実施権の移転等（その他）「意匠権等の件数一件につき三千円」。 -/
def designExclusiveRightTransferOtherFee : Money := 3_000

/-- 十五（五）ロ — 質権以外の権利の信託「意匠権等の件数一件につき三千円」。 -/
def designTrustNonPledgeFee : Money := 3_000

/-- 十五（六） — 付記・仮・回復・更正／変更「意匠権等の件数一件につき千円」。 -/
def designUpdateRegistrationFee : Money := 1_000

/-- 十五（七） — 登録の抹消「意匠権等の件数一件につき千円」。 -/
def designCancellationFee : Money := 1_000

-- 【十六 商標権の登録】

/-- 十六（一）イ — 商標権の移転（相続又は法人の合併）「商標権の件数一件につき三千円」。 -/
def trademarkTransferInheritanceOrMergerFee : Money := 3_000

/-- 十六（一）ロ — 商標権の移転（その他）「商標権の件数一件につき三万円」。 -/
def trademarkTransferOtherFee : Money := 30_000

/-- 十六（二） — 専用使用権又は通常使用権の設定又は保存「件数一件につき三万円」。 -/
def trademarkUseRightEstablishmentOrPreservationFee : Money := 30_000

/-- 十六（四）イ — 使用権等の移転（相続・合併）「商標権等の件数一件につき三千円」。 -/
def trademarkUseRightTransferInheritanceOrMergerFee : Money := 3_000

/-- 十六（四）ロ — 使用権等の移転（その他）「商標権等の件数一件につき九千円」。 -/
def trademarkUseRightTransferOtherFee : Money := 9_000

/-- 十六（五）ロ — 質権以外の権利の信託「商標権等の件数一件につき九千円」。 -/
def trademarkTrustNonPledgeFee : Money := 9_000

/-- 十六（六） — 付記・仮・回復・更正／変更「商標権等の件数一件につき千円」。 -/
def trademarkUpdateRegistrationFee : Money := 1_000

/-- 十六（七） — 登録の抹消「商標権等の件数一件につき千円」。 -/
def trademarkCancellationFee : Money := 1_000

-- 【十七 回路配置利用権の登録】

/-- 十七（一） — 回路配置利用権の設定「回路配置利用権の件数一件につき一万八千円」。 -/
def circuitEstablishmentFee : Money := 18_000

/-- 十七（二）イ — 回路配置利用権の移転（相続・合併）「件数一件につき三千円」。 -/
def circuitTransferInheritanceOrMergerFee : Money := 3_000

/-- 十七（二）ロ — 回路配置利用権の移転（その他）「件数一件につき九千円」。 -/
def circuitTransferOtherFee : Money := 9_000

/-- 十七（三） — 専用利用権又は通常利用権の設定「件数一件につき九千円」。 -/
def circuitUseRightEstablishmentFee : Money := 9_000

/-- 十七（五）イ — 利用権等の移転（相続・合併）「件数一件につき千五百円」。 -/
def circuitUseRightTransferInheritanceOrMergerFee : Money := 1_500

/-- 十七（五）ロ — 利用権等の移転（その他）「回路配置利用権等の件数一件につき三千円」。 -/
def circuitUseRightTransferOtherFee : Money := 3_000

/-- 十七（六）ロ — 質権以外の権利の信託「回路配置利用権等の件数一件につき三千円」。 -/
def circuitTrustNonPledgeFee : Money := 3_000

/-- 十七（七） — 付記・仮・回復・更正／変更「回路配置利用権等の件数一件につき千円」。 -/
def circuitUpdateRegistrationFee : Money := 1_000

/-- 十七（八） — 登録の抹消「回路配置利用権等の件数一件につき千円」。 -/
def circuitCancellationFee : Money := 1_000

/-! === 割合型: 税率定数（分母すべて 1000） === -/

/-- 十五（三） — 意匠権等を目的とする質権の設定／処分の制限「債権金額千分の四」。 -/
def designPledgeSecurityRate : TaxRate := ⟨4, 1000, by decide⟩

/-- 十五（五）イ — 質権の信託の登録「債権金額千分の二」。 -/
def designTrustPledgeRate : TaxRate := ⟨2, 1000, by decide⟩

/-- 十六（三） — 商標権等を目的とする質権の設定／処分の制限「債権金額千分の四」。 -/
def trademarkPledgeSecurityRate : TaxRate := ⟨4, 1000, by decide⟩

/-- 十六（五）イ — 質権の信託の登録「債権金額千分の二」。 -/
def trademarkTrustPledgeRate : TaxRate := ⟨2, 1000, by decide⟩

/-- 十七（四） — 回路配置利用権等を目的とする質権の設定／処分の制限「債権金額千分の四」。 -/
def circuitPledgeSecurityRate : TaxRate := ⟨4, 1000, by decide⟩

/-- 十七（六）イ — 質権の信託の登録「債権金額千分の二」。 -/
def circuitTrustPledgeRate : TaxRate := ⟨2, 1000, by decide⟩

/-! === 割合型: 税額関数（税額 = 債権金額 × X / 1000、applyFloor） === -/

/-- 十五（三）の税額 = 債権金額 × 4/1000。`base` は caller-established、丸めは切り捨て。 -/
def designPledgeSecurityFee (base : Money) : Money :=
  designPledgeSecurityRate.applyFloor base

/-- 十五（五）イの税額 = 債権金額 × 2/1000。`base` は caller-established、丸めは切り捨て。 -/
def designTrustPledgeFee (base : Money) : Money :=
  designTrustPledgeRate.applyFloor base

/-- 十六（三）の税額 = 債権金額 × 4/1000。`base` は caller-established、丸めは切り捨て。 -/
def trademarkPledgeSecurityFee (base : Money) : Money :=
  trademarkPledgeSecurityRate.applyFloor base

/-- 十六（五）イの税額 = 債権金額 × 2/1000。`base` は caller-established、丸めは切り捨て。 -/
def trademarkTrustPledgeFee (base : Money) : Money :=
  trademarkTrustPledgeRate.applyFloor base

/-- 十七（四）の税額 = 債権金額 × 4/1000。`base` は caller-established、丸めは切り捨て。 -/
def circuitPledgeSecurityFee (base : Money) : Money :=
  circuitPledgeSecurityRate.applyFloor base

/-- 十七（六）イの税額 = 債権金額 × 2/1000。`base` は caller-established、丸めは切り捨て。 -/
def circuitTrustPledgeFee (base : Money) : Money :=
  circuitTrustPledgeRate.applyFloor base

/-! === well-definedness（positivity） === -/

theorem designTransferInheritanceOrMergerFee_pos : designTransferInheritanceOrMergerFee > 0 := by decide
theorem designTransferOtherFee_pos : designTransferOtherFee > 0 := by decide
theorem designExclusiveRightEstablishmentOrPreservationFee_pos :
    designExclusiveRightEstablishmentOrPreservationFee > 0 := by decide
theorem designExclusiveRightTransferInheritanceOrMergerFee_pos :
    designExclusiveRightTransferInheritanceOrMergerFee > 0 := by decide
theorem designExclusiveRightTransferOtherFee_pos : designExclusiveRightTransferOtherFee > 0 := by decide
theorem designTrustNonPledgeFee_pos : designTrustNonPledgeFee > 0 := by decide
theorem designUpdateRegistrationFee_pos : designUpdateRegistrationFee > 0 := by decide
theorem designCancellationFee_pos : designCancellationFee > 0 := by decide

theorem trademarkTransferInheritanceOrMergerFee_pos : trademarkTransferInheritanceOrMergerFee > 0 := by decide
theorem trademarkTransferOtherFee_pos : trademarkTransferOtherFee > 0 := by decide
theorem trademarkUseRightEstablishmentOrPreservationFee_pos :
    trademarkUseRightEstablishmentOrPreservationFee > 0 := by decide
theorem trademarkUseRightTransferInheritanceOrMergerFee_pos :
    trademarkUseRightTransferInheritanceOrMergerFee > 0 := by decide
theorem trademarkUseRightTransferOtherFee_pos : trademarkUseRightTransferOtherFee > 0 := by decide
theorem trademarkTrustNonPledgeFee_pos : trademarkTrustNonPledgeFee > 0 := by decide
theorem trademarkUpdateRegistrationFee_pos : trademarkUpdateRegistrationFee > 0 := by decide
theorem trademarkCancellationFee_pos : trademarkCancellationFee > 0 := by decide

theorem circuitEstablishmentFee_pos : circuitEstablishmentFee > 0 := by decide
theorem circuitTransferInheritanceOrMergerFee_pos : circuitTransferInheritanceOrMergerFee > 0 := by decide
theorem circuitTransferOtherFee_pos : circuitTransferOtherFee > 0 := by decide
theorem circuitUseRightEstablishmentFee_pos : circuitUseRightEstablishmentFee > 0 := by decide
theorem circuitUseRightTransferInheritanceOrMergerFee_pos :
    circuitUseRightTransferInheritanceOrMergerFee > 0 := by decide
theorem circuitUseRightTransferOtherFee_pos : circuitUseRightTransferOtherFee > 0 := by decide
theorem circuitTrustNonPledgeFee_pos : circuitTrustNonPledgeFee > 0 := by decide
theorem circuitUpdateRegistrationFee_pos : circuitUpdateRegistrationFee > 0 := by decide
theorem circuitCancellationFee_pos : circuitCancellationFee > 0 := by decide

theorem designPledgeSecurityRate_den_pos : 0 < designPledgeSecurityRate.den := by decide
theorem designTrustPledgeRate_den_pos : 0 < designTrustPledgeRate.den := by decide
theorem trademarkPledgeSecurityRate_den_pos : 0 < trademarkPledgeSecurityRate.den := by decide
theorem trademarkTrustPledgeRate_den_pos : 0 < trademarkTrustPledgeRate.den := by decide
theorem circuitPledgeSecurityRate_den_pos : 0 < circuitPledgeSecurityRate.den := by decide
theorem circuitTrustPledgeRate_den_pos : 0 < circuitTrustPledgeRate.den := by decide

/-- 割合型手数料額は caller-established な課税標準について単調非減少。 -/
theorem rateFee_mono (rate : TaxRate) {a b : Money} (h : a ≤ b) :
    rate.applyFloor a ≤ rate.applyFloor b := by
  simp [TaxRate.applyFloor]
  exact Nat.div_le_div_right (Nat.mul_le_mul_right rate.num h)

/-! === smoke（各 def、すべて kernel-decide） === -/

-- 定額（原文どおりの額）
example : designTransferInheritanceOrMergerFee = 3_000 := by decide
example : designTransferOtherFee = 9_000 := by decide
example : designExclusiveRightEstablishmentOrPreservationFee = 9_000 := by decide
example : designExclusiveRightTransferInheritanceOrMergerFee = 1_500 := by decide
example : designExclusiveRightTransferOtherFee = 3_000 := by decide
example : designTrustNonPledgeFee = 3_000 := by decide
example : designUpdateRegistrationFee = 1_000 := by decide
example : designCancellationFee = 1_000 := by decide
example : trademarkTransferInheritanceOrMergerFee = 3_000 := by decide
example : trademarkTransferOtherFee = 30_000 := by decide
example : trademarkUseRightEstablishmentOrPreservationFee = 30_000 := by decide
example : trademarkUseRightTransferInheritanceOrMergerFee = 3_000 := by decide
example : trademarkUseRightTransferOtherFee = 9_000 := by decide
example : trademarkTrustNonPledgeFee = 9_000 := by decide
example : trademarkUpdateRegistrationFee = 1_000 := by decide
example : trademarkCancellationFee = 1_000 := by decide
example : circuitEstablishmentFee = 18_000 := by decide
example : circuitTransferInheritanceOrMergerFee = 3_000 := by decide
example : circuitTransferOtherFee = 9_000 := by decide
example : circuitUseRightEstablishmentFee = 9_000 := by decide
example : circuitUseRightTransferInheritanceOrMergerFee = 1_500 := by decide
example : circuitUseRightTransferOtherFee = 3_000 := by decide
example : circuitTrustNonPledgeFee = 3_000 := by decide
example : circuitUpdateRegistrationFee = 1_000 := by decide
example : circuitCancellationFee = 1_000 := by decide

-- 税率定数: 分子・分母が原文どおり（千分の四 / 千分の二）
example : designPledgeSecurityRate.num = 4 := by decide
example : designPledgeSecurityRate.den = 1000 := by decide
example : designTrustPledgeRate.num = 2 := by decide
example : designTrustPledgeRate.den = 1000 := by decide
example : trademarkPledgeSecurityRate.num = 4 := by decide
example : trademarkPledgeSecurityRate.den = 1000 := by decide
example : trademarkTrustPledgeRate.num = 2 := by decide
example : trademarkTrustPledgeRate.den = 1000 := by decide
example : circuitPledgeSecurityRate.num = 4 := by decide
example : circuitPledgeSecurityRate.den = 1000 := by decide
example : circuitTrustPledgeRate.num = 2 := by decide
example : circuitTrustPledgeRate.den = 1000 := by decide

-- 4/1000 の税額関数（0, 999→3, 1000→4, 1_000_000→4_000）
example : designPledgeSecurityFee 0 = 0 := by decide
example : designPledgeSecurityFee 999 = 3 := by decide
example : designPledgeSecurityFee 1000 = 4 := by decide
example : designPledgeSecurityFee 1_000_000 = 4_000 := by decide
example : trademarkPledgeSecurityFee 0 = 0 := by decide
example : trademarkPledgeSecurityFee 999 = 3 := by decide
example : trademarkPledgeSecurityFee 1000 = 4 := by decide
example : trademarkPledgeSecurityFee 1_000_000 = 4_000 := by decide
example : circuitPledgeSecurityFee 0 = 0 := by decide
example : circuitPledgeSecurityFee 999 = 3 := by decide
example : circuitPledgeSecurityFee 1000 = 4 := by decide
example : circuitPledgeSecurityFee 1_000_000 = 4_000 := by decide

-- 2/1000 の税額関数（0, 999→1, 1000→2, 1_000_000→2_000）
example : designTrustPledgeFee 0 = 0 := by decide
example : designTrustPledgeFee 999 = 1 := by decide
example : designTrustPledgeFee 1000 = 2 := by decide
example : designTrustPledgeFee 1_000_000 = 2_000 := by decide
example : trademarkTrustPledgeFee 0 = 0 := by decide
example : trademarkTrustPledgeFee 999 = 1 := by decide
example : trademarkTrustPledgeFee 1000 = 2 := by decide
example : trademarkTrustPledgeFee 1_000_000 = 2_000 := by decide
example : circuitTrustPledgeFee 0 = 0 := by decide
example : circuitTrustPledgeFee 999 = 1 := by decide
example : circuitTrustPledgeFee 1000 = 2 := by decide
example : circuitTrustPledgeFee 1_000_000 = 2_000 := by decide

end JapanTaxLaw.RegistryDesignTrademarkFees
