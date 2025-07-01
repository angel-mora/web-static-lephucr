import { Options as ExplorerOptions } from "./quartz/components/ExplorerNode"
import { QuartzPluginData } from "./quartz/plugins/vfile"

export const sortExplorer: ExplorerOptions["sortFn"] = (a, b) => {
  const orderA = a.file?.frontmatter?.order ?? Number.MAX_SAFE_INTEGER
  const orderB = b.file?.frontmatter?.order ?? Number.MAX_SAFE_INTEGER
  if (orderA !== orderB) {
    return orderA - orderB
  }

  if ((!a.file && !b.file) || (a.file && b.file)) {
    return a.displayName.localeCompare(b.displayName, undefined, {
      numeric: true,
      sensitivity: "base",
    })
  }
  if (a.file && !b.file) {
    return 1
  } else {
    return -1
  }
}

export const sortPagesByOrder = (f1: QuartzPluginData, f2: QuartzPluginData): number => {
  const o1 = f1.frontmatter?.order ?? Number.MAX_SAFE_INTEGER
  const o2 = f2.frontmatter?.order ?? Number.MAX_SAFE_INTEGER
  if (o1 !== o2) {
    return o1 - o2
  }
  const t1 = (f1.frontmatter?.title ?? "").toLowerCase()
  const t2 = (f2.frontmatter?.title ?? "").toLowerCase()
  return t1.localeCompare(t2)
}
