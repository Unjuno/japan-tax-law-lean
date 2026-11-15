# 統合ステータス台帳 — 進捗・完了率・限界（2026-11-15 時点）

本書は、日本の税法形式検証（Unjuno/japan-tax-law-lean）の**実測に基づく進捗**を、Phase ごとに機械検証可能な形で記録します。数値は本書作成時に `build/audit_sweep.json`・`data/INVENTORY.json`・`python -m unittest` の実行結果から転記したもので、第三者が同一コミットから再現できます（再現手順は末尾）。

> **本書の数値は自動計測による下限です。** 「不明」を「成功」に数えません。`candidate` は**未確定の監査上の候補**であり、欠陥ではありません。`verified-anomaly`（独立の法的レビューを通過したと判定できる異常）は現時点で **0 件**のままです。

## 1. 対象母集団（Phase A — 対象法令台帳）

| 指標 | 実測値（2026-11-15） |
|---|---|
| e-Gov 全現行法令一覧 | 9,001 件のうち `税` を含む **327 件**（法律 74・政令 113・省令/府令 140） |
| 適用版確定 | **325 / 327**（324 CurrentEnforced + 1 historical_fallback; 内 1 は `audit_ready=False`） |
| 完全未施行（unresolved） | 2 件（`508CO0000000106` 防衛特別所得税政令・`508M60000040027` 防衛特別所得税省令）— **検証対象から除外、成功に計上しない** |
| 原文・改正履歴のハッシュピン留め | 325 件全件 `data/raw/` に SHA-256 固定、`validate_inventory.py` OK |
| `INVENTORY.json` 検証 | OK — 327 records / 325 resolved / 2 unresolved |

**未実装の母集団（記録済・対象外扱い）**

- 地方税条例（市町村・特別区・都道府県ごとの独立法源、約 1,788 団体）: 台帳上 `unsupported`。国税の現行法令一覧に含まれず、別途の取得戦略が必要。
- 租税条約・通達・裁判例・告示を含む解釈レイヤー: 法令本文と区別し未対応（`unsupported`）。
- 関税法・関税定率法（関税系）は台帳（税キーワード抽出 327 件）に含まれることを確認済みだが、Lean 意味モデルは未着手。

## 2. Phase 別の完了状況

| 層/Phase | 状態 | 実測 |
|---|---|---|
| **PHASE A — 全法令インベントリ** | **完了（325/327 ピン留め; 2 件は未施行のため検証不能）** | 取得 325/325 OK、ハッシュ検証 OK |
| **PHASE B — 全体系の構造監査** | **完了（機械処理のみ、未確定）** | 対象 325 件 / パース失敗 0 / 監査失敗 0 |
| **PHASE C — 共通形式意味論** | **完了**（`JapanTaxLaw/TaxFinance.lean`） | Money、TaxRate(floor/ceil 証明)、Period、Priority（law>order>notice、全順序・推移律・非反射律）; 21 件の dec テスト |
| **PHASE D — 税目別形式化（actor scope のみ）** | **進行中**（17 本の stacked PR、機械検証は全て `propext` のみ） | 意味モデルは定義層・actor scope に限定 |
| **PHASE E — 法令横断検証** | **着手（シード）** `scripts/law_audit/phase_e/cross_law.py` | 実 `JapanTaxLaw/*.lean` のピン留め vs 台帳整合を検査; 12 テスト; **意味横断検証は未完了** |
| **PHASE F — 改正影響検証** | **未着手（前提計測のみ）** | 現行 pin の revision tuple は `amendment_law_id` / `amendment_enforcement_date` を `data/raw/*.revisions.json` 由来で保持。2026-11-15 の計測: 相異なる `amendment_law_id` **189 件**のうち、2016 年時点の現行税法インベントリ（本台帳の母集団 327 件）に含まれるのは **3 件**にとどまり、残りは `lawlists_1.xml`（現行法令一覧・e-Gov API v1）にも現れません（改正法が現行法令一覧に残らないことはあり得ますが、根拠は今後の確認待ち）。新旧 diff による影響伝播機構は未実装 |
| **PHASE G — 統合監査（再現可能）** | **未完了**（`lake build`+`unittest`+`validate_inventory`+clean builds ×2 は CI にある） | 第三者再現手順は `CONTRIBUTING.md` と CI 経由; 統合レポート生成はこれから |

## 3. Phase B の実測値（`build/audit_sweep.json`、2026-11-15）

| 指標 | 実測 |
|---|---|
| 走査対象 | 325 法令、0 parse failure、0 audit failure |
| 条文数 | **33,652**（項 77,471 / 号 45,836） |
| 参照抽出数 | **461,067**（内部解決 63,214 / 外部未解決 169,032 / 未対応構文 240,799） |
| 監査結果 | **verified-anomaly 0 件** / **candidate 3,280 件（すべて未確定）** |

候補内訳（by rule；すべて未確定・独立レビュー未実施）:

| ルール | 件数 |
|---|---|
| PAREN.UNBALANCED（かっこ不整合） | 1,492 |
| REF.ITEM.MISSING（号参照欠落） | 914 |
| REF.ARTICLE.MISSING（条参照欠落） | 362 |
| REF.PARA.MISSING（項参照欠落） | 341 |
| REF.SUPP.MISSING（附則参照欠落） | 95 |
| REF.ARTICLE.DELETED（削除条文参照） | 67 |
| STRUCT.GAP.ARTICLE（条番号の連番ギャップ） | 5 |
| REF.RELATIVE.MISSING（相対参照の不一致） | 3 |
| TOC.BODY.MISSING（目次と本文の不整合） | 1 |

**これらは「欠陥」ではありません。** いずれも独立の法的レビューで確定するまで候補扱いです。`verified-anomaly` は 0 件のままです。

## 4. PHASE D の機械検証範囲（意味形式化された条文）

すべて **actor scope / 定義層** の形式化であり、課税標準の計算・端数処理・例外の全結合・得税額との統合は**未着手**です。各モジュールは `Law id`/`Revision`/`sha256` を原文ピンで保持し、`cross_law.py` により台帳との照合を受けます（48 ファイル / 24 ピン留めモジュール一致 / 0 失敗）。

| 法令 | 条文 | モジュール | PR（base） |
|---|---|---|---|
| 所得税法 340AC0000000033 | 第2条第1項第3号・第5号・第3条 | `Residency.lean` `StatutoryModel.lean` | #1（main に出荷済 R1） |
| 法人税法 340AC0000000034 | 第2条第3号・第4号 | `CorpActor.lean` | #5（phase-c/common-semantics） |
| 国税通則法 337AC0000000066 | 第2条第1〜4号 | `TaxGeneral.lean` | #6（phase-d/corporate-actor-scope） |
| 同上 | 第2条第5号（納税者） | `Taxpayer.lean` | #7（同上の次） |
| 同上 | 第4条（優先規則・lex specialis） | `TaxGeneralPriority.lean` | #8 |
| 同上 | 第2条第10号（強制換価手続） | `TaxProcedure.lean` | #9 |
| 同上 | 第2条第8号（法定納期限） | `StatutoryDeadline.lean` | #10 |
| 同上 | 第2条第9号（課税期間） | `TaxationPeriod.lean` | #11 |
| 同上 | 第15条（納税義務の成立） | `ObligationArt15.lean` | #13 |
| 消費税法 363AC0000000108 | 第2条第3・4・7号 + 第5条第1項 | `ConsumptionTaxActor.lean` | #12 |
| 相続税法 325AC0000000073 | 第1条の3（actor scope） | `InheritanceTaxActor.lean` | #14 |
| 地方税法 325AC0000000226 | 第6条（公益等による不課税） | `LocalExemption.lean` | #15 |
| 同上 | 第7条（受益に因る不均一課税） | `LocalPrivilege.lean` | #16 |
| 同上 | 第24条第1項 actor scope（一〜四の二） | `LocalObligor.lean` | #18 |

すべての Phase D モジュールについて、**独立形式仕様（`*Spec.lean`）による健全性・整合性定理対**と、**DecidableEq による決定的スモークテスト（`*Tests.lean`）**を維持します。公理依存は全案 `propext` のみ、または 0 件（`lake env lean` で `#print axioms` を直接確認・CI ガード登録済み・100 件の print 登録（grep 計測））。**proof-of-anomaly はどこにもありません。**

## 5. 現在の完成率（完成判定への進捗）

### 計測できる完了率

- 対象母集団（e-Gov 税キーワード抽出）確定: **100%（327/327 登録済）**
- 原文取得率（ピン留め可能な法令）: **325/327 = 99.4%**（2 件は完全未施行・取得不能、成功件数に不算入）
- 構造監査実施率: **325/325 = 100%**（パース・監査とも失敗 0）
- 意味モデルの条文対応率: **actor scope 13 モジュール**（33,652 条中 ~0.04%）— すなわち**意味検証はほぼ未達**です。「全体系の構造監査完了＋部分的な意味検証完了」の状態を区別します
- 再現性: `lake build`（51 jobs）/ `lake clean` → `lake build` ×2 再現 / Python 単体テスト 66 件 / `validate_inventory.py` / `cross_law.py` — すべて CI に登録・有効
- 変異注入: `scripts/tests/test_mutation_injection.py` — 12 クラスで規律検査が検出に使われることを確認

### 検出候補と確定異常

| 区分 | 件数 |
|---|---|
| 未確定の監査候補 | **3,280**（すべて `candidate`、確定欠陥ではない） |
| 誤検出として確認されたもの | 0（個別レビューは未実施のため確証なし） |
| **verified-anomaly（確定した欠陥）** | **0**（該当なしを意味するのではなく、独立レビュー前は誰も欠陥と呼ばない） |

## 6. L1–L7 アーキテクチャの実装状況

| 層 | 状態 |
|---|---|
| L1 Legal Sources | **実装済**（pin・sha256・施行日・改正履歴を台帳＋`data/raw/` に固定） |
| L2 Legal Structure | **実装済・全件実行済**（`model.py` `rules.py` `audit.py` `sweep.py`；テスト 35 + 誤変更注入 12 クラス） |
| L3 Legal Semantics | **部分的**（TaxFinance 共通層＋actor/定義層 13 モジュール） |
| L4 Tax Computation | **未着手**（端数処理・税額計算仕様は存在しない） |
| L5 Formal Verification | **部分的**（L3 の各モジェールに sound/complete 定理対） |
| L6 Counterexample Discovery | **未着手**（Mutation 注入のみ; 反例探索エンジンではない） |
| L7 Evidence and Reporting | **ドラフト**（AUDIT_REPORT.md・INVENTORY.md・本書）; 機械生成統合レポートは未完了 |

## 7. 既知の限界（必読）

1. **Lean が証明するのは形式モデルの内部命題のみです。** モデルと法文の対応は pin（law_revision_id・施行日・SHA-256 のバイト一致、`cross_law.py` による機械的照合）によってのみ担保されます。正当な解釈は保証しません。
2. **候補は未確定です。** 3,280 件の `candidate` は、かっこ不整合や参照先欠落に基づく機械検査の出力であり、法的欠陥の認定ではありません。独立の法的レビューなしに「抜け穴」「誤記」と呼べません。
3. 地方税条例（約 1,788 団体・団体ごと独立法源）、租税条約・通達・裁判例は**未対応**です。国税の現行法令一覧に含まれません。
4. PHASE F（改正影響）・PHASE E の意味的横断検証・PHASE L4（税額計算）・L6（反例探索）は**未着手**です。
5. `verify` 関税法／租税特別措置法／印紙税法／登録免許税法／地方税の残りの膨大な条文は**未形式化**です。
6. 台帳の revision 自体は e-Gov API の応答に基づき `CurrentEnforced` を優先して選択していますが、候補 revision 選択の入力値・時刻依存性は `data/PROVENANCE.json` を参照してください。

## 8. 再現手順（第三者向け）

```sh
python -m unittest scripts.tests.test_structural_audit scripts.tests.test_mutation_injection \
  scripts.tests.test_inventory_selection scripts.tests.test_cross_law   # 66 tests
python scripts/law_audit/inventory/validate_inventory.py                # 台帳整合
python scripts/law_audit/phase_e/cross_law.py                           # Lean pin vs 台帳
lake build                                                              # Lean 51 jobs
lake clean && lake build                                                # 再現性（×2 CI 登録）
```

## 9. 完了判定への到達物と未達物

**到達（証拠あり）**: L1 実装・L2 全件実行・L3 の共通層と actor scope 11 法令 13 モジュール・CI 再現性・誤変更注入・台帳検証 — すべて `main` 以降の stacked PR #1–#18 に存在します。

**未達**: L3 の残り全条文・L4・L5 の全条文証明・L6・L7 統合レポート・関税定率法等のカテゴリー全体・地方税条例・改正影響（F）・全 target 法令の meaning に対する end-to-end 監査。

**完成判定ではありません。** 本システムは「部分的な意味検証＋完全な構造監査＋検証範囲の記録」までの段階です。
