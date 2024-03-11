import { g, config, connector } from "@grafbase/sdk";

const pg = connector.Postgres("pg", {
  url: g.env("CONNECTION_STRING"),
});

g.datasource(pg);

export default config({
  schema: g,
  auth: {
    rules: (rules) => {
      rules.public();
    },
  },
});
