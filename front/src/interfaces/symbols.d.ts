export interface Symbol {
    leverage: number,
    marginMaintenance: number,
    percentage: number,
    pipsPrecision: number,
    expiration: string | null,
    contractSize: number,
    profitMode: ProfitMode,
    swapLong: number,
    groupName: string,
    type: number,
    lotMin: number,
    longOnly: boolean,
    currency: string,
    tickSize: number,
    lotStep: number,
    quoteId: string,
    marginHedgedStrong: boolean,
    stepRuleId: number,
    timeString: string,
    currencyProfit: string,
    symbol: string,
    marginMode: string,
    precision: number,
    stopsLevel: number,
    spreadTable: number,
    high: number,
    spreadRaw: number,
    starting: string | null,
    shortSelling: boolean,
    currencyPair: boolean,
    initialMargin: number,
    tickValue: number,
    bid: number,
    low: number,
    ask: number,
    trailingEnabled: boolean,
    description: string,
    marginHedged: number,
    lotMax: number,
    swapType: number,
    swapShort: number,
    swapEnable: boolean,
    time: string,
    categoryName: string,
    swapRollover3Days: number,
    instantMaxVolume: number
}

export enum ProfitMode {
    "cfd"
}

export interface SymbolGroup {
    groupName: string
}

export interface SymbolCategory {
    categoryName: string
}

export interface SymbolFilterProps {
    groupName: string
    categoryName: string
}