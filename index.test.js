const index = require("./index");
const test = require("jest");

test("yeg", () => {
  expect(index()).toBe(true);
});
