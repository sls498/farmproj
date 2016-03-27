# SQLAlchemy Model creation

from flask.ext.sqlalchemy import SQLAlchemy
#from sqlalchemy import Table, Column, Integer, Float, ForeignKey, String
#from sqlalchemy.orm import relationship, backref
#from flask.ext.script import Manager

db = SQLAlchemy()

class Artist(db.Model):
    __tablename__ = 'artist'

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(256), nullable=False)
    editions_FK = db.relationship('Edition', backref ='artist', lazy='dynamic')

    def __repr__(self):
        return "[Artist: id={}, name={}]".format(self.id, self.name)

class Set(db.Model):
    __tablename__ = 'set'

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(256), nullable=False)
    editions_FK = db.relationship('Edition', backref ='set', lazy='dynamic')

    def __repr__(self):
        return "[Set: id={}, name={}]".format(self.id, self.name)

class Card(db.Model):
    __tablename__ = 'card'

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(256), nullable=False)
    url = db.Column(db.String(256), nullable=False)
    store_url = db.Column(db.String(256), nullable=False)
    colors = db.Column(db.String(256), nullable=False)
    cost = db.Column(db.String(256), nullable=False)
    cnc = db.Column(db.Integer, nullable=False)
    editions_FK = db.relationship('Edition', backref ='card', lazy='dynamic')

    def __repr__(self):
        return "[Card: id={}, name={}, url={}, store_url={}, colors={}, cost={}, cnc={}]".format(self.id, self.name, self.url, self.store_url, self.colors, self.cost, self.cnc)

class Edition(db.Model):
    __tablename__ = 'edition'

    multiverse_id = db.Column(db.Integer, primary_key=True)
    artist_id = db.Column(db.Integer, db.ForeignKey('artist.id'))
    set_id = db.Column(db.Integer, db.ForeignKey('set.id'))
    card_id = db.Column(db.Integer, db.ForeignKey('card.id'))

    def __repr__(self):
        return "[Artist: id={}, name={}]".format(self.id, self.name)
