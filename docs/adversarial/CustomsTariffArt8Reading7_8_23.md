### CustomsTariffArt8Reading7_8_23.lean — 独立原文監査（Batch CT-READING-7-8-23）

- 一次資料（pinned・改変禁止）: `data/raw/143AC0000000054_20260601_508AC0000000005.law.json`
  law_id `143AC0000000054`, revision `143AC0000000054_20260601_508AC0000000005`, 施行日 2026-06-01。
- 独立再抽出: pinned JSON の `Sentence` ノードを再帰走査し、`Article:8` 第28項の
  逐語「第七項、第八項及び第二十三項の規定は、前項の調査が開始された場合について準用する。」を
  取得（raw 内出現回数 = 1）。漢字「七」「八」「二十三」を自前で 7, 8, 23 に変換。
- 照合 / 判定: 実装 `incorporated` の match と独立仕様 `specParagraphs = [7,8,23]` は
  再抽出値と一致（D=PASS）。範囲外 6, 9, 22, 24 は false、条件 false では 7 も false、
  条件 true では 7 と 23 が true、9 は false を kernel `decide` で確認。

### H / T / D / C / U（H/T/D/C/U 記録）

- **H（反証可能仮説）**: H1 準用対象は第7項・第8項・第23項に限られ、前項の調査開始が発動条件である。
- **T（再現検査）**: T1 pinned `Article:8` を直接 walk し needle の一意性を確認；
  T2 pin が scoped で PASS；T3 `clause_correspondence` が {7,8,23} を受容し
  {7000000} を拒否；T4 Lean 格子上の全 examples が kernel-decided。
- **D（合否）**: D1 PASS（3 つの項番号一致）／D2 PASS（範囲外 4 点と条件 2 値、矛盾 0）。
- **C（対立解釈）**: C1 「準用」を独立義務と読む解釈、条件なしで適用する解釈は
  原文の「場合について準用する」と矛盾するため採用しない。
- **U（不確かさ）**: U1 各項の実質・調査手続・他項は NOT MODELLED。
  人間の法律専門家レビューは `LEGAL_REVIEW_PENDING`。

CONFIRMED 0 / BY-DESIGN 1 / UNRESOLVED 1。発見ゼロは欠陥不在の証明ではない。
