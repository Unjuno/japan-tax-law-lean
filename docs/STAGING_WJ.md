# STAGING — W-J（相続税法 第22条〜第25条 資産評価・地上権割合表を主とする bounded L4 モデル）受け渡しメモ

> 実装担当 W-J からメインセッション（統合担当）への受け渡し用。
> ブランチ操作・add/commit/push/merge は一切していません。
> 書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。
> 本ファイルは **旧 W-J（登録免許税法 第三十二号 百二十五〜百二十九／P6J）の受け渡しメモを
> 上書き**したものです。旧 P6J モジュールは既に `JapanTaxLaw.lean` に import 済みで、
> 本タスクでは一切触れていません。

## 0. 対象ファイル

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/InheritanceAssetValuation.lean` | 新規 |
| `JapanTaxLaw/InheritanceAssetValuationSpec.lean` | 新規 |
| `JapanTaxLaw/InheritanceAssetValuationTests.lean` | 新規 |
| `docs/STAGING_WJ.md` | 既存（旧 W-J メモ）を本タスク用に overwritten（本ファイル） |

pinned source: 相続税法 `data/raw/325AC0000000073_20260401_506AC0000000008.law.json`
law id `325AC0000000073` / revision `325AC0000000073_20260401_506AC0000000008`
（施行日 2026-04-01、既存 `InheritanceTax*` / `InheritanceMiscRates*` と同一ピン）。
担当範囲原文: `C:\Users\junny\AppData\Local\Temp\opencode\W_J_inheritance_eval.txt`
（第22条〜第25条・正規化済み・UTF-8）。
名前空間は他と衝突しないよう **`JapanTaxLaw.InheritanceAssetValuation`** を採用
（既存モジュールの多くは `namespace JapanTaxLaw` だが、本タスクは明示的にサブ名前空間を指定されました）。

## 1. スコープ判断（4 条文）

| 条 | 題 | 判断 | 根拠 |
| --- | --- | --- | --- |
| 22 | 評価の原則 | **NOT MODELLED** | 「時価による」「債務の金額はその時の現況による」のみで算術式なし。時価・債務額の認定は caller-established。 |
| 23 | 地上権及び永小作権の評価 | **MODELLED（主対象）** | 残存期間 10 区分の割合表と「土地時価 × 割合（切り捨て）」の明示的算術式がある。 |
| 24 | 定期金に関する権利の評価 | **NOT MODELLED** | 複利年金現価率（財務省令で定める割合・原文に数式なし）・予定利率・政令で定める余命年数を用い、複数区分で「いずれか多い／少ない金額」の比較を伴う。bounded な再現を主張できない。 |
| 25 | 定期金給付契約 | **明確な部分のみ MODELLED** | 定期金給付事由未発生のうち「解約返戻金の定めがない場合」に「百分の九十を乗じて得た金額」の明示的算術がある。基礎の複利計算額は caller-established。第二号（解約返戻金のある場合）の金額認定は非モデル化。 |

caller-established（本モデルへの入力・判定は行わない）:

- 土地の時価、残存期間（年）、存続期間の定めのない地上権かどうか（art. 23）。
- art. 23 の借地借家法の借地権・民法269条の2第1項（地下/空間を目的とする地上権）の除外該当性。
- art. 25 の生命保険契約の除外、定期金給付事由が発生済みか（発生済みなら art. 24 の対象）、
  解約返戻金の定めがあるか、複利計算額（予定利率の元利合計額／複利年金終価率）。
- 端数は `TaxRate.applyFloor`（切り捨て）。政令の丸め細目・申告手続は射程外。

## 2. 追加した def 一覧

`namespace JapanTaxLaw.InheritanceAssetValuation`、`open JapanTaxLaw.TaxFinance`、`Money = Nat`。

### 実装モジュール（`InheritanceAssetValuation.lean`）— def 5 本 / 定理 4 本

| # | 条 | def 名 | 内容 |
| --- | --- | --- | --- |
| 1 | 23 | `pctRate` | 百分率 `pct` を `⟨pct, 100, by decide⟩ : TaxRate` に（分母 100） |
| 2 | 23 | `superficiesRate` | `(years : Nat) → (perpetual : Bool) → TaxRate`。下記割合表を全区分実装 |
| 3 | 23 | `superficiesValue` | `(landMarketValue : Money) → years → perpetual → Money`。時価 × 割合（`applyFloor`、切り捨て） |
| 4 | 25 | `art25NoSurrenderRate` | 百分の九十を `⟨90, 100, by decide⟩ : TaxRate` に |
| 5 | 25 | `art25NoSurrenderValue` | `(compoundBase : Money) → Money` = 基礎額 × 90%（切り捨て） |

定理 4 本: `superficiesValue_eq`（rfl）、`art25NoSurrenderValue_eq`（rfl）、
`superficiesValue_mono` / `art25NoSurrenderValue_mono`（時価・基礎額について単調）。

`superficiesRate` の割合表（原文の全 10 区分を漏れなく実装）:

| 残存期間 | 割合 | 実装 |
| --- | --- | --- |
| 10 年以下 | 5% | `years ≤ 10`（perpetual=false） |
| 10 超 15 以下 | 10% | `years ≤ 15` |
| 15 超 20 以下 | 20% | `years ≤ 20` |
| 20 超 25 以下 | 30% | `years ≤ 25` |
| 25 超 30 以下 **及び存続期間の定めのない地上権** | 40% | `years ≤ 30` 又は `perpetual = true` |
| 30 超 35 以下 | 50% | `years ≤ 35` |
| 35 超 40 以下 | 60% | `years ≤ 40` |
| 40 超 45 以下 | 70% | `years ≤ 45` |
| 45 超 50 以下 | 80% | `years ≤ 50` |
| 50 超 | 90% | 上記いずれでもない場合 |

`perpetual = true` は残存期間の値にかかわらず最優先で 40%（存続期間不定の地上権）。

境界の意味: ちょうど 10 年 → 5%、10 年を超え 15 年 → 10%、…、ちょうど 50 年 → 80%、
50 年を超える → 90%。これを全区分の smoke（impl / Tests）で `decide` 確認済み。

### Spec モジュール（`InheritanceAssetValuationSpec.lean`）— def 7 本

| # | 条 | def 名 | 内容 |
| --- | --- | --- | --- |
| 1 | 23 | `specRatePct` | 独立定式。区間を「`< 上限+1`」で記述（実装は「`≤ 上限`」） |
| 2 | 23 | `specSuperficiesRate` | spec 側の `TaxRate` 化 |
| 3 | 23 | `specSuperficiesValue` | spec 側の `時価 × 割合 / 100` |
| 4 | 25 | `specArt25NoSurrenderValue` | spec 側の `compoundBase * 90 / 100` |
| 5 | 23 | `agreeSuperficiesRate` | years = 0..60 × perpetual 双方の割合一致・分母 100 を `decide` |
| 6 | 23 | `agreeSuperficiesValue` | years = 0..60 × perpetual 双方 × 代表時価の評価額一致を `decide` |
| 7 | 25 | `agreeArt25NoSurrenderValue` | compoundBase = 0..64 の 90% 適用一致を `decide` |

### Tests モジュール（`InheritanceAssetValuationTests.lean`）

def はなし。`example … := by decide` の kernel-decide smoke 37 件のみ
（割合表の全区分・全境界、存続期間不定の 40%、評価額、art. 25 の 90%）。

**def 合計 12 本（impl 5 / Spec 7）**、定理 4 本、`by decide` smoke 合計 88 件
（impl 41 / Spec 10 / Tests 37、agree の true 確認 3 件を含む）。

## 3. 転記監査に追加すべき check（JSON 断片）

`scripts/ci/transcription_audit.py` の `checks()` に追加する check の JSON 表現です
（`law_id` / `kind` / `title` / `needles` の 4 キー）。needle は原文から**一字も変えず**抽出し、
正規化（`_norm` = `re.sub(r"[\s　]+", "", …)`）済みの形で記載しています。
全 needle は担当範囲原文・pinned JSON の双方で `.find()` に命中します（§6）。

```json
{
  "law_id": "325AC0000000073",
  "kind": "file",
  "title": null,
  "needles": [
    "（評価の原則）第二十二条この章で特別の定めのあるものを除くほか、相続、遺贈又は贈与により取得した財産の価額は、当該財産の取得の時における時価により",
    "（地上権及び永小作権の評価）第二十三条",
    "その残存期間に応じ、その目的となつている土地のこれらの権利を取得した時におけるこれらの権利が設定されていない場合の時価に、次に定める割合を乗じて算出した金額による",
    "残存期間が十年以下のもの百分の五",
    "残存期間が十年を超え十五年以下のもの百分の十",
    "残存期間が十五年を超え二十年以下のもの百分の二十",
    "残存期間が二十年を超え二十五年以下のもの百分の三十",
    "残存期間が二十五年を超え三十年以下のもの及び地上権で存続期間の定めのないもの百分の四十",
    "残存期間が三十年を超え三十五年以下のもの百分の五十",
    "残存期間が三十五年を超え四十年以下のもの百分の六十",
    "残存期間が四十年を超え四十五年以下のもの百分の七十",
    "残存期間が四十五年を超え五十年以下のもの百分の八十",
    "残存期間が五十年を超えるもの百分の九十",
    "（定期金に関する権利の評価）第二十四条",
    "当該契約に係る予定利率による複利年金現価率",
    "第二十五条定期金給付契約（生命保険契約を除く。）",
    "当該契約に係る予定利率による複利年金終価率",
    "百分の九十を乗じて得た金額"
  ]
}
```

参考：現行スクリプト形式への変換例（name は任意、needles は上記 18 本を一字も変えずに列挙）:

```python
yield ("相続税法 art. 22〜25（資産評価）↔ InheritanceAssetValuation.lean（art.23 地上権割合表 5/10/20/30/40/50/60/70/80/90%・存続期間不定 40%、art.25 の 90% のみ）",
       "325AC0000000073", "file", None,
       [ ...上記 needles 18 本を一字も変えずに列挙... ])
```

needle とモデルとの対応:

| # | 対応 | 備考 |
| --- | --- | --- |
| 1 | art. 22（NOT MODELLED の根拠） | 評価原則・算術式なし |
| 2, 3 | art. 23 の条題名と算定規定 | `superficiesRate` / `superficiesValue` |
| 4〜13 | art. 23 の割合表 10 区分（5%〜90%） | `superficiesRate` の全区分（#8 に存続期間不定の 40% を含む） |
| 14, 15 | art. 24（NOT MODELLED の根拠） | 複利年金現価率（出現回数 2: 第一号ハ・第三号ハ） |
| 16, 17, 18 | art. 25（部分モデルの根拠） | 17 は複利計算が外部パラメータである根拠、18 は 90% |

## 4. 期待 literal 増分

- W-J 担当分: 新規 check **18 needles** なので **+18**。
- `docs/PROGRESS.md` の監査 literal 総数はメインセッションが再確認して加算してください
  （起点値は本メモでは書きません）。

## 5. 検証結果（すべて本セッションで実行済み）

- `lake build JapanTaxLaw.InheritanceAssetValuation JapanTaxLaw.InheritanceAssetValuationSpec JapanTaxLaw.InheritanceAssetValuationTests`
  → **成功（5 jobs、warning なし）**。※自作 3 モジュールのみビルド。全体ビルド／CI／
  `run_python_gates.py` は**実行していません**。
- `python scripts/ci/check_no_sorry.py` → `no forbidden placeholder proofs found in tracked Lean sources`。
  （新規 3 ファイルは未追跡のため走査対象外ですが、人力でも `sorry` / `admit` はありません。）
- `#print axioms`（一時ファイル `WJAxiomProbe.lean` を approved temp dir に作成、
  `lake env lean` で実行後 **削除済み**、残ファイル数 0）: 新規定理 4 件を検査。
  - `superficiesValue_eq` / `art25NoSurrenderValue_eq`（rfl）の **2 件は `does not depend on any axioms`**。
  - `superficiesValue_mono` / `art25NoSurrenderValue_mono` の **2 件は `propext` のみ**（許可範囲）。
  - **`Classical.choice` も `sorryAx` も一切なし**。
- 原文逐語検証: **18/18 FOUND、MISS 0 件**。needle は一字も変えず原文から抽出。
  - 担当範囲原文 `W_J_inheritance_eval.txt` を `_norm` と同一の
    `re.sub(r"[\s　]+", "", …)` で正規化した文字列に `.find()` → 18/18 FOUND。
  - pinned JSON を `transcription_audit.py` の `text()` と同一ロジックで平坦化・正規化した
    文字列に対しても 18/18 FOUND（§6）。
  - law id `325AC0000000073` / revision `325AC0000000073_20260401_506AC0000000008` は
    `data/INVENTORY.json` の当該 law レコードで FOUND（pinned snapshot 名も一致）。
- 割合表の境界 smoke: 10/15/20/25/30/35/40/45/50 の各「ちょうど」と「+1」、
  および perpetual = true の 40% を impl・Spec・Tests の三方で `decide` 確認。

## 6. 逐語検証 FOUND / MISS 一覧（一字も変更せず）

`art@` は担当範囲原文の正規化文字列上の offset、`json@` は pinned JSON の平坦化・正規化文字列上の
offset。needle 15 のみ複数回出現（第一号ハ・第三号ハで 2 回）で、それ以外は出現回数 1。

| # | 結果 | art@(回数) | json@(回数) | 長さ | 区分 |
| --- | --- | --- | --- | --- | --- |
| 1 | FOUND | 15 (1) | 34603 (1) | 73 | art.22 見出し＋評価原則 |
| 2 | FOUND | 135 (1) | 34708 (1) | 19 | art.23 条題名 |
| 3 | FOUND | 248 (1) | 34821 (1) | 81 | art.23 算定規定 |
| 4 | FOUND | 330 (1) | 34903 (1) | 16 | 10 年以下 5% |
| 5 | FOUND | 346 (1) | 34919 (1) | 22 | 10 超 15 以下 10% |
| 6 | FOUND | 368 (1) | 34941 (1) | 24 | 15 超 20 以下 20% |
| 7 | FOUND | 392 (1) | 34965 (1) | 25 | 20 超 25 以下 30% |
| 8 | FOUND | 417 (1) | 34990 (1) | 43 | 25 超 30 以下＋存続期間不定 40% |
| 9 | FOUND | 460 (1) | 35033 (1) | 25 | 30 超 35 以下 50% |
| 10 | FOUND | 485 (1) | 35058 (1) | 25 | 35 超 40 以下 60% |
| 11 | FOUND | 510 (1) | 35083 (1) | 25 | 40 超 45 以下 70% |
| 12 | FOUND | 535 (1) | 35108 (1) | 25 | 45 超 50 以下 80% |
| 13 | FOUND | 560 (1) | 35133 (1) | 19 | 50 超 90% |
| 14 | FOUND | 595 (1) | 36339 (1) | 19 | art.24 条題名 |
| 15 | FOUND | 943 (2) | 36687 (2) | 21 | art.24 複利年金現価率（2 回出現） |
| 16 | FOUND | 2193 (1) | 37922 (1) | 24 | art.25 条題名 |
| 17 | FOUND | 2551 (1) | 38280 (1) | 21 | art.25 複利年金終価率 |
| 18 | FOUND | 2348 (1) | 38077 (1) | 13 | art.25 百分の九十 |

- **FOUND 18 / MISS 0**。needle の長さは 13〜81 文字。アンカーの勝手な変更・正規化・
  文字変換はしていません（原文の `つ / つて` の使い分け、例:「取得した時における」等も保持）。
- needle 15 は原文内で 2 回出現します（`複利年金現価率（…第三号ハにおいて同じ。）` の
  定義と第三号ハでの参照）。転記監査の `contains()` は `.find()` 命中のみを要求するため
  問題ありませんが、回数をここに正直に記録します。

## 7. README / PROGRESS に足す 1 行文案

CROSS_LAW の scan/pin 件数や監査 literal 総数はメインセッションが計算するため、ここでは書きません。

- **README.md**（モジュール一覧末尾に追加）:
  ```text
  JapanTaxLaw/InheritanceAssetValuation.lean / -Spec.lean / -Tests.lean  # 相続税法 art. 22〜25（資産評価）の bounded L4 モデル（art.23 地上権・永小作権の残存期間別割合表 5/10/20/30/40/50/60/70/80/90%・存続期間不定は 40%、土地時価×割合の切り捨て。art.25 は 90% のみ。art.22/24 は NOT MODELLED）・独立定式・退行テスト
  ```
- **docs/PROGRESS.md**（L4 着手済みモジュール一覧の末尾に追記）:
  ```text
  相続税法 art. 22〜25 資産評価（InheritanceAssetValuation.lean：art.23 の地上権残存期間 10 区分の割合表と評価額をモデル化、存続期間不定の地上権は 40%、art.25 は「百分の九十」のみ、art.22/24 は NOT MODELLED、土地時価・残存期間・複利計算額は caller-established）
  ```

## 8. インテグレーターへの明示事項

**インテグレーターは `JapanTaxLaw.lean` に以下の 3 つの import を追加すること。**

```lean
import JapanTaxLaw.InheritanceAssetValuation
import JapanTaxLaw.InheritanceAssetValuationSpec
import JapanTaxLaw.InheritanceAssetValuationTests
```

（W-J は `JapanTaxLaw.lean` を書き換えていません。旧 W-J の `RegistrationQualificationFeesP6J*`
ほか既存モジュール（`InheritanceTax*` / `InheritanceMiscRates*` を含む）には一切触れていません。
W-K / W-L の担当ファイル、`data/*`、L7 CSV にも触れていません。メインが統合してください。）

## 9. 範囲・残ブロッカーの正直な申告（最終報告）

- **build**: 自作 3 モジュールのみ `lake build` 成功（5 jobs / warning なし）。全体ビルド・CI・
  `run_python_gates.py` は未実行です。
- **axiom**: 検査 4 件のうち 2 件 axiom-free（rfl）、2 件は `propext` のみ。
  `Classical.choice` / `sorryAx` なし（一時ファイルは削除済み）。
- **逐語**: FOUND 18 / MISS 0（担当範囲原文・pinned JSON の両方）。needle 15 は 2 回出現、
  それ以外は 1 回。長さ 13〜81 文字。
- **def 数**: 12（impl 5 / Spec 7）。定理 4 本、by decide smoke 88 件。needle 増分 +18。
- **STAGING**: 本ファイル `docs/STAGING_WJ.md` を作成（旧 W-J メモを上書き）済みです。
- これは **L4 のごく小さな bounded スライス**です。**完成・網羅を主張しません**。
- 主対象は相続税法 **第23条のみ**（割合表 10 区分と評価額）。第22条・第24条は **NOT MODELLED**、
  第25条は **「百分の九十」の明確な部分のみ** のモデル化です。
- 土地時価・残存期間・存続期間不定か・複利計算額の認定、借地権/地下地上権の除外、
  生命保険契約の除外、解約返戻金の有無はすべて caller-established とし、
  法的判断の自動化はしていません。
- `agree*` は有限サンプル（years 0..60／compoundBase 0..64）の `==` 一致確認であり、
  全 `Nat` に対する普遍的同値でも、法的意味の等価証明でもありません。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり、法的正しさを保証しません。
- **L7 候補 3,438 件は unreviewed のまま**です（本スライスでは一切レビューしていません）。
- 残ブロッカー: 転記監査 check の `checks()` への組み込み（§3、+18）、`JapanTaxLaw.lean` への
  import 追加（§8）、README / PROGRESS の 1 行追記（§7）、および全体ビルド・CI ゲートの
  実行は**すべてメインセッションの担当**です（W-J は実行していません）。
