import logging
from z3c.sqlalchemy import createSAWrapper
from zope.component import getUtility
from affinitic.pwmanager.interfaces import IPasswordManager

LOGGER = 'clpsbw.db.pgsql'
logging.getLogger(LOGGER).info('clpsbw.db.pgsql - Installing Product')


def initialize(context):
    pwManager = getUtility(IPasswordManager, 'pg')
    connString = 'postgres://%s@localhost/clpsbw' % pwManager.getLoginPassWithSeparator(':')
    wr = createSAWrapper(connString,
                        forZope=True,
                        echo=False,
                        engine_options = {'convert_unicode': True},
                        name='clpsbw',
                        model='clpsbwMappings')
