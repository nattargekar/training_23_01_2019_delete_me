view: order {
  sql_table_name: dbo."Order" ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.Id ;;
  }

  dimension: customer_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.CustomerId ;;
  }

  dimension_group: order {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.OrderDate ;;
  }

  dimension: order_number {
    type: string
    sql: ${TABLE}.OrderNumber ;;
  }

  dimension: total_amount {
    type: number
    sql: ${TABLE}.TotalAmount ;;
  }

  measure: count {
    type: count
    drill_fields: [id, customer.id, customer.first_name, customer.last_name, order_item.count]
  }
}
