# STAGING — W-I（登録免許税法 別表第一（二）第三十二号 百二十〜百二十四 の flat fee）受け渡しメモ

> 実装担当 W-I からメインセッション（統合担当）への受け渡し用。
> ブランチ操作・add/commit/push/merge は一切していません。
> 書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。

## 0. 対象ファイル

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/RegistrationQualificationFeesP6I.lean` | 新規 |
| `JapanTaxLaw/RegistrationQualificationFeesP6ISpec.lean` | 新規 |
| `JapanTaxLaw/RegistrationQualificationFeesP6ITests.lean` | 新規 |
| `docs/STAGING_WI.md` | 新規（本ファイル） |

pinned source: `data/raw/342AC0000000035_20261101_508AC0000000021.law.json`
law id `342AC0000000035` / revision `342AC0000000035_20261101_508AC0000000021`
amendment enforcement date `2026-11-01`（RegistrationQualificationFees / P2A〜P5H と同一ピン）。
担当範囲原文: `art32_120_124.txt`（百二十〜百二十四、UTF-8、1 行 2,830 文字、正規化後 2,813 文字）。
pinned bytes から金額を日本語数字で読み取り Arabic に変換
（三万円→30,000 / 六万円→60,000 / 九万円→90,000 / 十五万円→150,000、全件一致確認済み）。

## 1. 担当範囲のカテゴリ一覧（百二十〜百二十四）

| 条号 | 区分／法律 | 件数 |
| --- | --- | --- |
| 百二十 | （一）鉄道事業法第三条第一項（第一種・第二種・第三種鉄道事業の許可） | 1 |
| 百二十 | （二）鉄道事業法第三十二条（索道事業の許可） | 1 |
| 百二十 | （三）軌道法第三条（軌道事業の特許） | 1 |
| 百二十 | （四）鉄道事業法第六十二条第一項（軌道からの変更の許可） | 1 |
| 百二十一 | 道路運送法第四十七条第一項（自動車道事業の免許） | 1 |
| 百二十二 | 道路整備特別措置法第三条第一項（高速道路の新設又は改築の許可） | 1 |
| 百二十三 | 自動車ターミナル法第三条（自動車ターミナル事業の許可） | 1 |
| 百二十四 | （一）イ 道路運送車両法第四十八条第一項（点検付随整備事業の全部の実施） | 1 |
| 百二十四 | （一）ロ 点検付随整備事業の一部の実施 | 1 |
| 百二十四 | （一）ハ イ及びロに掲げる認定以外の認定 | 1 |
| 百二十四 | （二）道路運送車両法第七条第四項（登録情報処理機関の登録） | 1 |
| 百二十四 | （三）道路運送車両法第二十二条第三項（登録情報提供機関の登録） | 1 |
| **合計** | | **12** |

原文の「〜件数一件につき△△円」フレーズ出現数は **12**（`につき` の出現数も 12）で、
タスク指定の 12 件と一致します。内訳は 十五万円 5 / 九万円 4 / 三万円 2 / 六万円 1。
本範囲に割合（千分の△）はありません。

デーミング／軽減代替の取扱い:

- 百二十（一）（三）（四）の括弧内「（（一）に掲げる許可が無軌条の路線に係るものについては、
  九万円）」等は主額十五万円の軽減代替であり、「件数一件につき」の fee string ではないため
  **fee def を作りません**（`.count('無軌条') == 3`）。
- 百二十の（注）は都市鉄道等利便増進法等の特例による速達性向上計画等の認定を
  「当該許可とみなす／当該特許とみなす」とするデーミング規定、百二十三の（注）は
  総合効率化計画の認定を「当該許可とみなす」とするデーミング規定です。
  これらも **fee def を作りません**。
- 「政令で定めるものを除く。」（`.count('政令で定めるものを除く。') == 2`、さらに
  （一）に「政令で定めるもの及び一時的な需要のために期間を限定して行う許可を除く。」1 箇所）、
  「一時的な需要のために期間を限定して行う許可を除く。」（1）、
  「更新の登録を除く。」（百二十四（二）（三）の 2 箇所）、
  「財務省令で定めるもの」（百二十四（一）イ・ロの 2 箇所）はすべて
  **caller-established** とし、金額定数には反映しません（Bool は式に入れていません）。

## 2. 追加した def 一覧（名前 → 金額 → 条号／区分）

`namespace JapanTaxLaw`、`open JapanTaxLaw.TaxFinance`。各 def は `Money := <額>` の flat 定数
（課税標準は一件につき）。各 def に `<name>_pos : <name> > 0 := by decide` と
`example : <name> = <額> := by decide` を付与済み（12 本ずつ）。

| # | 条号／区分 | def 名 | 金額 | 原文 fee |
| --- | --- | --- | --- | --- |
| 1 | 百二十(一) 第一種・第二種・第三種鉄道事業の許可 | `railwayBusinessPermitFee` | 150,000 | 十五万円 |
| 2 | 百二十(二) 索道事業の許可 | `ropewayBusinessPermitFee` | 30,000 | 三万円 |
| 3 | 百二十(三) 軌道事業の特許 | `tramwayBusinessFranchiseFee` | 150,000 | 十五万円 |
| 4 | 百二十(四) 軌道事業から鉄道事業への変更の許可 | `tramwayToRailwayChangePermitFee` | 150,000 | 十五万円 |
| 5 | 百二十一 自動車道事業の免許 | `motorwayBusinessLicenseFee` | 150,000 | 十五万円 |
| 6 | 百二十二 高速道路の新設又は改築の許可 | `expresswayConstructionPermitFee` | 150,000 | 十五万円 |
| 7 | 百二十三 自動車ターミナル事業の許可 | `motorTerminalBusinessPermitFee` | 90,000 | 九万円 |
| 8 | 百二十四(一)イ 点検付随整備事業の全部の実施に係る認定 | `fullInspectionAttachedMaintenanceCertFee` | 90,000 | 九万円 |
| 9 | 百二十四(一)ロ 点検付随整備事業の一部の実施に係る認定 | `partialInspectionAttachedMaintenanceCertFee` | 60,000 | 六万円 |
| 10 | 百二十四(一)ハ イ及びロに掲げる認定以外の認定 | `otherMaintenanceCertFee` | 30,000 | 三万円 |
| 11 | 百二十四(二) 登録情報処理機関の登録 | `vehicleRegistrationInfoProcessingOrgRegFee` | 90,000 | 九万円 |
| 12 | 百二十四(三) 登録情報提供機関の登録 | `vehicleRegistrationInfoProvidingOrgRegFee` | 90,000 | 九万円 |

金額一致の内訳: 十五万円=5 件（150,000）／ 九万円=4 件（90,000）／
三万円=2 件（30,000）／ 六万円=1 件（60,000）＝ 合計 12 件。
pinned 原文の fee フレーズ出現数と完全一致。

`RegistrationQualificationFeesP6ISpec.lean` は `spec` 接頭辞の独立定式 12 本 +
`agreeRegistrationQualificationFeesP6I : Bool`（実装 ≡ spec の `==` 一致）+
`example : agreeRegistrationQualificationFeesP6I = true := by decide`。
`RegistrationQualificationFeesP6ITests.lean` は `example := by decide` のスモーク 12 件のみ。

doc-comment に明記した射程外（overclaim 防止）:

- 無軌条の路線に係る九万円の軽減代替 3 箇所は別 def を作らず、該当性は caller-established。
- 百二十・百二十三の（注）のみなし規定はデーミング規定として扱い、fee def を作らない。
- 「政令で定めるものを除く。」「一時的な需要のために期間を限定して行う許可を除く。」
  「更新の登録を除く。」「財務省令で定めるもの」の該当性はすべて caller-established。
- 百十九 以前・百二十五 以降は NOT YET COVERED。
  「認定件数」「登録件数」「許可件数」「免許件数」「特許件数」の意味上の区別は
  非モデル化（一律 `Money`）。

## 3. 転記監査に追加すべき check（JSON 断片）

`scripts/ci/transcription_audit.py` の `checks()` に追加する check の JSON 表現です
（`law_id` / `kind` / `title` / `needles` の 4 キー）。needle 文字列は一字も変えないこと。
**文字正規化・全角／半角変換・異体字変換を行わず、そのまま移してください。**

```json
{
  "law_id": "342AC0000000035",
  "kind": "file",
  "title": null,
  "needles": [
    "路線に接続して路線を延長することの許可で政令で定めるもの及び一時的な需要のために期間を限定して行う許可を除く。）許可件数一件につき十五万円（（一）に掲げる許可が無軌条の路線に係るものについては、九万円）",
    "（一）に掲げる許可が無軌条の路線に係るものについては、九万円）（二）鉄道事業法第三十二条（許可）の索道事業の許可許可件数一件につき三万円",
    "（三）軌道法第三条（事業の特許）（同法第三十一条（軌道に準ずるもの）において準用する場合を含む。）の軌道事業の特許（当該特許を受けている者が当該特許に係る路線に接続して路線を延長することの特許で政令で定めるものを除く。）特許件数一件につき十五万円",
    "（四）鉄道事業法第六十二条第一項（軌道からの変更）の規定による軌道事業から鉄道事業への変更の許可（（一）に掲げる許可を受けている者が当該許可に係る路線に接続して路線を延長することの許可で政令で定めるものを除く。）許可件数一件につき十五万円",
    "無軌条の路線に係るものについては、九万円）百二十一自動車道事業の免許道路運送法第四十七条第一項（免許）の自動車道事業の免許免許件数一件につき十五万円",
    "百二十二高速道路の新設又は改築の許可道路整備特別措置法（昭和三十一年法律第七号）第三条第一項（高速道路の新設又は改築）の規定による高速道路の新設又は改築の許可許可件数一件につき十五万円",
    "の規定による総合効率化計画の認定は、当該許可とみなす。自動車ターミナル法（昭和三十四年法律第百三十六号）第三条（事業の許可）の自動車ターミナル事業の許可許可件数一件につき九万円",
    "の優良自動車整備事業者の認定イ道路運送車両法第四十八条第一項（定期点検整備）の点検に付随して行われる自動車又はその部分の整備又は改造の事業（ロにおいて「点検付随整備事業」という。）の全部の実施に係る認定で財務省令で定めるもの認定件数一件につき九万円",
    "の全部の実施に係る認定で財務省令で定めるもの認定件数一件につき九万円ロ点検付随整備事業の一部の実施に係る認定で財務省令で定めるもの認定件数一件につき六万円",
    "の一部の実施に係る認定で財務省令で定めるもの認定件数一件につき六万円ハイ及びロに掲げる認定以外の認定認定件数一件につき三万円",
    "以外の認定認定件数一件につき三万円（二）道路運送車両法第七条第四項（登録情報処理機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円",
    "の登録（更新の登録を除く。）登録件数一件につき九万円（三）道路運送車両法第二十二条第三項（登録情報提供機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円"
  ]
}
```

参考：現行スクリプト形式への変換例（name は任意、needles は上記 12 本をそのまま使用）:

```python
yield ("登録免許税法 別表第一（二）第三十二号 百二十〜百二十四（鉄道事業・索道事業・軌道事業・自動車道事業・高速道路・自動車ターミナル・優良自動車整備事業者・登録情報処理／提供機関）↔ RegistrationQualificationFeesP6I.lean",
       "342AC0000000035",
       "file", None,
       [ ...上記 needles 12 本を一字も変えずに列挙... ])
```

## 4. 期待 literal 増分

- W-I 担当分: 新規 check **12 needles** なので **+12**。
- `docs/PROGRESS.md` の監査 literal 総数はメインセッションが再確認して加算してください
  （起点値は本メモでは書きません）。

## 5. 検証結果（すべて本セッションで実行済み）

- `lake build JapanTaxLaw.RegistrationQualificationFeesP6I JapanTaxLaw.RegistrationQualificationFeesP6ISpec JapanTaxLaw.RegistrationQualificationFeesP6ITests`
  → **成功（5 jobs、warning なし）**。※自作 3 モジュールのみビルド（全体ビルド／CI／
  `run_python_gates.py` は実行していません）。
- `python scripts/ci/check_no_sorry.py` → `no forbidden placeholder proofs found in tracked Lean sources`。
  （新規 3 ファイルは未追跡のため走査対象外ですが、人力でも `sorry` / `admit` はありません。）
- `#print axioms`（一時ファイル `P6IAxiomProbe.lean` を approved temp dir に作成、
  `lake env lean` で実行後 **削除済み**）:
  - 新規 positivity 定理 **12 本すべて** と `agreeRegistrationQualificationFeesP6I` の計
    **13 件**が `does not depend on any axioms`。
  - **`Classical.choice` も `sorryAx` も `propext` も一切なし**（出力 13 行を全文走査、
    forbidden hits = 0）。
- 原文逐語検証（pinned JSON を正規化テキストに対して `.find()`）: **12/12 FOUND、MISS 0 件**（§6）。
  担当範囲原文 `art32_120_124.txt` 正規化テキストに対しても **12/12 FOUND、MISS 0 件**。
  各 needle は両テキストで出現回数 **1**（一意）、長さはすべて **60〜130 文字**、12 本すべて
  相互に異なることを確認。
  law id `342AC0000000035` … FOUND / revision `342AC0000000035_20261101_508AC0000000021` … FOUND
  （いずれも pinned JSON 生テキスト上で確認）。
- 金額一致: 十五万円=5 件（150,000）／ 九万円=4 件（90,000）／ 三万円=2 件（30,000）／
  六万円=1 件（60,000） ＝ 12 件、pinned 原文の fee フレーズ出現数と完全一致。

## 6. 逐語検証 FOUND / MISS 一覧（一字も変更せず）

担当範囲原文 `art32_120_124.txt` を、転記監査と同じ `re.sub(r"[\s\u3000]+", "", ...)` で正規化した文字列に
対して各 needle を Python の `.find()` で検索（`art@`）。
`json@` は pinned JSON `law_full_text` を `transcription_audit.py` と同一ロジックで平坦化・正規化した文字列上の offset。
各 needle の出現回数は両方とも **1**（一意）。

| # | 条号/区分 | def | 結果 | art@ | json@ | 出現回数(art/json) | len |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 1 | 百二十(一) | `railwayBusinessPermitFee` | FOUND | 1617 | 180279 | 1/1 | 101 |
| 2 | 百二十(二) | `ropewayBusinessPermitFee` | FOUND | 1687 | 180349 | 1/1 | 68 |
| 3 | 百二十(三) | `tramwayBusinessFranchiseFee` | FOUND | 1755 | 180417 | 1/1 | 123 |
| 4 | 百二十(四) | `tramwayToRailwayChangePermitFee` | FOUND | 1910 | 180572 | 1/1 | 119 |
| 5 | 百二十一 | `motorwayBusinessLicenseFee` | FOUND | 2040 | 180702 | 1/1 | 74 |
| 6 | 百二十二 | `expresswayConstructionPermitFee` | FOUND | 2114 | 180776 | 1/1 | 92 |
| 7 | 百二十三 | `motorTerminalBusinessPermitFee` | FOUND | 2318 | 180980 | 1/1 | 88 |
| 8 | 百二十四(一)イ | `fullInspectionAttachedMaintenanceCertFee` | FOUND | 2506 | 181168 | 1/1 | 124 |
| 9 | 百二十四(一)ロ | `partialInspectionAttachedMaintenanceCertFee` | FOUND | 2596 | 181258 | 1/1 | 77 |
| 10 | 百二十四(一)ハ | `otherMaintenanceCertFee` | FOUND | 2639 | 181301 | 1/1 | 62 |
| 11 | 百二十四(二) | `vehicleRegistrationInfoProcessingOrgRegFee` | FOUND | 2684 | 181346 | 1/1 | 72 |
| 12 | 百二十四(三) | `vehicleRegistrationInfoProvidingOrgRegFee` | FOUND | 2730 | 181392 | 1/1 | 83 |

- **FOUND 12 / MISS 0**。needle の長さはすべて **60〜130 文字**、12 本すべて相互に異なることを確認。
  アンカーの勝手な変更・正規化・文字変換はしていません。
- 各 needle には項目の区分（（一）〜（四）／イ・ロ・ハ／（二）（三））又は条号
  （百二十一・百二十二）を含めています。例外は以下のとおりです:
  - #1 百二十(一): 条号「百二十」から主額までが 1,500 文字超の（注）のため 130 文字制約内に
    収まらず、主額「十五万円」直後の括弧内「（（一）に掲げる許可が無軌条の路線に
    係るものについては、九万円）」の「（一）」を区分として含む連続部分をアンカーとしました
    （対応する条号／区分は上表および def の doc-comment に明記）。
  - #7 百二十三: 条号「百二十三」から fee までが約 200 文字のため、fee literal を含む
    連続部分（自動車ターミナル法第三条の認可申請と「九万円」）をアンカーとしました。
  - #2・#5・#8・#9・#10・#11・#12: 60 文字下限を満たすため、直前項目の fee literal を含む
    連続部分を起点にしています（needle は一意、該当項目の fee literal を含む）。
- 金額の日本語数字との対応も全件一致（十五万円=150,000 / 九万円=90,000 /
  三万円=30,000 / 六万円=60,000）。

## 7. README / PROGRESS に足す 1 行文案

CROSS_LAW の scan/pin 件数や監査 literal 総数はメインセッションが計算するため、ここでは書きません。

- **README.md**（モジュール一覧・`RegistrationQualificationFeesP5H*` 行の直後に追加）:
  ```text
  JapanTaxLaw/RegistrationQualificationFeesP6I.lean / -Spec.lean / -Tests.lean  # 登録免許税法 別表第一（二）第三十二号 百二十〜百二十四（鉄道事業・索道事業・軌道事業・自動車道事業・高速道路・自動車ターミナル・優良自動車整備事業者・登録情報処理／提供機関）の flat fee L4 モデル・独立定式・退行テスト
  ```
- **docs/PROGRESS.md**（L4 着手済みモジュール一覧の末尾に追記）:
  ```text
  登録免許税法 別表第一（二）第三十二号 百二十〜百二十四（RegistrationQualificationFeesP6I.lean：12 件の flat fee 額を Money 定数化、百十九 以前・百二十五 以降 NOT YET COVERED）
  ```

## 8. インテグレーターへの明示事項

**インテグレーターは `JapanTaxLaw.lean` に以下の 3 つの import を追加すること。**

```lean
import JapanTaxLaw.RegistrationQualificationFeesP6I
import JapanTaxLaw.RegistrationQualificationFeesP6ISpec
import JapanTaxLaw.RegistrationQualificationFeesP6ITests
```

（W-A〜W-H の各 3 件、W-J の P6J 3 件と併せてメインが行数を確認してください。
W-I は `JapanTaxLaw.lean` を書き換えていません。W-J の P6J ファイルには触れていません。）

## 9. 範囲・残ブロッカーの正直な申告（最終報告）

- **build**: 自作 3 モジュールのみ `lake build` 成功（5 jobs / warning なし）。全体ビルド・CI・
  `run_python_gates.py` は未実行です。
- **axiom**: 新規 positivity 12 本 + agree 1 本の計 13 件すべて axiom-free、
  `Classical.choice` / `sorryAx` / `propext` なし（一時ファイルは削除済み）。
- **逐語**: FOUND 12 / MISS 0（担当範囲原文・pinned JSON の両方、出現回数 1、長さ 60〜130）。
- **def 数**: 12（十五万円 5 / 九万円 4 / 三万円 2 / 六万円 1）。
  無軌条の軽減代替 3 箇所・（注）のデーミング規定の別 def は作っていません。
- **STAGING**: 本ファイル `docs/STAGING_WI.md` を作成済みです。
- これは **L4 のごく小さなスライス**です。**完成・網羅を主張しません**。
- 担当は 別表第一（二）第三十二号 **百二十〜百二十四 のみ**。
  **百十九 以前・百二十五 以降は NOT YET COVERED**。
- 無軌条の軽減代替、みなし規定、「政令で定めるものを除く。」「更新の登録を除く。」
  「財務省令で定めるもの」の該当性はすべて caller-established とし、
  法的判断の自動化はしていません。
- `agreeRegistrationQualificationFeesP6I` は定数同士の `==` 一致確認であり、
  法的意味の等価証明ではありません。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり、法的正しさを保証しません。
- **L7 候補 3,438 件は unreviewed のまま**です（本スライスでは一切レビューしていません）。
- 残ブロッカー: 転記監査 check の `checks()` への組み込み（§3、+12）、
  `JapanTaxLaw.lean` への import 追加（§8）、README / PROGRESS の 1 行追記（§7）、
  および全体ビルド・CI ゲートの実行は**すべてメインセッションの担当**です
  （W-I は実行していません）。
