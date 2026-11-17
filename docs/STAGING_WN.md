# STAGING — W-N（法人税法施行令 第七十九条の二 / 第八十二条の三 / 第八十三条の四：固定資産圧縮限度額の按分計算）受け渡しメモ

> 実装担当 W-N からメインセッション（統合担当）への受け渡し用。
> ブランチ操作・add/commit/push/merge は一切していません。
> 書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。
> 本ファイルは前回割当（登録免許税法 P8N）のメモを**上書き**し、今回の割当の内容に置き換えました。

## 0. 対象ファイル / pinned source

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/CorpAssetCompression.lean` | 新規 |
| `JapanTaxLaw/CorpAssetCompressionSpec.lean` | 新規 |
| `JapanTaxLaw/CorpAssetCompressionTests.lean` | 新規 |
| `docs/STAGING_WN.md` | 上書き（本ファイル） |

pinned source: `data/raw/340CO0000000097_20261001_507CO0000000121.law.json`
law id `340CO0000000097` / revision `340CO0000000097_20261001_507CO0000000121`
（Cabinet Order = 法人税法施行令。amendment enforcement date `2026-10-01`）。
担当範囲原文（正規化済み・UTF-8）: `W_N_corp_order.txt`（3 条、改行・ヘッダ除き正規化後 831 文字）。
名前空間は `JapanTaxLaw.CorpAssetCompression`（他モジュールと衝突しません）。

## 1. モデル化した 3 条と算術

3 条はいずれも同じ構造：圧縮限度額 = 帳簿価額 × (第二条金額 / 第一条金額)。

| 条号（見出し） | 第一条金額 | 第二条金額 | 「達するまで」 |
| --- | --- | --- | --- |
| 第七十九条の二（国庫補助金等の交付前に取得した固定資産等の圧縮限度額） | 当該固定資産の取得又は改良をするために要した金額 | その返還を要しないこととなつた当該国庫補助金等の額 | なし |
| 第八十二条の三（工事負担金の交付前に取得した固定資産の圧縮限度額） | 当該固定資産の取得をするために要した金額 | 当該交付を受けた金銭の額又は資材の価額のうち、前号に掲げる金額に達するまでの金額 | あり → `min` |
| 第八十三条の四（賦課金の納付前に取得した固定資産等の圧縮限度額） | 当該固定資産の取得又は改良をするために要した金額 | 当該賦課に基づいて納付された金額のうち前号に掲げる金額に達するまでの金額 | あり → `min` |

- Money = Nat。丸めは**切り捨て（floor）**、`bookValue * secondAmount / firstAmount`。
- 分母 `firstAmount = 0` のときは **0 を返す安全版**（`if` で明示。原文はゼロの場合を定めないため、
  defensive な選択であることを doc-comment に明記済み）。
- 82の3・83の4 の「達するまで」は `min secondAmount firstAmount` で表現。79の2 には適用しない。
- 帳簿価額・第一条金額・第二条金額はすべて **caller-established**。交付確定日・改良部分の
  帳簿価額・返還不要の確定・金銭/資材の交付・賦課に基づく納付の適用判定は一切モデル化せず、
  Bool は式に入れていません。

## 2. 追加した宣言一覧

`namespace JapanTaxLaw.CorpAssetCompression`、`open JapanTaxLaw.TaxFinance`。

実装（`CorpAssetCompression.lean`）— **4 def**:
| def | 式 |
| --- | --- |
| `compressionLimit` | `if firstAmount = 0 then 0 else bookValue * secondAmount / firstAmount` |
| `art79_2CompressionLimit` | `compressionLimit bookValue firstAmount secondAmount`（min なし） |
| `art82_3CompressionLimit` | `compressionLimit bookValue firstAmount (min secondAmount firstAmount)` |
| `art83_4CompressionLimit` | `compressionLimit bookValue firstAmount (min secondAmount firstAmount)` |

独立定式・一致確認（`CorpAssetCompressionSpec.lean`）— **4 spec def + 4 agree def + 4 agree theorem**:
| 宣言 | 内容 |
| --- | --- |
| `specCompressionLimit` 他 4 本 | 実装の `compressionLimit` を呼ばない独立 Nat 定式 |
| `agreeCompressionLimit` / `agreeArt79_2CompressionLimit` / `agreeArt82_3CompressionLimit` / `agreeArt83_4CompressionLimit` | 14 ポイント（端数・分母 0・second > first を含む）で実装 ≡ spec を `==` 比較する Bool |
| `agreeCompressionLimit_true` / `agreeArt79_2CompressionLimit_true` / `agreeArt82_3CompressionLimit_true` / `agreeArt83_4CompressionLimit_true` | 上記が `true`（すべて `by decide`） |

退行テスト（`CorpAssetCompressionTests.lean`）: `example ... := by decide` のスモーク 25 件
（端数・分母 0・second > first の境界を重点再確認）。定理名は追加していません。

**def（宣言）総数: 実装 4 + spec 4 + agree 4 = 12 def、さらに agree 真値定理 4 本。**

## 3. 転記監査に追加すべき check（JSON 断片）

`scripts/ci/transcription_audit.py` の `checks()` に追加する check の JSON 表現です
（`law_id` / `kind` / `title` / `needles` の 4 キー）。needle 文字列は一字も変えないこと。
**文字正規化・全角／半角変換・異体字変換を行わず、そのまま移してください。**
各 needle は正規化テキスト（空白・全角空白除去）上の連続部分そのもので、
担当範囲原文 `W_N_corp_order.txt` と pinned JSON の両方で出現回数 **1**（一意）です。

```json
{
  "law_id": "340CO0000000097",
  "kind": "file",
  "title": null,
  "needles": [
    "（国庫補助金等の交付前に取得した固定資産等の圧縮限度額）第七十九条の二法第四十二条第一項",
    "一当該固定資産の取得又は改良をするために要した金額二その返還を要しないこととなつた当該国庫補助金等の額",
    "（工事負担金の交付前に取得した固定資産の圧縮限度額）第八十二条の三法第四十五条第一項",
    "一当該固定資産の取得をするために要した金額二当該交付を受けた金銭の額又は資材の価額のうち、前号に掲げる金額に達するまでの金額",
    "（賦課金の納付前に取得した固定資産等の圧縮限度額）第八十三条の四法第四十六条第一項",
    "一当該固定資産の取得又は改良をするために要した金額二当該賦課に基づいて納付された金額のうち前号に掲げる金額に達するまでの金額"
  ]
}
```

参考：現行スクリプト形式への変換例（name は任意、needles は上記 6 本を一字も変えずに列挙）:

```python
yield ("法人税法施行令 art. 79の2/82の3/83の4（固定資産圧縮限度額の按分計算）↔ CorpAssetCompression.lean",
       "340CO0000000097",
       "file", None,
       [ ...上記 needles 6 本を一字も変えずに列挙... ])
```

## 4. 期待 literal 増分

- W-N 担当分: 新規 check **6 needles** なので **+6**。
- `docs/PROGRESS.md` の監査 literal 総数はメインセッションが再確認して加算してください
  （起点値は本メモでは書きません）。

## 5. 検証結果（すべて本セッションで実行済み）

- `lake build JapanTaxLaw.CorpAssetCompression JapanTaxLaw.CorpAssetCompressionSpec JapanTaxLaw.CorpAssetCompressionTests`
  → **成功（5 jobs、warning なし）**。※自作 3 モジュールのみビルド（全体ビルド／CI／
  `run_python_gates.py` は実行していません）。
- `python scripts/ci/check_no_sorry.py` → `no forbidden placeholder proofs found in tracked Lean sources`。
  （新規 3 ファイルは未追跡のため走査対象外ですが、人力でも `sorry` / `admit` はありません。）
- `#print axioms`（一時ファイル `WNAxiomProbe.lean` を approved temp dir に作成、`lake env lean` で
  実行後 **削除済み**）:
  - 上記 16 定数（実装 4 def + spec 4 def + agree 4 def + agree 真値定理 4 本）すべて
    `does not depend on any axioms`。
  - **`Classical.choice` も `sorryAx` も `propext` も一切なし**（出力 16 行を全文走査、いずれも 0 回）。
- 原文逐語検証（担当範囲原文 / pinned JSON を `re.sub(r"[\s\u3000]+", "", ...)` で正規化した
  文字列に対して Python の `.find()`）: **6/6 FOUND、MISS 0 件**（§6）。
  各 needle は両テキストで出現回数 **1**（一意）、長さ 41〜62 文字。

## 6. 逐語検証 FOUND / MISS 一覧（一字も変更せず）

担当範囲原文 `W_N_corp_order.txt` を `re.sub(r"[\s\u3000]+", "", ...)` で正規化した文字列に
対して各 needle を `.find()` で検索（`art@`）。`json@` は pinned JSON `law_full_text` を
`transcription_audit.py` と同一ロジックで平坦化・正規化した文字列上の offset。

| # | 条号 | needle 先頭 | 結果 | art@ | json@ | 出現回数(art/json) | len |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 1 | 79の2 | （国庫補助金等の交付前に取得した固定資産等… | FOUND | 17 | 199903 | 1/1 | 44 |
| 2 | 79の2 | 一当該固定資産の取得又は改良をするために要した金額… | FOUND | 247 | 200133 | 1/1 | 51 |
| 3 | 82の3 | （工事負担金の交付前に取得した固定資産の圧縮限度額）… | FOUND | 315 | 202220 | 1/1 | 42 |
| 4 | 82の3 | 一当該固定資産の取得をするために要した金額… | FOUND | 488 | 202393 | 1/1 | 62 |
| 5 | 83の4 | （賦課金の納付前に取得した固定資産等の圧縮限度額）… | FOUND | 567 | 203410 | 1/1 | 41 |
| 6 | 83の4 | 一当該固定資産の取得又は改良をするために要した金額… | FOUND | 769 | 203612 | 1/1 | 62 |

- **FOUND 6 / MISS 0**。needle の長さは 41〜62 文字、6 本すべて相互に異なることを確認。
  アンカーの勝手な変更・正規化・文字変換はしていません（原文の `あつて` / `となつた` 等の
  旧仮名遣いも保持）。各 needle に条号（第七十九条の二 / 第八十二条の三 / 第八十三条の四）
  を含むため一意性が担保されています。

## 7. README / PROGRESS に足す 1 行文案

CROSS_LAW の scan/pin 件数や監査 literal 総数はメインセッションが計算するため、ここでは書きません。

- **README.md**（法人税率モジュール一覧の末尾付近、例: `ForeignCorpResidualRate*` 行の直後に追加）:
  ```text
  JapanTaxLaw/CorpAssetCompression.lean / -Spec.lean / -Tests.lean  # 法人税法施行令 art. 79の2/82の3/83の4（固定資産圧縮限度額 = 帳簿価額 × 第二条/第一条、82の3・83の4 は「達するまで」を min で表現）L4 モデル・独立定式・退行テスト
  ```
- **docs/PROGRESS.md**（L4 着手済みモジュール一覧の末尾に追記）:
  ```text
  法人税法施行令 art. 79の2/82の3/83の4（CorpAssetCompression.lean：圧縮限度額の按分計算 3 条を Money 上の floor 除算でモデル化、分母 0 は 0、「達するまで」は min、帳簿価額・各金額は caller-established、他条・周辺計算 NOT YET COVERED）
  ```

## 8. インテグレーターへの明示事項

**インテグレーターは `JapanTaxLaw.lean` に以下の 3 つの import を追加すること。**

```lean
import JapanTaxLaw.CorpAssetCompression
import JapanTaxLaw.CorpAssetCompressionSpec
import JapanTaxLaw.CorpAssetCompressionTests
```

（W-A〜W-M, W-O の各 3 件と併せてメインが行数を確認してください。
W-N は `JapanTaxLaw.lean` を書き換えていません。）

## 9. 範囲・残ブロッカーの正直な申告（最終報告）

- **build**: 自作 3 モジュールのみ `lake build` 成功（5 jobs / warning なし）。全体ビルド・CI・
  `run_python_gates.py` は未実行です。
- **axiom**: 新規 12 def + 4 定理の計 16 件すべて axiom-free、
  `Classical.choice` / `sorryAx` / `propext` なし（一時ファイルは削除済み）。
- **逐語**: FOUND 6 / MISS 0（担当範囲原文・pinned JSON の両方、出現回数 1）。
- **def 数**: 実装 4 + spec 4 + agree 4 = **12 def**（＋ agree 真値定理 4 本）。
- **STAGING**: 本ファイル `docs/STAGING_WN.md` を作成（上書き）済みです。
- これは **L4 のごく小さなスライス**です。**完成・網羅を主張しません**。
- 担当は 法人税法施行令 **第七十九条の二 / 第八十二条の三 / 第八十三条の四 の 3 条のみ**。
  79の3 / 82の4 / 83の5 を含む他の圧縮限度額規定、および法人税法 42 / 45 / 46 各第一項の
  損金算入限度額・周辺計算は **NOT YET COVERED**。
- 帳簿価額（改良の場合は改良部分の帳簿価額）・第一条金額・第二条金額はすべて
  caller-established とし、法的判断の自動化はしていません。
- 分母 0 を 0 とするのは原文に明示された規則ではなく、モデル定義性のための defensive な
  選択です（doc-comment に明記済み）。法的な取扱いの確定はメインセッションの判断に委ねます。
- `agree*` は定数同士の `==` 一致確認であり、法的意味の等価証明ではありません。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり、法的正しさを保証しません。
- **L7 候補 3,438 件は unreviewed のまま**です（本スライスでは一切レビューしていません）。
- 残ブロッカー: 転記監査 check の `checks()` への組み込み（§3、+6）、`JapanTaxLaw.lean` への
  import 追加（§8）、README / PROGRESS の 1 行追記（§7）、および全体ビルド・CI ゲートの
  実行は**すべてメインセッションの担当**です（W-N は実行していません）。
