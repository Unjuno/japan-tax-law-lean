from __future__ import annotations

import importlib.util
import json
import sys
import tempfile
import unittest
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
CI = REPO / "scripts" / "ci"
if str(CI) not in sys.path:
    sys.path.insert(0, str(CI))

spec = importlib.util.spec_from_file_location("sel_owner", CI / "task_selector.py")
sel = importlib.util.module_from_spec(spec)
spec.loader.exec_module(sel)
core_spec = importlib.util.spec_from_file_location("core_owner", CI / "normative_core.py")
core = importlib.util.module_from_spec(core_spec)
core_spec.loader.exec_module(core)


class TestOwnerPersistence(unittest.TestCase):
    def test_agent_claim_is_written_to_durable_state(self):
        with tempfile.TemporaryDirectory() as td:
            tmp = Path(td)
            queue = tmp / "task_queue.json"
            state = tmp / "task_state.json"
            unit = {
                "id": "NORM|" + "a" * 64,
                "normative_id": "NORM|" + "a" * 64,
                "law_id": "143AC0000000054",
                "article": "7",
                "kind": "EXCEPTION",
                "status": core.STATUS_NOT_STARTED,
                "text": "六月以内に限り延長することができる",
                "dependencies": [],
                "unhandled_conditions": [],
                "obligations": [],
                "owner": "",
                "coverage": {"exact": True, "unique_ids": True},
            }
            queue.write_text(json.dumps({"tasks": [unit]}), encoding="utf-8")
            selector_core = sys.modules["normative_core"]
            old_q, old_s, old_argv = sel.QUEUE, selector_core.STATE_PATH, sys.argv
            try:
                sel.QUEUE = queue
                selector_core.STATE_PATH = state
                sys.argv = ["task_selector.py", "1", "--agent=VERIFY_UNIT"]
                sel.main()
            finally:
                sel.QUEUE, selector_core.STATE_PATH, sys.argv = old_q, old_s, old_argv
            data = json.loads(state.read_text(encoding="utf-8"))
            rec = data["units"][unit["normative_id"]]
            self.assertEqual(rec["owner"], "VERIFY_UNIT")
            self.assertTrue(rec.get("history"))


if __name__ == "__main__":
    unittest.main()
