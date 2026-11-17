# STAGING — W-AA（登録免許税法 別表第一（二）二十六〜三十一 投資法人・有限責任事業組合・限定責任信託・個人の商業登記・船舶管理人・夫婦財産契約の手数料 L4 モデル）受け渡しメモ

> 実装担当 W-AA からメインセッション（統合担当）への受け渡し用。
> ブランチ操作・add/commit/push/merge は一切していません。
> 書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。

## 0. 対象ファイル / pinned source

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/RegistryTrustMarriageFees.lean` | 新規 |
| `JapanTaxLaw/RegistryTrustMarriageFeesSpec.lean` | 新規 |
| `JapanTaxLaw/RegistryTrustMarriageFeesTests.lean` | 新規 |
| `docs/STAGING_WAA.md` | 新規（本ファイル） |

pinned source: `data/raw/342AC0000000035_20261101_508AC0000000021.law.json`
law id `342AC0000000035` / revision `342AC0000000035_20261101_508AC0000000021`
amendment enforcement date `2026-11-01`（RegistrationTax / RegistrationCommercialTax /
RegistrationCommercialTaxTable 各モジュールと同一ピン）。

担当範囲原文: `C:\Users\junny\AppData\Local\Temp\opencode\reg_rem_C.txt`
（UTF-8、正規化後 1,926 文字）。冒頭の「つき一万円」は二十五（三）の末尾、
末尾の「三十二　人の資格の登録若しくは認定又は技能証明（」は三十二号の見出しで、
いずれも不完全な断片のため対象外。原文の fully-formed な fee string は
二十六〜三十一に存在し、すべてモデル化した。

**スコープ判定の正直な申告**: 割当の見出しは「二十六〜二十九」だが、括弧内の
「信託」= 二十八の二 限定責任信託、「夫婦財産契約」= 三十一 は数値範囲外であり、
提供原文も二十六〜三十一を含む。「原文の各 fee string を読み…モデル化」の指示に
従い、原文に存在する二十六／二十七／二十八／二十八の二／二十九／三十／三十一を
漏れなく対象とした（二十八 投資事業有限責任組合・二十九 個人の商業登記・
三十 船舶管理人も含む）。

Namespace: `JapanTaxLaw.RegistryTrustMarriageFees`（専用サブ名前空間。
既存の `RegistrationCommercialTaxTable.lean` 等は `JapanTaxLaw` 直下であり衝突しない）。
`open JapanTaxLaw.TaxFinance`（`Money = Nat`）。本範囲はすべて定額であり、
小数点率（千分の二・五等）は存在しないため **TaxRate 定数は導入していない**
（分母 10000 の 10 倍過大バグ警戒対象なし）。

## 1. 追加した宣言一覧

原文を一字も誤らず読み、日本語金額を Arabic 円額に確定（`Money` 定数 45 件、
すべて「申請件数一件につき」の 1 件あたり単価。件数乗算なし）:

- 二十六 投資法人の登記（3 件）: 30,000 / 15,000 / 10,000
- 二十七 有限責任事業組合契約の登記（12 件）:
  （一）イ 60,000・ロ 60,000・ハ 30,000・ニ 10,000・ホ 30,000・ヘ 30,000・
  ト 20,000・チ 20,000／（二）イ 6,000・ロ 6,000・ハ 2,000・ニ 6,000
- 二十八 投資事業有限責任組合契約の登記（8 件）:
  （一）イ 30,000・ロ 15,000・ハ 10,000・ニ 10,000／
  （二）イ 6,000・ロ 6,000・ハ 2,000・ニ 6,000
- 二十八の二 限定責任信託の登記（9 件）:
  （一）30,000・（二）15,000・（三）15,000・（四）10,000・（五）10,000／
  （六）イ 6,000・ロ 6,000・ハ 2,000・ニ 6,000
- 二十九 個人の商業登記（8 件）:
  （一）イ 30,000・ロ 30,000・ハ 18,000・ニ 18,000・ホ 6,000・ヘ 6,000／
  （二）イ 9,000・ロ 6,000
- 三十 船舶管理人の登記（2 件）: （一）30,000・（二）6,000
- 三十一 夫婦財産契約の登記（3 件）: （一）18,000・（二）6,000・（三）6,000

| ファイル | def | theorem | example |
| --- | --- | --- | --- |
| `RegistryTrustMarriageFees.lean` | 45 | 45（全定額の正性） | 45（金額 smoke） |
| `RegistryTrustMarriageFeesSpec.lean` | 46（独立定式 45 + `agree` 1） | 0 | 46（spec points 45 + agree 1） |
| `RegistryTrustMarriageFeesTests.lean` | 0 | 0 | 91（金額 45 + 正性 45 + agree 1） |

**名前付き宣言総数 136（45 + 45 + 46）、`by decide` の example は 182 件（45 + 46 + 91）。**

### 実装 def 一覧（`.lean`、45 件）

投資法人:
`investmentCorporationFormationFee`(30,000), `investmentCorporationOtherRegistrationFee`(15,000),
`investmentCorporationErasureFee`(10,000)

有限責任事業組合:
`llpContractEffectivenessFee`(60,000), `llpBranchInstallationFee`(60,000),
`llpRelocationFee`(30,000), `llpPartnerMattersChangeFee`(10,000),
`llpPartnerSuspensionOrDeputyFee`(30,000), `llpOtherRegistrationFee`(30,000),
`llpCorrectionFee`(20,000), `llpErasureFee`(20,000),
`llpLiquidatorRegistrationFee`(6,000), `llpLiquidationOtherFee`(6,000),
`llpLiquidationCompletionFee`(2,000), `llpLiquidationCorrectionOrErasureFee`(6,000)

投資事業有限責任組合:
`viclpContractEffectivenessFee`(30,000), `viclpOtherRegistrationFee`(15,000),
`viclpCorrectionFee`(10,000), `viclpErasureFee`(10,000),
`viclpLiquidatorRegistrationFee`(6,000), `viclpLiquidationOtherFee`(6,000),
`viclpLiquidationCompletionFee`(2,000), `viclpLiquidationCorrectionOrErasureFee`(6,000)

限定責任信託:
`limitedLiabilityTrustProvisionFee`(30,000), `limitedLiabilityTrustNewOfficeFee`(15,000),
`limitedLiabilityTrustOtherRegistrationFee`(15,000), `limitedLiabilityTrustCorrectionFee`(10,000),
`limitedLiabilityTrustErasureFee`(10,000), `limitedLiabilityTrustLiquidatorRegistrationFee`(6,000),
`limitedLiabilityTrustLiquidationOtherFee`(6,000),
`limitedLiabilityTrustLiquidationCompletionFee`(2,000),
`limitedLiabilityTrustLiquidationCorrectionOrErasureFee`(6,000)

個人の商業登記:
`individualNameEstablishmentOrChangeFee`(30,000), `individualManagerFee`(30,000),
`individualMinorOrGuardianFee`(18,000), `individualBusinessTransferLiabilityFee`(18,000),
`individualNameAbolitionOrCorrectionFee`(6,000), `individualErasureFee`(6,000),
`individualBranchOfficeFee`(9,000), `individualBranchOfficeErasureFee`(6,000)

船舶管理人: `shipManagerFee`(30,000), `shipManagerCorrectionOrChangeFee`(6,000)

夫婦財産契約: `matrimonialPropertyContractFee`(18,000),
`matrimonialPropertyContractCorrectionOrChangeFee`(6,000),
`matrimonialPropertyContractErasureFee`(6,000)

Spec: 上記 45 件に対応する `spec*`（日本語金額を `3 * 10_000` / `15 * 1_000` /
`6 * 1_000` / `2 * 1_000` / `18 * 1_000` / `9 * 1_000` 等、実装とは別の算術定式で
書き直した独立定式）45 件 + `agreeRegistryTrustMarriageFees : Bool`
（45 件すべてを `==` で突き合わせ）1 件。

Tests: 新規定理名なし。全 45 件の金額一致・正性と agree の再確認（すべて `by decide`）。

### 原文どおりの読み取り（誠実性の境界）

- 各定数は「申請件数一件につき」の **1 件あたり単価** のみを定義し、件数を掛ける
  Nat 掛け算は行わない（呼び出し側が判断）。
- どの号・区分に該当するか（設立／その他／抹消／清算／更正・変更／支店等）、
  申請件数、対象範囲に収まるかは **caller-established** と明記し、
  **Bool を金額式に一切入れていない**（本モジュールの関数は引数を取らず定数のみ）。
- 本範囲に小数点率はなく定額のみ。したがって率の解釈問題（分母 10000 等）は
  本スライドに存在しない。
- 二十六（二）（三）の fee string は二十五 特定目的会社と文字列同一であり、
  三十一を除く清算区文字列も二十七・二十八で同一である。needle は区分を
  一意化するため隣接する号の見出し/include を伴う（後述 §2）。
- Pinned evidence is in doc-comments only. 各定理はモデルの性質のみを主張し、
  実法律の意味・解釈の正しさを主張しない（誠実性の原則）。

## 2. 転記監査に追加すべき check（JSON 断片）

`scripts/ci/transcription_audit.py` の `checks()` に追加する check の JSON 表現です
（`law_id` / `kind` / `title` / `needles` の 4 キー）。needle 文字列は一字も変えないこと。
**文字正規化・全角／半角変換・異体字変換を行わず、そのまま移してください。**
各 needle は正規化テキスト（`re.sub(r"[\s　]+", "", ...)`）上の連続部分そのもので、
担当範囲原文・pinned JSON の両方で出現回数 **1**（一意）、長さ 71〜127 文字です。

```json
{
  "law_id": "342AC0000000035",
  "kind": "file",
  "title": null,
  "needles": [
    "二十六投資法人の登記（一）投資信託及び投資法人に関する法律（昭和二十六年法律第百九十八号）第二条第十二項（定義）に規定する投資法人の設立の登記",
    "申請件数一件につき三万円（二）（一）及び（三）に掲げる登記以外の登記申請件数一件につき一万五千円（三）登記の抹消申請件数一件につき一万円二十七有限責任事業組合契約の登記",
    "二十七有限責任事業組合契約の登記（一）有限責任事業組合契約に関する法律（平成十七年法律第四十号）第三条第一項（有限責任事業組合契約）に規定する有限責任事業組合契約（以下この号において「組合契約」という。）の登記（（二）に掲げる登記を除く。）",
    "イ組合契約の効力の発生の登記申請件数一件につき六万円ロ従たる事務所の設置の登記申請件数一件につき六万円ハ主たる事務所又は従たる事務所の移転の登記申請件数一件につき三万円ニ組合員に関する事項の変更の登記申請件数一件につき一万円",
    "ホ組合員の業務執行の停止又は業務代行者の選任の登記申請件数一件につき三万円ヘイからホまで、ト及びチに掲げる登記以外の登記申請件数一件につき三万円ト登記の更正の登記申請件数一件につき二万円チ登記の抹消申請件数一件につき",
    "二万円（二）組合契約の清算に係る登記イ清算人の登記申請件数一件につき六千円ロイ、ハ及びニに掲げる登記以外の登記申請件数一件につき六千円ハ清算結了の登記申請件数一件につき二千円ニ登記の更正の登記又は登記の抹消申請件数一件につき六千円",
    "二十八投資事業有限責任組合契約の登記（一）投資事業有限責任組合契約に関する法律（平成十年法律第九十号）第三条第一項（投資事業有限責任組合契約）に規定する投資事業有限責任組合契約（以下この号において「組合契約」という。）の登記（（二）に掲げる登記を除く。）",
    "イ組合契約の効力の発生の登記申請件数一件につき三万円ロイ、ハ及びニに掲げる登記以外の登記申請件数一件につき一万五千円ハ登記の更正の登記申請件数一件につき一万円ニ登記の抹消申請件数一件につき",
    "一万円（二）組合契約の清算に係る登記イ清算人の登記申請件数一件につき六千円ロイ、ハ及びニに掲げる登記以外の登記申請件数一件につき六千円ハ清算結了の登記申請件数一件につき二千円ニ登記の更正の登記又は登記の抹消申請件数一件につき六千円",
    "二十八の二限定責任信託の登記（一）信託法（平成十八年法律第百八号）第二百三十二条（限定責任信託の定めの登記）の限定責任信託の定めの登記申請件数一件につき三万円（二）信託法第二百三十三条第一項（変更の登記）",
    "の規定による新事務処理地においてする同法第二百三十二条各号に掲げる事項の登記申請件数一件につき一万五千円（三）（一）、（二）及び（四）から（六）までに掲げる登記以外の登記申請件数一件につき一万五千円（四）登記の更正の登記（（六）ニに掲げる登記を除く。）",
    "申請件数一件につき一万円（五）登記の抹消（（六）ニに掲げる登記を除く。）申請件数一件につき一万円（六）清算に係る登記イ清算受託者の登記申請件数一件につき六千円",
    "（六）清算に係る登記イ清算受託者の登記申請件数一件につき六千円ロイ、ハ及びニに掲げる登記以外の登記申請件数一件につき六千円ハ清算結了の登記申請件数一件につき二千円ニ登記の更正の登記又は登記の抹消申請件数一件につき六千円",
    "二十九個人の商業登記（一）個人につきその本店の所在地においてする登記イ商号の新設の登記又はその取得による変更の登記申請件数一件につき三万円ロ支配人の選任又はその代理権の消滅の登記申請件数一件につき三万円ハ商法（明治三十二年法律第四十八号）",
    "第五条（未成年者登記）又は第六条第一項（後見人登記）の規定による登記申請件数一件につき一万八千円ニ商法第十七条第二項（営業譲渡の際の免責の登記）の登記申請件数一件につき一万八千円",
    "ホ商号の廃止の登記又は登記の更正、変更若しくは消滅の登記（これらの登記のうちイ又はロに掲げるものを除く。）申請件数一件につき六千円ヘ登記の抹消申請件数一件につき六千円",
    "（二）個人につきその支店の所在地においてする登記イ（一）イからニまでに掲げる登記申請件数一件につき九千円ロ（一）ホに掲げる登記又は登記の抹消申請件数一件につき六千",
    "円三十船舶管理人の登記（一）船舶管理人の選任又はその代理権の消滅の登記申請件数一件につき三万円（二）抹消された登記の回復の登記又は登記事項の更正若しくは変更の登記申請件数一件につき六千円",
    "三十一夫婦財産契約の登記（一）民法（明治二十九年法律第八十九号）第七百五十六条（夫婦財産契約の対抗要件）の登記申請件数一件につき一万八千円（二）登記事項の更正又は変更の登記申請件数一件につき六千円（三）登記の抹消申請件数一件につき六千円"
  ]
}
```

参考：現行スクリプト形式への変換例（name は任意、needles は上記 19 本を一字も変えずに列挙）:

```python
yield ("登録免許税法 別表第一（二）（二十六〜三十一の手数料）↔ RegistryTrustMarriageFees.lean",
       "342AC0000000035",
       "file", None,
       [ ...上記 needles 19 本を一字も変えずに列挙... ])
```

unique 化の理由（needle 2 / 6 / 9 / 13）:
- needle 2 は二十六（二）（三）の fee string が二十五 特定目的会社と同一のため、
  後続の「二十七有限責任事業組合契約の登記」見出しを含めて一意化。
- needle 6 は二十七（二）の清算文字列が二十八（二）と同一のため、直前の
  「二万円（二）」を含めて一意化。
- needle 9 は二十八（二）の清算文字列が二十七（二）と同一のため、直前の
  「一万円（二）」を含めて一意化。
- needle 13 は二十八の二（六）の清算文字列が二十七・二十八と同一のため、
  「清算受託者」（二十七・二十八は「清算人」）を含む形で一意化。

## 3. 検証結果（すべて本セッションで実行済み）

- `lake build JapanTaxLaw.RegistryTrustMarriageFees JapanTaxLaw.RegistryTrustMarriageFeesSpec JapanTaxLaw.RegistryTrustMarriageFeesTests`
  → **成功（5 jobs、warning なし）**。※自作 3 モジュールのみビルド（全体ビルド／CI／
  `run_python_gates.py` は実行していません）。
- `python scripts/ci/check_no_sorry.py` →
  `no forbidden placeholder proofs found in tracked Lean sources`。
  （新規 3 ファイルは未追跡のため走査対象外ですが、リポジトリの
  `strip_comments_and_strings` と同一ロジックで個別に走査し、
  `sorry` / `admit` が **0 件**であることを別途確認済み。）
- `#print axioms`（一時ファイル `WAA_AxiomProbe.lean` を approved temp dir に作成、
  `lake env lean` で実行後 **削除済み**）:
  - 名前付き宣言 **136 件**（実装 def 45 + theorem 45 + Spec def 46）を走査。
  - **136 件すべてが `does not depend on any axioms`**。
  - `Classical.choice` / `sorryAx` / `propext` は **いずれも 0 件**。
- 原文逐語検証（needle を `re.sub(r"[\s　]+", "", ...)` 正規化テキストに対して
  Python `.find()` / `.count()`）:
  - 担当範囲原文 `reg_rem_C.txt`（正規化後 1,926 文字）:
    **19/19 FOUND、MISS 0 件**、各出現回数 1、長さ 71〜127 文字。
  - pinned JSON `law_full_text`（正規化後 211,508 文字。平坦化は
    `transcription_audit.py` と同一ロジック）:
    **19/19 FOUND、MISS 0 件**、各出現回数 1。
  - 参考: 担当範囲原文の正規化文字列は pinned JSON 正規化文字列の offset 139420 から
    そのまま一致（1,926 文字すべて逐語一致）。
  - 一時検証スクリプト・出力・axiom probe はすべて削除済み（担当範囲原文
    `reg_rem_C.txt` は残置）。

### 逐語 FOUND / MISS 一覧（一字も変更せず）

| # | 区分 | len | 原文.find / JSON.find | JSON count | 結果 |
| --- | --- | --- | --- | --- | --- |
| 1 | 二十六 header・（一）30,000 | 71 | 5 / 139425 | 1 | FOUND |
| 2 | 二十六（二）15,000・（三）10,000・二十七 header | 84 | 76 / 139496 | 1 | FOUND |
| 3 | 二十七 header・法律参照 | 120 | 144 / 139564 | 1 | FOUND |
| 4 | 二十七（一）イ〜ニ 60/60/30/10 | 112 | 264 / 139684 | 1 | FOUND |
| 5 | 二十七（一）ホ〜チ 30/30/20/20 | 108 | 376 / 139796 | 1 | FOUND |
| 6 | 二十七（二）清算 6/6/2/6 | 115 | 484 / 139904 | 1 | FOUND |
| 7 | 二十八 header・法律参照 | 127 | 599 / 140019 | 1 | FOUND |
| 8 | 二十八（一）イ〜ニ 30/15/10/10 | 94 | 726 / 140146 | 1 | FOUND |
| 9 | 二十八（二）清算 6/6/2/6 | 115 | 820 / 140240 | 1 | FOUND |
| 10 | 二十八の二 header・（一）（二）30/15 | 102 | 935 / 140355 | 1 | FOUND |
| 11 | 二十八の二（二）〜（四）15/15/10 | 126 | 1037 / 140457 | 1 | FOUND |
| 12 | 二十八の二（五）（六）イ 10/6 | 79 | 1163 / 140583 | 1 | FOUND |
| 13 | 二十八の二（六）受託者 清算 6/6/2/6 | 109 | 1211 / 140631 | 1 | FOUND |
| 14 | 二十九（一）イ〜ロ 30/30 | 119 | 1320 / 140740 | 1 | FOUND |
| 15 | 二十九（一）ハ・ニ 18/18 | 89 | 1439 / 140859 | 1 | FOUND |
| 16 | 二十九（一）ホ・ヘ 6/6 | 83 | 1528 / 140948 | 1 | FOUND |
| 17 | 二十九（二）イ・ロ 9/6 | 81 | 1611 / 141031 | 1 | FOUND |
| 18 | 三十（一）（二）30/6 | 93 | 1692 / 141112 | 1 | FOUND |
| 19 | 三十一（一）〜（三）18/6/6 | 118 | 1785 / 141205 | 1 | FOUND |

**FOUND 19 / MISS 0**（両テキストで出現回数 1、一意）。needle の長さは 71〜127 文字。
アンカーの勝手な変更・正規化・文字変換はしていません（原文の `若しくは` / `に掲げる` /
旧仮名遣い等も保持）。

## 4. README / PROGRESS に足す 1 行文案

CROSS_LAW の scan/pin 件数や監査 literal 総数はメインセッションが計算するため、ここでは書きません。

- **README.md**（登録免許税モジュール一覧の末尾付近、例: `RegistryCorporateSecurityFees.lean` 行の直後に追加）:
  ```text
  JapanTaxLaw/RegistryTrustMarriageFees.lean / -Spec.lean / -Tests.lean  # 登録免許税法 別表第一（二）二十六〜三十一の投資法人・有限責任事業組合・投資事業有限責任組合・限定責任信託・個人の商業登記・船舶管理人・夫婦財産契約の手数料（一件につき 2,000〜60,000 円の定額 45 件、件数・該当性は caller-established）L4 モデル・独立定式・退行テスト
  ```
- **docs/PROGRESS.md**（L4 着手済みモジュール一覧の末尾に追記）:
  ```text
  登録免許税法 別表第一（二）（RegistryTrustMarriageFees.lean：投資法人・有限責任事業組合・投資事業有限責任組合・限定責任信託・個人の商業登記・船舶管理人・夫婦財産契約の手数料を定額 45 件（一件につき 2,000〜60,000 円）でモデル化、件数・該当性は caller-established、小数点率なし、他の号・条文は NOT YET COVERED）
  ```

## 5. インテグレーターへの明示事項

**インテグレーターは `JapanTaxLaw.lean` に以下の 3 つの import を追加すること。**

```lean
import JapanTaxLaw.RegistryTrustMarriageFees
import JapanTaxLaw.RegistryTrustMarriageFeesSpec
import JapanTaxLaw.RegistryTrustMarriageFeesTests
```

（他ワーカーの 3 件ずつと併せてメインが行数を確認してください。
W-AA は `JapanTaxLaw.lean` を書き換えていません。他ワーカーのファイルには触れていません。）

## 6. 範囲・残ブロッカーの正直な申告（最終報告）

- **build**: 自作 3 モジュールのみ `lake build` 成功（5 jobs / warning なし）。全体ビルド・CI・
  `run_python_gates.py` は未実行です。
- **axiom**: 走査 136 件（実装 def 45 + theorem 45 + Spec def 46）、
  `Classical.choice` / `sorryAx` / `propext` なし。136 件すべて axiom-free。
  一時ファイルは削除済み。
- **逐語**: FOUND 19 / MISS 0（担当範囲原文・pinned JSON の両方、出現回数 1、長さ 71〜127）。
- **def 数**: 実装 45 + theorem 45 + Spec 46 = **名前付き宣言 136**
  （＋ `by decide` の example 182 件）。Tests は新規定理名なし。
- **STAGING**: 本ファイル `docs/STAGING_WAA.md` を作成済みです。
- これは **L4 のごく小さなスライド**です。**完成・網羅を主張しません**。
- 担当は 登録免許税法 別表第一（二）の**二十六 投資法人の登記 / 二十七 有限責任事業組合契約の登記 /
  二十八 投資事業有限責任組合契約の登記 / 二十八の二 限定責任信託の登記 /
  二十九 個人の商業登記 / 三十 船舶管理人の登記 / 三十一 夫婦財産契約の登記 のみ**。
  別表第一の他の号・他の条文、登録免許税の納付手続・端数処理の通則法的詳細は
  **NOT YET COVERED**。割当見出しの「二十六〜二十九」と括弧内例示・提供原文
  （二十八の二・三十一を含む）との食い違いは §0 に正直に記録した。
- 申請件数、各区分への該当性、対象範囲に収まるかはすべて caller-established とし、
  法的判断の自動化・Bool の金額式への組込みはしていません。
- 定額は「一件につき」あたり単価のみを定義し、件数の掛け算はしていません。
- 本範囲に小数点率は存在せず、TaxRate 定数は導入していません（分母 10000 の警戒対象なし）。
- `agreeRegistryTrustMarriageFees` は 45 件の定額に対する `==` 一致確認であり、
  法的意味の等価証明ではありません。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり、法的正しさを保証しません。
- **L7 候補 3,438 件は unreviewed のまま**です（本スライドでは一切レビューしていません）。
- 残ブロッカー: 転記監査 check の `checks()` への組み込み（§2、+19 needles）、
  `JapanTaxLaw.lean` への import 追加（§5）、README / PROGRESS の 1 行追記（§4）、
  および全体ビルド・CI ゲートの実行は**すべてメインセッションの担当**です
  （W-AA は実行していません）。
