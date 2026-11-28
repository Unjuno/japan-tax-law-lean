# L7 統合レジャー — 機械計測のみ（主張ではない）

本書は `scripts/ci/l7_ledger.py` が `data/INVENTORY.json` と
`build/audit_sweep.json`（存在する場合）と `scripts/law_audit/phase_e/cross_law.py`
の出力から**機械生成**する。数値は計測値であり、いかなる解釈の正しさも主張しない。
候補は独立の法的レビュー前に確定欠陥と呼ばない。verified-anomaly = 0 は
「異常なし」ではなく「独立レビューで確定された異常が 0 件」である。
`references_extracted` / `references_internal_checked` / `references_external_unverified`
は各々が独立の計測であり、
相加性を前提とした集計は行わない（内部チェックは 1 参照につき項と号で 2 回計上されうる）。

## 1. 対象法令台帳の実測（data/INVENTORY.json）

| 指標 | 値 |
|---|---|
| 台帳候補件数 | 327 |
| CurrentEnforced | 324 |
| 監査対象外の版 | 3 |

## 2. 構造監査の実測（build/audit_sweep.json）

| 指標 | 値 |
|---|---|
| 条文数 | 42,584 |
| 項数 | 86,403 |
| 号数 | 61,672 |
| references_extracted（参照イベント件数） | 476,500 |
| references_internal_checked | 100,944 |
| references_external_unverified | 157,983 |
| references_unsupported | 250,043 |
| candidate（未確定） | **3,438** |
| verified-anomaly | **0** |

## 3. 候補の内訳（by rule）

| ルール | 件数 |
|---|---|
| PAREN.UNBALANCED | 1536 |
| REF.ITEM.MISSING | 829 |
| REF.ARTICLE.MISSING | 587 |
| REF.PARA.MISSING | 339 |
| REF.SUPP.MISSING | 99 |
| REF.ARTICLE.DELETED | 39 |
| STRUCT.GAP.ARTICLE | 5 |
| REF.RELATIVE.MISSING | 3 |
| TOC.BODY.MISSING | 1 |

完全な候補ごとの一覧とレビュー状態は [`L7_CANDIDATES_UNREVIEWED.csv`](L7_CANDIDATES_UNREVIEWED.csv) に機械生成で掲載（`scripts/ci/l7_candidates.py`、CI で再生成照合。行は全件 `review_status=unreviewed`）。

## 4. 明示的に非対応の範囲（非計上・非検証として記録）

| 範囲 | 状態 |
|---|---|
| 地方税条例（約 1,788 団体・各自が独立した法源） | **非対応**（台帳対象外・未検証） |
| 租税条約（日本国との条約原典本文） | **非対応**（台帳対象外・未検証） |
| 通達（法令本文と区別して扱う解釈補助層） | **非対応**（未検証） |
| 裁判例（法令本文と区別して扱う解釈補助層） | **非対応**（未検証） |

## 5. クロスロー・ピン整合（L1↔L3）

```text
cross_law: scanned 2842 Lean files; 1353 pinned modules consistent, 0 failed; 1489 unpinned (not counted as verified); unresolved unenforced laws: 508CO0000000106, 508M60000040027
```

## 6. 検証境界（誠実な宣言）

- 全ての `candidate` は独立レビュー未了であり、**確定した欠陥ではない**。
- verified-anomaly = 0 は、欠陥存在の否定ではなく、独立レビューを経た確定異常が 0 件であること。
- Lean による主張は**モデルの内部命題のみ**。法文との対応は pin（law_revision_id/施行日/SHA-256）に限る。
- 非対応範囲（§4）は検証結果に**含まれていない**。
- 本レジャーの数値は `data/INVENTORY.json` と `build/audit_sweep.json` に従う。
