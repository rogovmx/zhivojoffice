#!/usr/bin/env ruby
require 'OrdersDriver.rb'

endpoint_url = ARGV.shift
obj = OrdersPortType.new(endpoint_url)

# run ruby with -d to see SOAP wiredumps.
obj.wiredump_dev = STDERR if $DEBUG

# SYNOPSIS
#   NewOrder(parameters)
#
# ARGS
#   parameters      NewOrder - {http://192.168.0.15}NewOrder
#
# RETURNS
#   parameters      NewOrderResponse - {http://192.168.0.15}NewOrderResponse
#
parameters = nil
puts obj.newOrder(parameters)

# SYNOPSIS
#   NewCorrect(parameters)
#
# ARGS
#   parameters      NewCorrect - {http://192.168.0.15}NewCorrect
#
# RETURNS
#   parameters      NewCorrectResponse - {http://192.168.0.15}NewCorrectResponse
#
parameters = nil
puts obj.newCorrect(parameters)

# SYNOPSIS
#   GetContactors(parameters)
#
# ARGS
#   parameters      GetContactors - {http://192.168.0.15}GetContactors
#
# RETURNS
#   parameters      GetContactorsResponse - {http://192.168.0.15}GetContactorsResponse
#
parameters = nil
puts obj.getContactors(parameters)

# SYNOPSIS
#   GetOrder(parameters)
#
# ARGS
#   parameters      GetOrder - {http://192.168.0.15}GetOrder
#
# RETURNS
#   parameters      GetOrderResponse - {http://192.168.0.15}GetOrderResponse
#
parameters = nil
puts obj.getOrder(parameters)

# SYNOPSIS
#   NewContactors(parameters)
#
# ARGS
#   parameters      NewContactors - {http://192.168.0.15}NewContactors
#
# RETURNS
#   parameters      NewContactorsResponse - {http://192.168.0.15}NewContactorsResponse
#
parameters = nil
puts obj.newContactors(parameters)

# SYNOPSIS
#   NewContacts(parameters)
#
# ARGS
#   parameters      NewContacts - {http://192.168.0.15}NewContacts
#
# RETURNS
#   parameters      NewContactsResponse - {http://192.168.0.15}NewContactsResponse
#
parameters = nil
puts obj.newContacts(parameters)

# SYNOPSIS
#   NewAccount(parameters)
#
# ARGS
#   parameters      NewAccount - {http://192.168.0.15}NewAccount
#
# RETURNS
#   parameters      NewAccountResponse - {http://192.168.0.15}NewAccountResponse
#
parameters = nil
puts obj.newAccount(parameters)

# SYNOPSIS
#   NewDogovor(parameters)
#
# ARGS
#   parameters      NewDogovor - {http://192.168.0.15}NewDogovor
#
# RETURNS
#   parameters      NewDogovorResponse - {http://192.168.0.15}NewDogovorResponse
#
parameters = nil
puts obj.newDogovor(parameters)

# SYNOPSIS
#   NewPoint(parameters)
#
# ARGS
#   parameters      NewPoint - {http://192.168.0.15}NewPoint
#
# RETURNS
#   parameters      NewPointResponse - {http://192.168.0.15}NewPointResponse
#
parameters = nil
puts obj.newPoint(parameters)

# SYNOPSIS
#   GetOstatok(parameters)
#
# ARGS
#   parameters      GetOstatok - {http://192.168.0.15}GetOstatok
#
# RETURNS
#   parameters      GetOstatokResponse - {http://192.168.0.15}GetOstatokResponse
#
parameters = nil
puts obj.getOstatok(parameters)

# SYNOPSIS
#   GetDocuments(parameters)
#
# ARGS
#   parameters      GetDocuments - {http://192.168.0.15}GetDocuments
#
# RETURNS
#   parameters      GetDocumentsResponse - {http://192.168.0.15}GetDocumentsResponse
#
parameters = nil
puts obj.getDocuments(parameters)


endpoint_url = ARGV.shift
obj = OrdersPortType.new(endpoint_url)

# run ruby with -d to see SOAP wiredumps.
obj.wiredump_dev = STDERR if $DEBUG

# SYNOPSIS
#   NewOrder(parameters)
#
# ARGS
#   parameters      NewOrder - {http://192.168.0.15}NewOrder
#
# RETURNS
#   parameters      NewOrderResponse - {http://192.168.0.15}NewOrderResponse
#
parameters = nil
puts obj.newOrder(parameters)

# SYNOPSIS
#   NewCorrect(parameters)
#
# ARGS
#   parameters      NewCorrect - {http://192.168.0.15}NewCorrect
#
# RETURNS
#   parameters      NewCorrectResponse - {http://192.168.0.15}NewCorrectResponse
#
parameters = nil
puts obj.newCorrect(parameters)

# SYNOPSIS
#   GetContactors(parameters)
#
# ARGS
#   parameters      GetContactors - {http://192.168.0.15}GetContactors
#
# RETURNS
#   parameters      GetContactorsResponse - {http://192.168.0.15}GetContactorsResponse
#
parameters = nil
puts obj.getContactors(parameters)

# SYNOPSIS
#   GetOrder(parameters)
#
# ARGS
#   parameters      GetOrder - {http://192.168.0.15}GetOrder
#
# RETURNS
#   parameters      GetOrderResponse - {http://192.168.0.15}GetOrderResponse
#
parameters = nil
puts obj.getOrder(parameters)

# SYNOPSIS
#   NewContactors(parameters)
#
# ARGS
#   parameters      NewContactors - {http://192.168.0.15}NewContactors
#
# RETURNS
#   parameters      NewContactorsResponse - {http://192.168.0.15}NewContactorsResponse
#
parameters = nil
puts obj.newContactors(parameters)

# SYNOPSIS
#   NewContacts(parameters)
#
# ARGS
#   parameters      NewContacts - {http://192.168.0.15}NewContacts
#
# RETURNS
#   parameters      NewContactsResponse - {http://192.168.0.15}NewContactsResponse
#
parameters = nil
puts obj.newContacts(parameters)

# SYNOPSIS
#   NewAccount(parameters)
#
# ARGS
#   parameters      NewAccount - {http://192.168.0.15}NewAccount
#
# RETURNS
#   parameters      NewAccountResponse - {http://192.168.0.15}NewAccountResponse
#
parameters = nil
puts obj.newAccount(parameters)

# SYNOPSIS
#   NewDogovor(parameters)
#
# ARGS
#   parameters      NewDogovor - {http://192.168.0.15}NewDogovor
#
# RETURNS
#   parameters      NewDogovorResponse - {http://192.168.0.15}NewDogovorResponse
#
parameters = nil
puts obj.newDogovor(parameters)

# SYNOPSIS
#   NewPoint(parameters)
#
# ARGS
#   parameters      NewPoint - {http://192.168.0.15}NewPoint
#
# RETURNS
#   parameters      NewPointResponse - {http://192.168.0.15}NewPointResponse
#
parameters = nil
puts obj.newPoint(parameters)

# SYNOPSIS
#   GetOstatok(parameters)
#
# ARGS
#   parameters      GetOstatok - {http://192.168.0.15}GetOstatok
#
# RETURNS
#   parameters      GetOstatokResponse - {http://192.168.0.15}GetOstatokResponse
#
parameters = nil
puts obj.getOstatok(parameters)

# SYNOPSIS
#   GetDocuments(parameters)
#
# ARGS
#   parameters      GetDocuments - {http://192.168.0.15}GetDocuments
#
# RETURNS
#   parameters      GetDocumentsResponse - {http://192.168.0.15}GetDocumentsResponse
#
parameters = nil
puts obj.getDocuments(parameters)


